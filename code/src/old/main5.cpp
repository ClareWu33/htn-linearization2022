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

// TODO: build a directed graph ~= TDG
// then build up from leaves (ignoring if you have seen this task before)
// TODO: time difference
//  #include <chrono>
// using namespace std::chrono;

// auto start = high_resolution_clock::now();

// auto duration = duration_cast<microseconds>(stop - start);
// cout << duration.count() << endl;
// std::set<int> **get_tasks_pre_eff2(Model *m)
// {
//        // build tdg/
//        Graph from_subtask = Graph((*m).numTasks);
//        for (int method = 0; method < (*m).numMethods; method++)
//        {
//               int decomposed_task = (*m).decomposedTask[method];
//               for (int subtask_pos = 0; subtask_pos < (*m).numSubTasks; subtask_pos++)
//               {
//                      int subtask = (*m).subTasks[method][subtask_pos];
//                      to_subtask.addEdge(decomposed_task, subtask);
//                      from_subtask.addEdge(subtask, decomposed_task);
//               }
//        }

//        // set up storage of results
//        std::set<int> **tasks_pre_eff;
//        std::set<int> **tasks_pre_eff = new std::set<int> *[3];
//        for (int i = 0; i < 3; i++)
//        {
//               tasks_pre_eff[i] = new std::set<int>[(*m).numTasks];
//        }

//        // fill the tree from bottom-up
//        bool next_to_push[(*m).numTasks] = {0}; // false
//        bool seen_before[(*m).numTasks] = {0}; // false
//        int filled_tasks = 0;
//        // the 'leaves' are actions
//        for (int a = 0; a < (*m).numActions; a++)
//        {
//               tasks_pre_eff[0][a].insert((*m).precLists[subtask], &((*m).precLists[subtask][(*m).numPrecs[subtask]]));
//               tasks_pre_eff[1][a].insert((*m).addLists[subtask], &((*m).addLists[subtask][(*m).numAdds[subtask]]));
//               tasks_pre_eff[2][a].insert((*m).delLists[subtask], &((*m).delLists[subtask][(*m).numDels[subtask]]));
//               next_to_push[a] = 1; // true
//        }
//        filled_tasks = (*m).numActions;

//        // push your pre+add+del up to subtasks that may deompose to you
//        while
//               !(all_pushed)
//               {
//                      for (int subtask = 0; subtask < (*m).numTasks; subtask++)
//                      {
//                             int parent_task = g.adj[task];
//                             if !(has_pushed[subtask]))
//                                    {
//                                           parent_task = g.adj[task];
//                                           tasks_pre_eff[0][parent_task].insert(tasks_pre_eff[0][task].begin(), tasks_pre_eff[0][task].end());
//                                           tasks_pre_eff[1][parent_task].insert(tasks_pre_eff[1][task].begin(), tasks_pre_eff[1][task].end());
//                                           tasks_pre_eff[2][parent_task].insert(tasks_pre_eff[2][task].begin(), tasks_pre_eff[2][task].end());
//                                           next_to_push[parent_task] = true;
//                                           next_to_push[this_task] = false;
//                                    }
//                             has_pushed[subtask] = true;
//                      }
//               }
//        return tasks_pre_eff;
// }
//* END TODO *//

std::set<int> **get_m_pre_eff(int collect_to, int method, std::set<int> tasks_seen, Model *m, std::set<int> **all_pre_eff)
{
       for (int i = 0; i < (*m).numSubTasks[method]; i++)
       {
              int subtask = (*m).subTasks[method][i];
              if (tasks_seen.find(subtask) == tasks_seen.end())
              {
                     if ((*m).isPrimitive[subtask])
                     {
                            // integer variable that they act on,  .insert(arr.start(), arr.end())
                            all_pre_eff[0][collect_to].insert((*m).precLists[subtask], &((*m).precLists[subtask][(*m).numPrecs[subtask]]));
                            all_pre_eff[1][collect_to].insert((*m).addLists[subtask], &((*m).addLists[subtask][(*m).numAdds[subtask]]));
                            all_pre_eff[2][collect_to].insert((*m).delLists[subtask], &((*m).delLists[subtask][(*m).numDels[subtask]]));

                            if ((*m).numConditionalAdds[subtask] > 0)
                                   all_pre_eff[1][collect_to].insert((*m).conditionalAddLists[subtask], &((*m).conditionalAddLists[subtask][(*m).numConditionalAdds[subtask]]));
                            if ((*m).numConditionalDels[subtask] > 0)
                                   all_pre_eff[2][collect_to].insert((*m).conditionalDelLists[subtask], &((*m).conditionalDelLists[subtask][(*m).numConditionalDels[subtask]]));
                     }
                     else
                     {
                            int *more_methods = (*m).taskToMethods[subtask];
                            for (int j = 0; j < (*m).numMethodsForTask[subtask]; j++)
                            {
                                   int mm = more_methods[j];
                                   std::set<int> new_tasks_seen(tasks_seen);
                                   new_tasks_seen.insert(subtask);
                                   get_m_pre_eff(collect_to, mm, tasks_seen, m, all_pre_eff); // passes ptr, all_pre_eff changes kept
                            }
                     }
              }
              tasks_seen.insert(subtask);
       }
       return all_pre_eff; // pre, add, dele
}

