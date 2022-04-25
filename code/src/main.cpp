#include <climits>
#include <string>
#include <vector>
#include <set>
#include <map>
#include <istream>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <chrono>
#include <iomanip>
#include <math.h>

#include "directed_graph.h"
#include "util.h"

// pandPI code for storing an HTN planning model
#include "../../pandaPIengine/src/Model.h"
#include "../../pandaPIengine/src/intDataStructures/IntPairHeap.h"
#include "../../pandaPIengine/src/ProgressionNetwork.h"
#include "../../pandaPIengine/src/flags.h"
#include "../../pandaPIengine/src/intDataStructures/noDelIntSet.h"
#include "../../pandaPIengine/src/intDataStructures/FlexIntStack.h"
#include "../../pandaPIengine/src/intDataStructures/IntUtil.h"
#include "../../pandaPIengine/src/intDataStructures/StringUtil.h"

using namespace std;

progression::Model *setup_model(string fileName)
{
       bool trackTasksInTN = false;
       progression::eMaintainTaskReachability maintainTaskReachability = mtrNO; // enum eMaintainTaskReachability {mtrNO, mtrACTIONS, mtrALL};
       bool progressEffectLess = false;
       bool progressOneModActions = false;
       progression::Model *m = new Model(trackTasksInTN, maintainTaskReachability, progressEffectLess, progressOneModActions);
       m->isHtnModel = true;

       std::ifstream fileStream;
       fileStream.open(fileName);
       if (fileStream.is_open())
       {
              printf("The problem file %s was opened successfully.", fileName.c_str());
              m->read(&fileStream);
       }
       else
       {
              printf("Could not open the specified file, %s", fileName.c_str());
       }

       return m;
}

void get_t_pre_eff_(int collect_to_task, int task_to_explore, bool *visited, bool ***all_pre_eff, Model *m, ofstream &o)
{
       if (!(visited[task_to_explore]))
       {
              visited[task_to_explore] = true;
              // add prec/eff of primitive
              if ((*m).isPrimitive[task_to_explore])
              {
                     // yes/no for integer variable that they act on
                     for (int j = 0; j < (*m).numPrecs[task_to_explore]; j++)
                     {
                            int prec = (*m).precLists[task_to_explore][j];
                            all_pre_eff[0][collect_to_task][prec] = true;
                     }
                     for (int j = 0; j < (*m).numAdds[task_to_explore]; j++) // adds
                     {
                            int add = (*m).addLists[task_to_explore][j];
                            all_pre_eff[1][collect_to_task][add] = true;
                     }
                     for (int j = 0; j < (*m).numDels[task_to_explore]; j++) // deletes
                     {
                            int del = (*m).delLists[task_to_explore][j];
                            all_pre_eff[2][collect_to_task][del] = true;
                     }
              }
              // investigate every other subtask it can decompose to
              else
              {
                     int *more_methods = (*m).taskToMethods[task_to_explore];
                     for (int j = 0; j < (*m).numMethodsForTask[task_to_explore]; j++)
                     {
                            int mm = more_methods[j];
                            for (int k = 0; k < (*m).numSubTasks[mm]; k++)
                            {
                                   int next_task = (*m).subTasks[mm][k];
                                   get_t_pre_eff_(collect_to_task, next_task, visited, all_pre_eff, m, o); // passes ptr, all_pre_eff changes kept
                            }
                     }
              }
       } // return all_pre_eff
}

// WRAPPER FOR PREVIOUS FUNCTION
bool ***get_task_pre_eff(Model *m, bool ***all_pre_eff, ofstream &o)
{
       // collect pre_eff for all tasks
       for (int t = 0; t < (*m).numTasks; t++)
       {
              int task_to_explore = t;
              bool *visited = new bool[(*m).numTasks];
              get_t_pre_eff_(t, task_to_explore, visited, all_pre_eff, m, o);
       }
       return all_pre_eff;
}

