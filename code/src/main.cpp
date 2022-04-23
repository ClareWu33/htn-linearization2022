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

void get_t_pre_eff_(int collect_to_task, int task_to_explore, bool *visited, Model *m, bool ***all_pre_eff, bool collect_statistics)
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
                                   get_t_pre_eff_(collect_to_task, next_task, visited, m, all_pre_eff, collect_statistics); // passes ptr, all_pre_eff changes kept
                            }
                     }
              }
       } // return all_pre_eff
}

// WRAPPER FOR PREVIOUS FUNCTION
bool ***get_t_pre_eff(int collect_to_task, Model *m, bool ***all_pre_eff, bool collect_statistics = false)
{
       int task_to_explore = collect_to_task;
       bool *visited = new bool[(*m).numTasks];
       get_t_pre_eff_(collect_to_task, task_to_explore, visited, m, all_pre_eff, collect_statistics);

       return all_pre_eff;
}

// // Each such non-negative integer $i$ describes that the state feature $i$ is a precondition of this action.
// // orderings [per method] <array of order pairs>  <- accumulate order pairs
// test new find_orderings

// this could be int ***,  adjacency graph per method
std::set<edge> *find_orderings(Model *m, bool ***tasks_pre_eff, bool collect_statistics = false)
{
       // additional orderings per method
       std::set<edge> *orderings = new ::std::set<edge>[(*m).numMethods];

       //  iterate through every method and its "preconditions and effects"
       for (int method = 0; method < (*m).numMethods; method++)
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
                                                        edge e1 = edge(subtask_pos, other_subtask_pos);
                                                        orderings[method].insert(e1);
                                                 }
                                                 //  and all other sub tasks with a delete effect in front of it.
                                                 bool del_effect_ = tasks_pre_eff[2][other_subtask][v];
                                                 if (del_effect_)
                                                 {
                                                        edge e2 = edge(other_subtask_pos, subtask_pos);
                                                        orderings[method].insert(e2);
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
                                                        edge e2 = edge(other_subtask_pos, subtask_pos);
                                                        orderings[method].insert(e2);
                                                 }

                                                 // and all tasks with an add effect behind it.
                                                 bool add_ = tasks_pre_eff[1][other_subtask][v];
                                                 if (add_)
                                                 {
                                                        edge e1 = edge(subtask_pos, other_subtask_pos);
                                                        orderings[method].insert(e1);
                                                 }
                                          }
                                   }
                            }
                     }
              }
       }
       return orderings;
}

/*
bool ***find_orderings2(Model *m, bool ***tasks_pre_eff, bool collect_statistics = false)
{
       // additional orderings per method
       bool ***orderings = new ::std::set<edge>[(*m).numMethods];

       //  iterate through every method and its "preconditions and effects"
       for (int method = 0; method < (*m).numMethods; method++)
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
                                                        edge e1 = edge(subtask_pos, other_subtask_pos);
                                                        orderings[method].insert(e1);
                                                 }
                                                 //  and all other sub tasks with a delete effect in front of it.
                                                 bool del_effect_ = tasks_pre_eff[2][other_subtask][v];
                                                 if (del_effect_)
                                                 {
                                                        edge e2 = edge(other_subtask_pos, subtask_pos);
                                                        orderings[method].insert(e2);
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
                                                        edge e2 = edge(other_subtask_pos, subtask_pos);
                                                        orderings[method].insert(e2);
                                                 }

                                                 // and all tasks with an add effect behind it.
                                                 bool add_ = tasks_pre_eff[1][other_subtask][v];
                                                 if (add_)
                                                 {
                                                        edge e1 = edge(subtask_pos, other_subtask_pos);
                                                        orderings[method].insert(e1);
                                                 }
                                          }
                                   }
                            }
                     }
              }
       }
       return orderings;
}
*/

// search for cycles in the set of orderings
// no cycles use this linearization,  OR random break
void generate_total_ordering(Model *m, std::set<edge> *old_orderings, std::vector<edge> *linearised_orderings, bool collect_statistics = false)
{
       for (int method = 0; method < (*m).numMethods; method++)
       {
              std::set<edge> edges;

              //  first priority to respect: (*m).orderings
              // (can't be overwritten later)
              for (int i = 0; i < (*m).numOrderings[method] - 1; i += 2)
              {
                     int o1 = (*m).ordering[method][i];
                     int o2 = (*m).ordering[method][i + 1];
                     edge edge(o1, o2, 0);
                     edges.insert(edge);
              }

              //  second priority to respect: output of find_orderings
              // (cannot overwrite previous edges (i.e. already assigned a higher priority) )
              for (auto e : old_orderings[method])
              {
                     edge edge(e.start, e.end, 1);
                     edges.insert(edge);
              }

              // find and break cycles in proposed orderigns (without affecting required orderings)
              std::set<edge> *new_orderings = new std::set<edge>[(*m).numMethods];
              int V = (*m).numSubTasks[method];
              new_orderings[method] = break_cycle(edges, V);

              // make new orderings totally ordered
              Graph g2((*m).numSubTasks[method]);
              for (auto e : new_orderings[method])
                     g2.addEdge(e.start, e.end, 0);
              delete[] new_orderings;
              stack<int> Stack = g2.topologicalSort();

              // return topological ordering in 'edge' format
              int first = Stack.top();
              Stack.pop();
              while (Stack.empty() == false)
              {
                     int second = Stack.top();
                     edge e(first, second);
                     linearised_orderings[method].push_back(e);
                     first = second;
                     Stack.pop();
              }
       } // return linearised_orderings;
}