// gets the preconditons and effects for all methods
std::set<int> **get_methods_pre_eff(Model *m)
{
       // initialise pre[m], add[m],  del[m]<>
       std::set<int> **all_pre_eff = new std::set<int> *[3];
       for (int i = 0; i < 3; i++)
       {
              all_pre_eff[i] = new std::set<int>[(*m).numMethods];
       }

       std::set<int> tasks_seen;
       // collect preconditions and effects
       for (int method = 0; method < (*m).numMethods; method++)
       {
              all_pre_eff = get_m_pre_eff(method, method, tasks_seen, m, all_pre_eff); // should keep all_pre_eff state from previous runs
       }
       return all_pre_eff;
}

// abstract tasks => set of all preconditions, effects
// every abstract task SHOULD have a method applicable in a well-formed domain
std::set<int> **get_tasks_pre_eff(Model *m, std::set<int> **all_pre_eff)
{
       std::set<int> **tasksPreEff = new ::std::set<int> *[3];
       for (int i = 0; i < 3; i++)
       {
              tasksPreEff[i] = new std::set<int>[(*m).numTasks];
       }

       // for each task
       for (int task = 0; task < (*m).numTasks; task++)
       {
              // collect pre+eff for each method (if any) that applies to the task
              for (int j = 0; j < (*m).numMethodsForTask[task]; j++)
              {
                     int method = (*m).taskToMethods[task][j];
                     tasksPreEff[0][task].insert(all_pre_eff[0][method].begin(), all_pre_eff[0][method].end());
                     tasksPreEff[1][task].insert(all_pre_eff[1][method].begin(), all_pre_eff[1][method].end());
                     tasksPreEff[2][task].insert(all_pre_eff[2][method].begin(), all_pre_eff[2][method].end());
              }
              // action
              if ((*m).isPrimitive[task])
              {
                     tasksPreEff[0][task].insert(&(*m).precLists[task][0], &(*m).precLists[task][(*m).numPrecs[task]]);
                     tasksPreEff[1][task].insert(&(*m).addLists[task][0], &(*m).addLists[task][(*m).numAdds[task]]);
                     tasksPreEff[2][task].insert(&(*m).delLists[task][0], &(*m).delLists[task][(*m).numDels[task]]);
              }
       }
       return tasksPreEff;
}