// this could be bool **,  adjacency graph for a methods subtasks
void find_orderings_(Model *m, int method, bool ***tasks_pre_eff, bool ***orderings, ofstream &o)
{
       // consider one subtasks
       for (int i = 0; i < (*m).numSubTasks[method]; i++)
       {
              int subtask_pos = i; // its position among subtasks
              int subtask = (*m).subTasks[method][i];
              // compared to other subtasks in that method
              for (int j = 0; j < (*m).numSubTasks[method]; j++)
              {
                     if (i != j) // not against yourself
                     {
                            int other_subtask_pos = j;
                            int other_subtask = (*m).subTasks[method][j];

                            for (int v = 0; v < (*m).numStateBits; v++)
                            {
                                   //// * For each add effect a of c
                                   bool add_effect = tasks_pre_eff[1][subtask][v];
                                   if (add_effect)
                                   {
                                          // move all other subtasks with precondition a behind c
                                          bool prec = tasks_pre_eff[0][other_subtask][v];
                                          if (prec)
                                          {
                                                 orderings[method][subtask_pos][other_subtask_pos] = true; // edge e1 = edge(subtask_pos, other_subtask_pos);   orderings[method].insert
                                          }
                                          //  and all other sub tasks with a delete effect in front of it.
                                          bool del_effect_ = tasks_pre_eff[2][other_subtask][v];
                                          if (del_effect_)
                                          {
                                                 orderings[method][other_subtask_pos][subtask_pos] = true;
                                          }
                                   }

                                   //// * For each delete effect d of c
                                   bool del_effect = tasks_pre_eff[2][subtask][v];
                                   if (del_effect)
                                   {
                                          // move all tasks with precondition d before c
                                          bool prec_ = tasks_pre_eff[0][other_subtask][v];
                                          if (prec_)
                                          {
                                                 orderings[method][other_subtask_pos][subtask_pos] = true;
                                          }

                                          // and all tasks with an add effect behind it.
                                          bool add_ = tasks_pre_eff[1][other_subtask][v];
                                          if (add_)
                                          {
                                                 orderings[method][subtask_pos][other_subtask_pos] = true;
                                          }
                                   }
                            }
                     }
              }
       } // return orderings;
}

void find_orderings(Model *m, bool ***tasks_pre_eff, bool ***orderings_per_method, ofstream &o)
{
       // get orderings for each method
       for (int method = 0; method < (*m).numMethods; method++)
       {
              find_orderings_(m, method, tasks_pre_eff, orderings_per_method, o);
       }
}

// search for and break cycles in the set of orderings
// adds new ordering to linearised_orderings
// returns bool whether it needed to cycle break or not
bool generate_total_ordering_(Model *m, int method, bool ***old_orderings, bool ***linearised_orderings, ofstream &o)
{
       std::set<edge> edges;
       bool needed_cycle_break = false;
       //  first priority to respect: (*m).orderings
       // (can't be overwritten later)
       for (int i = 0; i < (*m).numOrderings[method] - 1; i += 2)
       {
              int o1 = (*m).ordering[method][i];
              int o2 = (*m).ordering[method][i + 1]; // subtask ids
              edge edge(o1, o2, 0);
              edges.insert(edge);
       }

       //  second priority to respect: output of find_orderings
       // (cannot overwrite previous edges (i.e. already assigned a higher priority) )
       for (int i = 0; i < (*m).numSubTasks[method]; i++)
       {
              for (int j = 0; j < (*m).numSubTasks[method]; j++)
              {
                     if (old_orderings[method][i][j])
                     {
                            // we take the subtask ids in the method - just want small subgraph
                            edge edge(i, j, 1);
                            edges.insert(edge);
                     }
              }
       }

       // find and break cycles in proposed orderings (without affecting required orderings)
       int V = (*m).numSubTasks[method];
       std::set<edge> new_orderings = break_cycle(edges, V);
       if (new_orderings != edges)
       {
              needed_cycle_break = true;
       }

       // make new orderings totally ordered
       Graph g2((*m).numSubTasks[method]);
       for (auto e : new_orderings)
              g2.addEdge(e.start, e.end, 0);
       stack<int> Stack = g2.topologicalSort();

       // return topological ordering in adj matrix format
       int first = Stack.top();
       Stack.pop();
       while (Stack.empty() == false)
       {
              int second = Stack.top();
              linearised_orderings[method][first][second] = true;
              first = second;
              Stack.pop();
       }
       return needed_cycle_break;
}

// WRAPPER FUNCTION FOR PREVIOUS
int generate_total_ordering(Model *m, bool ***old_orderings, bool ***linearised_orderings, ofstream &o)
{
       int i = 0;
       // get orderings for each method
       for (int method = 0; method < (*m).numMethods; method++)
       {
              if (generate_total_ordering_(m, method, old_orderings, linearised_orderings, o))
              {
                     i++;
              }
       }
       return i;
}