void make_linearized_model(Model *m, std::vector<edge> *linearised_orderings, bool collect_statistics = false)
{
       delete[](*m).ordering;
       (*m).ordering = new int *[(*m).numMethods];
       for (int method = 0; method < (*m).numMethods; method++)
       {
              (*m).numOrderings[method] = 2 * linearised_orderings[method].size(); // new size of ordering
              (*m).ordering[method] = new int[(*m).numOrderings[method]];          // new ordering array
              for (int i = 0; i < linearised_orderings[method].size(); i++)
              {
                     (*m).ordering[method][2 * i] = linearised_orderings[method][i].start;
                     (*m).ordering[method][2 * i + 1] = linearised_orderings[method][i].end;
              }
       } // return m;
}

int main(int argc, char *argv[])
{
       if (argc <= 1)
       {
              printf("You need to pass in a sas problem file.");
              return 1;
       }

       char *problem = argv[1];
       printf(" %s", problem);
       Model *m = setup_model(problem);

       // step 0  (prepare storage for results)
       int t = (*m).numTasks;
       int v = (*m).numStateBits;
       bool ***all_pre_eff = new bool **[3]; // [3][numTasks][numStateBits]
       for (int i = 0; i < 3; i++)
       {
              all_pre_eff[i] = new bool *[t];
              for (int j = 0; j < (*m).numTasks; j++)
              {
                     all_pre_eff[i][j] = new bool[v]{false};
              }
       }

       bool *** ordering_per_method = new bool **[(*m).numMethods];
       for (int method=0; method<(*m).numMethods; method++) {
              ordering_per_method[method] = new bool * [(*m).numSubTasks[method]];
              for (int i=0; i<(*m).numSubTasks[method]; i++) {
                     ordering_per_method[method][i] = new bool [(*m).numSubTasks[method]];
              }
       }
       ordering_per_method[0][11][11];
       if (ordering_per_method[10][5][5]) {
              printf("true");
       } else {
              printf("false");
       }

       // // get preconditions and effects
       // auto start = std::chrono::high_resolution_clock::now();
       // for (int node = 0; node < (*m).numTasks; node++)
       // {
       //        get_t_pre_eff(node, m, all_pre_eff);
       // }
       // auto stop = std::chrono::high_resolution_clock::now();
       // auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       // float d = static_cast<float>(duration.count())/1000000.0;
       // cout << (d) << " seconds to find all pred eff\n";
 
       // start = std::chrono::high_resolution_clock::now();
       // std::set<edge> *orderings = find_orderings(m, all_pre_eff);
       // stop = std::chrono::high_resolution_clock::now();
       // duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       // float d = static_cast<float>(duration.count())/1000000.0;
       // cout << (d) << " seconds to find orderings suggested by pred eff\n";

       // start = std::chrono::high_resolution_clock::now();
       // std::vector<edge> *linearised_orderings = new vector<edge>[(*m).numMethods];
       // generate_total_ordering(m, orderings, linearised_orderings);
       // stop = std::chrono::high_resolution_clock::now();
       // duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       // float d = static_cast<float>(duration.count())/1000000.0;
       // cout << (d) << " seconds to break cycles in methods and topSort\n";

       // start = std::chrono::high_resolution_clock::now();
       // make_linearized_model(m, linearised_orderings);
       // stop = std::chrono::high_resolution_clock::now();
       // duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       // float d = static_cast<float>(duration.count())/1000000.0;
       // cout << (d) << " seconds to generate a new model m\n";
       // delete[] linearised_orderings;

       // for (int i = 0; i < 3; i++)
       // {
       //        for (int k = 0; k < (*m).numStateBits; k++)
       //        {
       //               if (all_pre_eff[i][67010][k])
       //               {
       //                      printf("%i ", k);
       //               }
       //        }
       //        printf("\n");
       // }


       //        // linearize_model(m, linearised_orderings);
       //        // printf("After linearise \n");
       //        // for (int method=0; method<(*m).numMethods; method++) {
       //        //        for (int i=0; i<(*m).numOrderings[method]; i++) {
       //        //               printf("%i ", (*m).ordering[method][i]);
       //        //        }
       //        //        printf("\n");
       //        // }

       //        string domain_name = "linearized-domains/" + sas_file + "-TO-domain.pddl";
       //        string problem_name = "linearized-problems/" + sas_file + "-TO.pddl";
       //        m->writeToPDDL(domain_name, problem_name);
}