// // Each such non-negative integer $i$ describes that the state feature $i$ is a precondition of this action.
// // orderings [per method] <array of order pairs>  <- accumulate order pairs
std::set<edge> *find_orderings(Model *m, std::set<int> **tasks_pre_eff)
{
       // additional orderings per method
       std::set<edge> *orderings = new ::std::set<edge>[(*m).numMethods];
       // std::set<vector<int> > *orderings

       //  iterate through every method and its "preconditions and effects"
       for (int method = 0; method < (*m).numMethods; method++)
       {
              // consider their subtasks
              for (int i = 0; i < (*m).numSubTasks[method]; i++)
              {
                     int subtask_pos = i; // its position among subtasks
                     int subtask = (*m).subTasks[method][i];
                     // //   * For each add effect a of c
                     for (int add_effect : tasks_pre_eff[1][subtask])
                     {
                            for (int j = 0; j < (*m).numSubTasks[method]; j++)
                            {
                                   if (i != j) // not against yourself
                                   {
                                          int other_subtask = (*m).subTasks[method][j];
                                          int other_subtask_pos = j;
                                          // move all other subtasks with precondition a behind c
                                          for (int precondition : tasks_pre_eff[0][other_subtask])
                                          {
                                                 if (add_effect == precondition)
                                                 {
                                                        edge e1 = edge(subtask_pos, other_subtask_pos);
                                                        orderings[method].insert(e1);
                                                 }
                                          }
                                          //  and all other sub tasks with a delete effect in front of it.
                                          for (int del_effect : tasks_pre_eff[2][other_subtask])
                                          {
                                                 if (add_effect == del_effect)
                                                 {
                                                        edge e2 = edge(other_subtask_pos, subtask_pos);
                                                        orderings[method].insert(e2);
                                                 }
                                          }
                                   }
                            }
                     }

                     // //   * For each delete effect d of c
                     for (int del_effect : tasks_pre_eff[2][subtask])
                     {
                            for (int j = 0; j < (*m).numSubTasks[method]; j++)
                            {
                                   if (i != j)
                                   {
                                          int other_subtask = (*m).subTasks[method][j];
                                          int other_subtask_pos = j; // its position among subtasks
                                          // move all tasks with precondition d before c
                                          for (int precondition : tasks_pre_eff[0][other_subtask])
                                          {
                                                 if (del_effect == precondition)
                                                 {
                                                        edge e2 = edge(other_subtask_pos, subtask_pos);
                                                        orderings[method].insert(e2);
                                                 }
                                          }
                                          // and all tasks with an add effect behind it.
                                          for (int add_effect : tasks_pre_eff[1][other_subtask])
                                          {
                                                 if (del_effect == add_effect)
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

// // if ordering between them doesn't exist, split it up?
// // search for cycles in the set of orderings
// // //no cycles use this linearization,  OR random break
// std::vector<edge> *break_cycle(Model *m, std::set<edge> *old_orderings)
// {
//        std::set<edge> *new_orderings = new std::set<edge>[(*m).numMethods];
//        std::vector<edge> *linearised_orderings = new std::vector<edge>[(*m).numMethods];

//        for (int method = 0; method < (*m).numMethods; method++)
//        {
//               printf("looking for cycles in method %i \n", method);
//               Graph g((*m).numSubTasks[method], 2); // num of vertices = subtasks for method

//               //  first priority to respect: (*m).orderings
//               for (int i = 0; i < (*m).numOrderings[method] - 2; i += 2)
//               {
//                      int o1 = (*m).ordering[method][i];
//                      int o2 = (*m).ordering[method][i + 1];
//                      g.addEdge(o1, o2, 0);
//               }

//               //   second priority to respect: output of find_orderings
//               for (auto e : old_orderings[method])
//               {
//                      g.addEdge(e.start, e.end, 1);
//               }

//               // find cycles
//               new_orderings[method] = old_orderings[method];
//               std::vector<cycle> all_cycles = g.findCyclic();
//               for (cycle c : all_cycles)
//               {
//                      if (c.isCycle)
//                      {
//                             if (c.edges[1].size() > 1)
//                             {
//                                    // select a random cycle from  priority = 1, check that it is not a higher priority edge as well
//                                    new_orderings[method] = g.get_orderings();
//                                    int rand_edge_idx = (std::rand() % (c.edges[1].size())); // random edge id?
//                                    std::vector<edge> edges_vec; edges_vec.assign((c.edges[1]).begin(), (c.edges[1]).end()); // vector of edges
//                                    edge rand_edge = edges_vec[rand_edge_idx];
//                                    new_orderings[method].erase(rand_edge);

//                                    // // select a random cycle from  priority = 1
//                                    // new_orderings[method] = g.get_orderings(); // array of  edge set
//                                    // // check that it is not a higher priority edge as well
//                                    // edge rand_edge = *(c.edges[0].begin());
//                                    // while (c.edges[0].find(rand_edge) != c.edges[0].end())
//                                    // {
//                                    //        int rand_edge_idx = (std::rand() % (c.edges[1].size()));
//                                    //        std::vector<edge> edges_vec;
//                                    //        edges_vec.assign((c.edges[1]).begin(), (c.edges[1]).end());
//                                    //        rand_edge = edges_vec[rand_edge_idx];
//                                    // }
//                                    // // break cycles
//                                    // new_orderings[method].erase(rand_edge);
//                             }
//                      }
//               }

//               // make new orderings totally ordered
//               Graph g2((*m).numSubTasks[method]);
//               for (auto e : new_orderings[method])
//                      g2.addEdge(e.start, e.end);

//               stack<int> Stack = g.topologicalSort();

//               // while (Stack.empty() == false)
//               // {
//               //        linearised_orderings[method].push_back(Stack.top());
//               //        Stack.pop();
//               // }
//               int first = Stack.top();
//               Stack.pop();
//               while (Stack.empty() == false)
//               {
//                      int second = Stack.top();
//                      edge e(first, second);
//                      linearised_orderings[method].push_back(e);
//                      first = second;
//                      Stack.pop();
//               }
//        }
//        return linearised_orderings;
// }

// void to_sas(Model *m, std::vector<edge> *linearised_orderings, string og_sas)
// {
//        // makes TO into pddl or sas?
//        // no more types
//        std::ifstream fileStream;
//        fileStream.open(og_sas);
//        if (fileStream.is_open())
//        {
//               printf("The problem file was opened successfully.");
//        }

//        // read line by line
//        // output line by line

//        // delete old methods, put new

//        // read line by line
//        // output line by line

// }

// void linearize_model(Model *m, std::vector<edge> *linearised_orderings) {
//        delete[] (*m).ordering;
//        (*m).ordering = new int *[(*m).numMethods];
//        for (int method=0; method<(*m).numMethods; method++) {
//               (*m).numOrderings[method] = 2*linearised_orderings[method].size(); // new size of ordering
//               (*m).ordering[method] = new int[ (*m).numOrderings[method] ];    // new ordering array
//               for (int i=0; i<linearised_orderings[method].size(); i++) {
//                      (*m).ordering[method][2*i] = linearised_orderings[method][i].start;
//                      (*m).ordering[method][2*i+1] = linearised_orderings[method][i].end;
//               }
//        }
// }

// // use connies method
// void Process2() {
//        for (int i = 0; i < num_problems; i++)
//        {
//               pddl = problems_to_convert[i];
//               Model *m = setup_model(pddl);
//               certain_pre_eff, possible_pre_eff  = Connies_method();
//               // find orderings
//               std::set<edge> *orderings = find_orderings(m, tpe);
//               std::vector<edge> *linearised_orderings = break_cycle(m, orderings);
//               out(m, linearised_orderings, pddl);
//        }
// }

// use gregor's original method
void Process1(string filepath)
{

       string sas_file = filepath + ".sas";
       Model *m = setup_model(sas_file);

       for (int method = 0; method < (*m).numMethods; method++)
       {
              for (int i = 0; i < (*m).numOrderings[method]; i++)
              {
                     printf("%i ", (*m).ordering[method][i]);
              }
              printf("\n");
       }

       std::set<int> **all_pre_eff = get_methods_pre_eff(m);
       // std::set<int> **tpe = get_tasks_pre_eff(m, all_pre_eff);
       // // find orderings
       // std::set<edge> *orderings = find_orderings(m, tpe);
       // std::vector<edge> *linearised_orderings = break_cycle(m, orderings);

       // linearize_model(m, linearised_orderings);
       // printf("After linearise \n");
       // for (int method=0; method<(*m).numMethods; method++) {
       //        for (int i=0; i<(*m).numOrderings[method]; i++) {
       //               printf("%i ", (*m).ordering[method][i]);
       //        }
       //        printf("\n");
       // }

       // string domain_name = "linearized-domains/" + sas_file + "-TO-domain.pddl";
       // string problem_name = "linearized-problems/" + sas_file + "-TO.pddl";
       // m->writeToPDDL(domain_name, problem_name);
}

void get_t_pre_eff_(int collect_to_task, int task_to_explore, bool *visited, Model *m, bool ***all_pre_eff) // bool * is_filled
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
                                   get_t_pre_eff_(collect_to_task, next_task, visited, m, all_pre_eff); // passes ptr, all_pre_eff changes kept
                            }
                     }
              }
       } // return all_pre_eff
}

// WRAPPER FOR PREVIOUS FUNCTION FOR BACK EDGES
bool ***get_t_pre_eff(int collect_to_task, Model *m, bool ***all_pre_eff)
{
       int task_to_explore = collect_to_task;
       bool *visited = new bool[(*m).numTasks];
       get_t_pre_eff_(collect_to_task, task_to_explore, visited, m, all_pre_eff);

       return all_pre_eff;
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

       auto start = std::chrono::high_resolution_clock::now();
       for (int node = 0; node < (*m).numTasks; node++)
       {
              get_t_pre_eff(node, m, all_pre_eff);
       }
       auto stop = std::chrono::high_resolution_clock::now();
       auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       cout << duration.count() << " microseconds to find all pred\n";

       for (int i = 0; i < 3; i++)
       {
              for (int k = 0; k < (*m).numStateBits; k++)
              {
                     if (all_pre_eff[i][67010][k])
                     {
                            printf("%i ", k);
                     }
              }
              printf("\n");
       }
}

/*
int whatever2() {
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

       // step 1  find cycles
       auto start = std::chrono::high_resolution_clock::now();
       Graph g((*m).numTasks);
       for (int method = 0; method < (*m).numMethods; method++)
       {
              for (int j = 0; j < (*m).numSubTasks[method]; j++)
              {
                     int subtask = (*m).subTasks[method][j];
                     int decomposed = (*m).decomposedTask[method];
                     g.addEdge(decomposed, subtask, 0);
              }
       }
       std::vector<edge> back_edges = g.findAllCycles((*m).initialTask);
       auto stop = std::chrono::high_resolution_clock::now();
       auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       cout << duration.count() << " microseconds to make graph\n";

       // step 2 for each back edge's start node, find its childrens prec and effects
       for (edge e : back_edges)
       {
              int task = e.start;
              bool ***all_pre_eff = get_t_pre_eff(task, m); // should keep all_pre_eff state from previous runs
       }

       // step 3 fill for all actions
       for (int a = 0; a < (*m).numActions; a++)
       {
              // yes/no for integer variable that they act on
              for (int j = 0; j < (*m).numPrecs[task_to_explore]; j++)
              {
                     int prec = (*m).precLists[task_to_explore][j];
                     all_pre_eff[0][a][prec] = true;
              }
              for (int j = 0; j < (*m).numAdds[task_to_explore]; j++) // adds
              {
                     int add = (*m).addLists[task_to_explore][j];
                     all_pre_eff[1][a][add] = true;
              }
              for (int j = 0; j < (*m).numDels[task_to_explore]; j++) // deletes
              {
                     int del = (*m).delLists[task_to_explore][j];
                     all_pre_eff[2][a][del] = true;
              }
       }
       all_finished = 0;

       // step 4 fill for the rest
       bool *is_finished;
       int all_finished;
       get_tasks_pre_eff_main((is_finished, all_finished,
                                          (*m).numTasks, (*m).numMethodsForTask, (*m).taskToMethods, (*m).numSubTasks, (*m).SubTasks,
                                          bool *** tasks_pre_eff);

       // Model *m = setup_model(problem); // Process1(problem);

       // auto start = std::chrono::high_resolution_clock::now();
       // Graph g((*m).numTasks);
       // for (int method = 0; method < (*m).numMethods; method++)
       // {
       //        for (int j = 0; j < (*m).numSubTasks[method]; j++)
       //        {
       //               int subtask = (*m).subTasks[method][j];
       //               int decomposed = (*m).decomposedTask[method];
       //               g.addEdge(decomposed, subtask, 0);
       //        }
       // }
       // std::vector<edge> back_edges = g.findAllCycles((*m).initialTask);
       // auto stop = std::chrono::high_resolution_clock::now();
       // auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       // cout << duration.count() << " microseconds to make graph\n";

       // // find back edges in graph decomposition
       // start = std::chrono::high_resolution_clock::now();
       // std::vector<edge> back_edges = g.findAllCycles((*m).initialTask);
       // printf("number of back edges %lu\n", back_edges.size());

       // for (edge e : back_edges)
       // {
       //        int task = e.start;
       //        bool ***all_pre_eff = get_t_pre_eff(task, m); // should keep all_pre_eff state from previous runs
       // }
       // stop = std::chrono::high_resolution_clock::now();
       // duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       // cout << duration.count() << " microseconds to search all back edges\n";
}
*/
// int main__(int argc, char *argv[])
// {
//        Graph g(9, 2);

//        g.addEdge(0, 2,   0);
//        g.addEdge(2, 4,   1);
//        g.addEdge(4, 1,   0);
//        g.addEdge(1, 3,   1);
//        g.addEdge(3, 0,   0);
//        g.addEdge(3, 4,  0);

//        // g.addEdge(0, 1,   0);
//        // g.addEdge(1, 2,   1);
//        // g.addEdge(2, 0,   0);
//        // g.addEdge(2, 3,   1);  // not part of cycle
//        // g.addEdge(3, 4,   0);
//        // g.addEdge(4, 5,   1);
//        // g.addEdge(5, 3,   0);

// 	// g.addEdge(0, 1, 0);
// 	// g.addEdge(0, 7, 0);
// 	// g.addEdge(1, 2, 0);
// 	// g.addEdge(1, 7, 0);
// 	// g.addEdge(2, 3, 0);
// 	// g.addEdge(2, 8, 0);
// 	// g.addEdge(2, 5, 0);
// 	// g.addEdge(3, 4, 0);
// 	// g.addEdge(3, 5, 0);
// 	// g.addEdge(4, 5, 0);
// 	// g.addEdge(5, 6, 0);
// 	// g.addEdge(6, 7, 0);
// 	// g.addEdge(6, 8, 0);
// 	// g.addEdge(7, 8, 0);

//        std::vector<cycle> all_cycles = g.findCyclic();
//        for (cycle c : all_cycles) {
//        print( c.edges[0] ); // cycles found, priority level
//     print( c.edges[1] );
//        printf("\n");
//        }

//        Graph gr(9, 2);

//        gr.addEdge(0, 2,   0);
//        gr.addEdge(2, 4,   1);
//        gr.addEdge(4, 1,   0);
//        gr.addEdge(1, 3,   1);
//        gr.addEdge(3, 4,  0);

//        all_cycles = gr.findCyclic();
//        for (cycle c : all_cycles) {
//        print( c.edges[0] ); // cycles found, priority level
//     print( c.edges[1] );
//        printf("\n");
//        }

//        printf("end cycle find");
//        // int n = 1;
//        // string problems_to_convert[n] = {"problemrover01out"};
//        // for (int i = 0; i<n; i++)
//        // {
//        //        Process1(problems_to_convert[i]);
//        // }
// }
// // int main(int argc, char *argv[])
// // {

// //        Model *m = setup_model("problemrover01out.sas"); //("test01out.sas"); //
// //        std::set<int> **all_pre_eff = get_methods_pre_eff(m);
// //        std::set<int> **tpe = get_tasks_pre_eff(m, all_pre_eff);

// //        int action = 3;
// //        printf("Sample of results for corresponding primitive  task %i: ", action);
// //        print(tpe[0][action]);
// //        print(tpe[1][action]);
// //        print(tpe[2][action]);

// //        std::set<int> **tpe2 = get_tasks_pre_eff2(m);
// //        printf("Sample of results for other method, corresponding primitive task %i: ", action);
// //        print(tpe2[0][action]);
// //        print(tpe2[1][action]);
// //        print(tpe2[2][action]);
// //        action = 4;
// //        printf("Sample of results for other method, corresponding primitive  task %i: ", action);
// //        print(tpe2[0][action]);
// //        print(tpe2[1][action]);
// //        print(tpe2[2][action]);
// //        action = 5;
// //        printf("Sample of results for other method, corresponding primitive task %i: ", action);
// //        print(tpe2[0][action]);
// //        print(tpe2[1][action]);
// //        print(tpe2[2][action]);

// //        // find orderings
// //        std::set<edge> *orderings = find_orderings(m, tpe);
// //        int method = 3;
// //        printf("orderings found for method %i \n", method);
// //        // subtasks
// //        //  should be  6    8       5         7
// //        //             2            2
// //        //                        16,14      10
// //        //                 10      5,2
// //        // i.e. (0, 2), (1,3)  and NOT(2,2)  since thats itself
// //        print(orderings[method]);

// //        std::vector<edge> *linearised_orderings = break_cycle(m, orderings);
// //        printf("orderings after cycle breaking for method");
// //        print(linearised_orderings[method]);
// //        printf("\n");

// //        method = 7;
// //        printf("orderings found for method %i\n", method);
// //        print(orderings[method]);
// //        printf("orderings that method already requires");
// //        for (int i = 0; i < (*m).numOrderings[method - 1]; i += 2)
// //        {
// //               printf("(%i %i) ", (*m).ordering[method][i], (*m).ordering[method][i + 1]);
// //        }
// //        printf("\n");

// //        printf("orderings after cycle breaking for method");
// //        print(linearised_orderings[method]);

// //        return 0;
// // }