void make_linearized_model(Model *m, bool ***linearised_orderings, ofstream &o)
{
       // delete the old orderings of the methods
       delete[](*m).ordering;
       (*m).ordering = new int *[(*m).numMethods];

       // insert the new orderings of the methods
       for (int method = 0; method < (*m).numMethods; method++)
       {
              std::vector<int> orderings_vec; // for this method
              for (int i = 0; i < (*m).numSubTasks[method]; i++)
              {
                     for (int j = 0; j < (*m).numSubTasks[method]; j++)
                     {
                            if (linearised_orderings[method][i][j])
                            {
                                   orderings_vec.push_back(i);
                                   orderings_vec.push_back(j); // orderings relative to subtask ids
                            }
                     }
              }
              (*m).numOrderings[method] = orderings_vec.size();           // new size of ordering
              (*m).ordering[method] = new int[(*m).numOrderings[method]]; // new ordering array
              for (int i = 0; i < orderings_vec.size(); i++)
              {
                     (*m).ordering[method][i] = orderings_vec[i];
              }
       } // return m;
}

int main(int argc, char *argv[])
{
       if (argc <= 3)
       {
              printf("You need to pass in a sas problem file, name of the timings file, and name of the new pddl file (without file extnesion)");
              return 1;
       }

       char *problem = argv[1];
       char *timing_file = argv[2];
       char *out_name = argv[3];
       printf(" %s", problem);
       Model *m = setup_model(problem);

       bool collect_statistics = true;
       ofstream o; // ofstream is the class for fstream package
       float timings[10];
       if (collect_statistics)
       {

              o.open(timing_file, std::ios_base::app);
              if (!(o.is_open()))
              {
                     printf("Could not open timings file");
                     return 0;
              }
       }

       auto start_all = std::chrono::high_resolution_clock::now();
       // get preconditions and effects
       auto start = std::chrono::high_resolution_clock::now();

       // set up storage
       int T = (*m).numTasks;
       int V = (*m).numStateBits;
       bool ***all_pre_eff = new bool **[3]; // [3][numTasks][numStateBits]
       for (int i = 0; i < 3; i++)
       {
              all_pre_eff[i] = new bool *[T];
              for (int t = 0; t < (*m).numTasks; t++)
              {
                     all_pre_eff[i][t] = new bool[V]{false};
              }
       }

       get_task_pre_eff(m, all_pre_eff, o); // get
       auto stop = std::chrono::high_resolution_clock::now();
       auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       float d = static_cast<float>(duration.count()) / 1000000.0;
       timings[0] = d;

       // //test output
       // int task = 52;
       // printf("Collected preconditions and effects of Task %i\n", task);
       // for (int i = 0; i < 3; i++)
       // {
       //        for (int k = 0; k < (*m).numStateBits; k++)
       //        {
       //               if (all_pre_eff[i][task][k])
       //               {
       //                      printf("%i ", k);
       //               }
       //        }
       //        printf("\n");
       // }
       // //test output

       // get orderings
       start = std::chrono::high_resolution_clock::now();
       // set up storage
       bool ***orderings_per_method = new bool **[(*m).numMethods];
       for (int method = 0; method < (*m).numMethods; method++)
       {
              orderings_per_method[method] = new bool *[(*m).numSubTasks[method]];
              for (int i = 0; i < (*m).numSubTasks[method]; i++)
              {
                     orderings_per_method[method][i] = new bool[(*m).numSubTasks[method]]{0};
              }
       }
       start = std::chrono::high_resolution_clock::now();
       find_orderings(m, all_pre_eff, orderings_per_method, o); // get
       // delete storage
       T = (*m).numTasks;
       V = (*m).numStateBits;
       for (int i = 0; i < 3; i++)
       {
              for (int t = 0; t < (*m).numTasks; t++)
              {
                     delete all_pre_eff[i][t];
              }
              delete[] all_pre_eff[i];
       }
       delete[] all_pre_eff;

       stop = std::chrono::high_resolution_clock::now();
       duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       d = static_cast<float>(duration.count()) / 1000000.0;
       timings[1] = d;

       // // get linearised orderings
       // set up storage
       bool ***linearised_orderings = new bool **[(*m).numMethods];
       for (int method = 0; method < (*m).numMethods; method++)
       {
              linearised_orderings[method] = new bool *[(*m).numSubTasks[method]];
              for (int i = 0; i < (*m).numSubTasks[method]; i++)
              {
                     linearised_orderings[method][i] = new bool[(*m).numSubTasks[method]]{0};
              }
       }
       start = std::chrono::high_resolution_clock::now();
       int methods_broken = generate_total_ordering(m, orderings_per_method, linearised_orderings, o); // get
       // delete storage
       for (int method = 0; method < (*m).numMethods; method++)
       {
              for (int i = 0; i < (*m).numSubTasks[method]; i++)
              {
                     delete orderings_per_method[method][i];
              }
              delete[] orderings_per_method[method];
       }
       delete[] orderings_per_method;
       stop = std::chrono::high_resolution_clock::now();
       duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       d = static_cast<float>(duration.count()) / 1000000.0;
       timings[2] = d;

       start = std::chrono::high_resolution_clock::now();
       make_linearized_model(m, linearised_orderings, o);
       // delete storage
       for (int method = 0; method < (*m).numMethods; method++)
       {
              for (int i = 0; i < (*m).numSubTasks[method]; i++)
              {
                     delete linearised_orderings[method][i];
              }
              delete[] linearised_orderings[method];
       }
       delete[] linearised_orderings;
       stop = std::chrono::high_resolution_clock::now();
       duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       d = static_cast<float>(duration.count()) / 1000000.0;
       timings[3] = d;
       // string out_name_str = out_name;
       // string domain_name = "linearized-domains/" + out_name_str + "-TO-domain.pddl";
       // string problem_name = "linearized-problems/" + out_name_str + "-TO.pddl";
       // m->writeToPDDL(domain_name, problem_name);


       auto stop_all = std::chrono::high_resolution_clock::now();
       duration = std::chrono::duration_cast<std::chrono::microseconds>(stop_all - start_all);
       d = static_cast<float>(duration.count()) / 1000000.0;
       timings[4] = d;

       // collect statistics
       if (o.is_open())
       {
              // methods  information
              int total = (*m).numMethods;
              int max = 0;
              int min = 9999999;
              int sum = 0;
              for (int method = 0; method < (*m).numMethods; method++)
              {
                     if (max < (*m).numSubTasks[method])
                     {
                            max = (*m).numSubTasks[method];
                     }
                     if (min > (*m).numSubTasks[method])
                     {
                            min = (*m).numSubTasks[method];
                     }
                     sum += (*m).numSubTasks[method];
              }
              float avg = static_cast<float>(sum) / static_cast<float>((*m).numMethods);

              o << (*m).numTasks << ", " << (*m).numMethods << ", " << min << ", " << max << ", " << avg << ", ";
              o << methods_broken << ", ";

              int big_method_num = 0;
              for (int method = 0; method < (*m).numMethods; method++)
              {
                     if ((*m).numSubTasks[method] > 1)
                     {
                            big_method_num++; // number of methods with more than one subtask
                     }
              }
              o << big_method_num << ", ";


              Graph g((*m).numTasks);
              for (int method = 0; method < (*m).numMethods; method++)
              {
                     int parent = (*m).decomposedTask[method];
                     for (int child_pos = 0; child_pos < (*m).numSubTasks[method]; child_pos++)
                     {
                            int child = (*m).subTasks[method][child_pos];
                            g.addEdge(parent, child, 0);
                     }
              }
              std::vector<edge> back_edges = g.findAllCycles((*m).initialTask);
              o << (back_edges.size() > 0) << ", "; // if it has back edges, it is recursive, => "true"

              int height = g.findGraphHeight((*m).initialTask);
              o << (height - 1) << ", ";

              o << timings[0] << ", " << timings[1] << ", " << timings[2] << ", " << timings[3] << ", " << timings[4] << ", ";

              o.close();

              cout << "Preprocessing time: " << timings[4] << "\n";
       }

       // if (!(collect_statistics))
       // {

       //        printf("After linearise \n");
       //        int methods_to_display = min((*m).numMethods, 20);
       //        for (int method = 0; method < (*m).numMethods; method++)
       //        {
       //               if (true) //((2 * ((*m).numSubTasks[method] - 1)) == (*m).numOrderings[method])
       //               {
       //                      // method is only partially ordered
       //                      // methods_to_display--;
       //                      for (int i = 0; i < (*m).numOrderings[method]; i++)
       //                      {
       //                             printf("%i ", (*m).ordering[method][i]);
       //                      }
       //                      printf(" (%i) \n", (*m).numSubTasks[method]);
       //               }
       //        }
       // }
}