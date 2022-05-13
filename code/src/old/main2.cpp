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
#include <list>
#include <stack>

#include "directed_graph.h"
#include "util.h"

// pandPI code for storing an HTN planning model
#include "../pandaPIengine/src/Model.h"
#include "../pandaPIengine/src/intDataStructures/IntPairHeap.h"
#include "../pandaPIengine/src/ProgressionNetwork.h"
#include "../pandaPIengine/src/flags.h"
#include "../pandaPIengine/src/intDataStructures/noDelIntSet.h"
#include "../pandaPIengine/src/intDataStructures/FlexIntStack.h"
#include "../pandaPIengine/src/intDataStructures/IntUtil.h"
#include "../pandaPIengine/src/intDataStructures/StringUtil.h"

progression::Model *setup_model(string fileName, bool getVectorRep)
{
       bool trackTasksInTN = false;
       progression::eMaintainTaskReachability maintainTaskReachability = mtrNO; // enum eMaintainTaskReachability {mtrNO, mtrACTIONS, mtrALL};
       bool progressEffectLess = true;
       bool progressOneModActions = true;
       progression::Model *m = new Model(true, maintainTaskReachability, true, true);
       m->isHtnModel = true;
       if (getVectorRep)
       {
              m->rintanenInvariants = true;
       }

       std::ifstream fileStream;
       fileStream.open(fileName);
       if (fileStream.is_open())
       {
              printf("The problem file %s was opened successfully.\n", fileName.c_str());
              m->read(&fileStream);
       }
       else
       {
              printf("Could not open the specified file, %s\n", fileName.c_str());
       }

       return m;
}

/*// TODO: build a directed graph ~= TDG
// then build up from leaves (ignoring if you have seen this task before)
std::set<int> **get_tasks_pre_eff2(Model *m)
{
       Graph g((*m).numTasks);
       // find back edges in graph decomposition
       for (int method = 0; method < (*m).numMethods; method++)
       {
              for (int j = 0; j < (*m).numSubTasks[method]; j++)
              {
                     int subtask = (*m).subTasks[method][j];
                     int decomposed = (*m).decomposedTask[method];
                     g.addEdge(decomposed, subtask, 0);
              }
       }
       std::vector<edge> cycles = g.findAllCyclic();

       // set up storage of results
       std::set<int> **tasks_pre_eff;
       std::set<int> **tasks_pre_eff = new std::set<int> *[3];
       for (int i = 0; i < 3; i++)
       {
              tasks_pre_eff[i] = new std::set<int>[(*m).numTasks];
       }

       // bool next_to_collect[(*m).numTasks] = {0}; // false
       // bool seen_before[(*m).numTasks] = {0}; // false
       bool almost_finished[(*m).numTasks] = {0}; // (meaning that you have collected possible pre+eff from all children EXCEPT back edges)
       bool finished[(*m).numTasks] = {0};        // (meaning that you have collected possible pre+eff from all children) init false
       int finished_tasks = 0;
       // fill the tree from bottom-up
       // the 'leaves' are actions
       for (int a = 0; a < (*m).numActions; a++)
       {
              tasks_pre_eff[0][a].insert((*m).precLists[subtask], &((*m).precLists[subtask][(*m).numPrecs[subtask]]));
              tasks_pre_eff[1][a].insert((*m).addLists[subtask], &((*m).addLists[subtask][(*m).numAdds[subtask]]));
              tasks_pre_eff[2][a].insert((*m).delLists[subtask], &((*m).delLists[subtask][(*m).numDels[subtask]]));
              finished[a] = true; // 1=true
       }
       finished_tasks = (*m).numActions;

       // push your pre+add+del up to each of the parent tasks
       while (filled_tasks < (*m).numTasks)
       {
              for (int parent = 0; parent < (*m).numTasks; parent++)
              {
                     // collect your children if needed
                     if (!finished[parent])
                     {
                            // for each method, for each subtask in method
                            // if they are ALL finished (ignore back edge for now), collect their things
                            next_to_collect[parent] = true;
                            for (adj_edge sub_task : g.adj[parent])
                            {
                                   // if not filled is not a back edge, don't collect yet
                                   // ok to pull from almost_finished
                                   if ((!(edge(parent_task, subtask) in back_edges)) || !(filled[sub_task.end]))
                                   {
                                          // skip all steps;
                                          next_to_collect[parent] = false;
                                   }
                            } // otherwise  all children are ready to collect, we should collect

                            if (next_to_collect)
                            {
                                   for (adj_edge sub_task : g.adj[parent])
                                   {
                                          for (int mm = 0; mm < (*m).numMethodsForTask; mm++)
                                          {
                                                 int method =
                                                     if (edge(parent_task, subtask) in back_edges)
                                                 {
                                                        // skip pushing pre/effects up back edges for last
                                                        // after collecting all pre+eff that are NOT from the back edge
                                                        // do a swap with the node on the other side of the back edge
                                                        // and mark yourself finished as well
                                                        int x = 0;
                                                 }
                                                 else if (!(filled[subtask]))
                                                 {
                                                        parent_task = g.adj[task];
                                                        // ADD PRE+EFF
                                                        for (int j = 0; j < (*m).numVars; j++)
                                                        {

                                                               all_pre_eff[1][collect_to][j] = ((all_pre_eff[1][collect_to][j]) | ((*m).addVectors[subtask][j])); // if 1 is ticked, both ticked
                                                               all_pre_eff[2][collect_to][j] = ((all_pre_eff[2][collect_to][j]) | ((*m).delVectors[subtask][j])); // if 1 is ticked, both ticked
                                                        }
                                                        for (int j = 0; j < (*m).numPrecs[subtask]; j++)
                                                        {
                                                               int prec = (*m).precLists[subtask][j];
                                                               all_pre_eff[0][collect_to][prec] = true;
                                                        }
                                                        // DONE PRE+EFF
                                                        next_to_push[parent_task] = true;
                                                        next_to_push[this_task] = false;
                                                 }
                                                 filled[parent] = true;
                                          }
                                   }
                            }
                            // if you have an back edge, swap it after puuling rest of children
                     }
                     else if (almost_finished[parent])
                     {
                     }
              }
       }
       return tasks_pre_eff;
}

// END TODO */

/*
std::set<int> **get_m_pre_eff(int collect_to, int method, std::set<int> tasks_seen, Model *m, std::set<int> **all_pre_eff)
{
       for (int i = 0; i < (*m).numSubTasks[method]; i++)
       {
              int subtask = (*m).subTasks[method][i];
              if (!(is_in(subtask, tasks_seen)))
              {
                     if ((*m).isPrimitive[subtask])
                     {
                            // integer variable that they act on,  .insert(arr.start(), arr.end())
                            all_pre_eff[0][collect_to].insert((*m).precLists[subtask], &((*m).precLists[subtask][(*m).numPrecs[subtask]]));
                            all_pre_eff[1][collect_to].insert((*m).addLists[subtask], &((*m).addLists[subtask][(*m).numAdds[subtask]]));
                            all_pre_eff[2][collect_to].insert((*m).delLists[subtask], &((*m).delLists[subtask][(*m).numDels[subtask]]));

                            // if ((*m).numConditionalAdds[subtask] > 0)
                            //        all_pre_eff[1][collect_to].insert((*m).conditionalAddLists[subtask], &((*m).conditionalAddLists[subtask][(*m).numConditionalAdds[subtask]]));
                            // if ((*m).numConditionalDels[subtask] > 0)
                            //        all_pre_eff[2][collect_to].insert((*m).conditionalDelLists[subtask], &((*m).conditionalDelLists[subtask][(*m).numConditionalDels[subtask]]));
                     }
                     else
                     {
                            int *more_methods = (*m).taskToMethods[subtask];
                            for (int j = 0; j < (*m).numMethodsForTask[subtask]; j++)
                            {
                                   int mm = more_methods[j];
                                   std::set<int> new_tasks_seen(tasks_seen); // "seen" as direct ancestor, not including other traversals, ii.e. loop detection
                                   new_tasks_seen.insert(subtask);
                                   get_m_pre_eff(collect_to, mm, new_tasks_seen, m, all_pre_eff); // passes ptr, all_pre_eff changes kept
                            }
                     }
                     tasks_seen.insert(subtask);
              }
              else
              {
                     return all_pre_eff; // if seen, skip
              }
       }
       return all_pre_eff; // pre, add, dele
}


// // gets the preconditons and effects for all methods
// std::set<int> **get_tasks_pre_eff(Model *m)
std::set<int> **get_tasks_pre_eff(Model *m)
{
       // initialise pre[m], add[m],  del[m]<>
       std::set<int> **all_pre_eff = new std::set<int> *[3];
       for (int i = 0; i < 3; i++)
       {
              all_pre_eff[i] = new std::set<int>[(*m).numTasks];
       }

       // collect preconditions and effects
       for (int method = 0; method < (*m).numMethods; method++)
       {
              std::set<int> tasks_seen;
              int decomposed_task = (*m).decomposedTask[method];
              all_pre_eff = get_m_pre_eff(decomposed_task, method, tasks_seen, m, all_pre_eff); // should keep all_pre_eff state from previous runs
       }
       return all_pre_eff;
}
*/

bool ***get_t_pre_eff(int collect_to, int method, std::set<int> tasks_seen, Model *m, bool ***all_pre_eff)
{
       for (int i = 0; i < (*m).numSubTasks[method]; i++)
       {
              int subtask = (*m).subTasks[method][i];
              if (!(is_in(subtask, tasks_seen)))
              {
                     if ((*m).isPrimitive[subtask])
                     {
                            // yes/no for integer variable that they act on
                            for (int j = 0; j < (*m).numVars; j++)
                            {

                                   all_pre_eff[1][collect_to][j] = ((all_pre_eff[1][collect_to][j]) | ((*m).addVectors[subtask][j])); // if 1 is ticked, both ticked
                                   all_pre_eff[2][collect_to][j] = ((all_pre_eff[2][collect_to][j]) | ((*m).delVectors[subtask][j])); // if 1 is ticked, both ticked
                            }
                            for (int j = 0; j < (*m).numPrecs[subtask]; j++)
                            {
                                   int prec = (*m).precLists[subtask][j];
                                   all_pre_eff[0][collect_to][prec] = true;
                            }
                            // if ((*m).numConditionalAdds[subtask] > 0)
                            //        all_pre_eff[1][collect_to].insert((*m).conditionalAddLists[subtask], &((*m).conditionalAddLists[subtask][(*m).numConditionalAdds[subtask]]));
                            // if ((*m).numConditionalDels[subtask] > 0)
                            //        all_pre_eff[2][collect_to].insert((*m).conditionalDelLists[subtask], &((*m).conditionalDelLists[subtask][(*m).numConditionalDels[subtask]]));
                     }
                     else
                     {
                            int *more_methods = (*m).taskToMethods[subtask];
                            for (int j = 0; j < (*m).numMethodsForTask[subtask]; j++)
                            {
                                   int mm = more_methods[j];
                                   std::set<int> new_tasks_seen(tasks_seen); // "seen" as direct ancestor, not including other traversals, ii.e. loop detection
                                   new_tasks_seen.insert(subtask);
                                   get_t_pre_eff(collect_to, mm, new_tasks_seen, m, all_pre_eff); // passes ptr, all_pre_eff changes kept
                            }
                     }
                     tasks_seen.insert(subtask);
              }
              else
              {
                     return all_pre_eff; // if seen, skip
              }
       }
       return all_pre_eff; // pre, add, dele
}

// // gets the preconditons and effects for all methods
// std::set<int> **get_tasks_pre_eff(Model *m)
bool ***get_tasks_pre_eff(Model *m)
{
       int t = (*m).numTasks;
       int v = (*m).numVars;
       bool ***all_pre_eff = new bool **[3];
       for (int i = 0; i < 3; i++)
       {
              all_pre_eff[i] = new bool *[t];
              for (int j = 0; j < (*m).numTasks; j++)
              {
                     all_pre_eff[i][j] = new bool[v]{false};
              }
       }
       bool what = all_pre_eff[2][t - 1][v - 1];
       // collect preconditions and effects
       for (int method = 0; method < (*m).numMethods; method++)
       {
              std::set<int> tasks_seen;
              int decomposed_task = (*m).decomposedTask[method];
              all_pre_eff = get_t_pre_eff(decomposed_task, method, tasks_seen, m, all_pre_eff); // should keep all_pre_eff state from previous runs
       }
       return all_pre_eff;
}

// // Each such non-negative integer $i$ describes that the state feature $i$ is a precondition of this action.
// // orderings [per method] <array of order pairs>  <- accumulate order pairs
// test new find_orderings
std::set<edge> *find_orderings(Model *m, bool ***tasks_pre_eff)
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
                                          // move all other subtasks with precondition a behind c
                                          bool prec = tasks_pre_eff[0][other_subtask][v];
                                          if (add_effect == prec == true)
                                          {
                                                 edge e1 = edge(subtask_pos, other_subtask_pos);
                                                 orderings[method].insert(e1);
                                          }
                                          //  and all other sub tasks with a delete effect in front of it.
                                          bool delete_effect = tasks_pre_eff[2][other_subtask][v];
                                          if (add_effect == delete_effect == true)
                                          {
                                                 edge e2 = edge(other_subtask_pos, subtask_pos);
                                                 orderings[method].insert(e2);
                                          }

                                          //// * For each delete effect d of c
                                          bool del_effect = tasks_pre_eff[2][subtask][v];
                                          // move all tasks with precondition d before c
                                          bool prec_ = tasks_pre_eff[0][other_subtask][v];
                                          if (del_effect == prec_ == true)
                                          {
                                                 edge e2 = edge(other_subtask_pos, subtask_pos);
                                                 orderings[method].insert(e2);
                                          }

                                          // and all tasks with an add effect behind it.
                                          bool add_ = tasks_pre_eff[1][other_subtask][v];
                                          if (del_effect == add_ == true)
                                          {
                                                 edge e1 = edge(subtask_pos, other_subtask_pos);
                                                 orderings[method].insert(e1);
                                          }
                                   }
                            }
                     }
              }
       }
       return orderings;
}

// std::set<edge> *find_orderings(Model *m, std::set<int> **tasks_pre_eff)
// {
//        // additional orderings per method
//        std::set<edge> *orderings = new ::std::set<edge>[(*m).numMethods];

//        //  iterate through every method and its "preconditions and effects"
//        for (int method = 0; method < (*m).numMethods; method++)
//        {
//               // consider their subtasks
//               for (int i = 0; i < (*m).numSubTasks[method]; i++)
//               {
//                      int subtask_pos = i; // its position among subtasks
//                      int subtask = (*m).subTasks[method][i];
//                      // //   * For each add effect a of c
//                      for (int add_effect : tasks_pre_eff[1][subtask])
//                      {
//                             for (int j = 0; j < (*m).numSubTasks[method]; j++)
//                             {
//                                    if (i != j) // not against yourself
//                                    {
//                                           int other_subtask = (*m).subTasks[method][j];
//                                           int other_subtask_pos = j;
//                                           // move all other subtasks with precondition a behind c
//                                           for (int precondition : tasks_pre_eff[0][other_subtask])
//                                           {
//                                                  if (add_effect == precondition)
//                                                  {
//                                                         edge e1 = edge(subtask_pos, other_subtask_pos);
//                                                         orderings[method].insert(e1);
//                                                  }
//                                           }
//                                           //  and all other sub tasks with a delete effect in front of it.
//                                           for (int del_effect : tasks_pre_eff[2][other_subtask])
//                                           {
//                                                  if (add_effect == del_effect)
//                                                  {
//                                                         edge e2 = edge(other_subtask_pos, subtask_pos);
//                                                         orderings[method].insert(e2);
//                                                  }
//                                           }
//                                    }
//                             }
//                      }

//                      // //   * For each delete effect d of c
//                      for (int del_effect : tasks_pre_eff[2][subtask])
//                      {
//                             for (int j = 0; j < (*m).numSubTasks[method]; j++)
//                             {
//                                    if (i != j)
//                                    {
//                                           int other_subtask = (*m).subTasks[method][j];
//                                           int other_subtask_pos = j; // its position among subtasks
//                                           // move all tasks with precondition d before c
//                                           for (int precondition : tasks_pre_eff[0][other_subtask])
//                                           {
//                                                  if (del_effect == precondition)
//                                                  {
//                                                         edge e2 = edge(other_subtask_pos, subtask_pos);
//                                                         orderings[method].insert(e2);
//                                                  }
//                                           }
//                                           // and all tasks with an add effect behind it.
//                                           for (int add_effect : tasks_pre_eff[1][other_subtask])
//                                           {
//                                                  if (del_effect == add_effect)
//                                                  {
//                                                         edge e1 = edge(subtask_pos, other_subtask_pos);
//                                                         orderings[method].insert(e1);
//                                                  }
//                                           }
//                                    }
//                             }
//                      }
//               }
//        }
//        return orderings;
// }

// if ordering between them doesn't exist, split it up?
// search for cycles in the set of orderings
// //no cycles use this linearization,  OR random break
std::vector<edge> *generate_total_ordering(Model *m, std::set<edge> *old_orderings)
{
       std::set<edge> *new_orderings = new std::set<edge>[(*m).numMethods];
       std::vector<edge> *linearised_orderings = new std::vector<edge>[(*m).numMethods];

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

              // set::vector<edge> edges_vec;
              // edges_vec.assign(edges.begin(), edges.end());

              // find and break cycles in proposed orderigns (without affecting required orderings)
              int V = (*m).numSubTasks[method];
              new_orderings[method] = break_cycle(edges, V);
              // new_orderings[method] = std::set(new_o.begin(), new_o.end());

              // make new orderings totally ordered
              Graph g2((*m).numSubTasks[method]);
              for (auto e : new_orderings[method])
                     g2.addEdge(e.start, e.end, 0);
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
       }
       return linearised_orderings;
}

void to_sas(Model *m, std::vector<edge> *linearised_orderings, string og_sas);

void linearize_model(Model *m, std::vector<edge> *linearised_orderings)
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
       }
}

// // use connies method
// void Process2() {
//        for (int i = 0; i < num_problems; i++)
//        {
//               pddl = problems_to_convert[i];
//               Model *m = setup_model(pddl);
//               certain_pre_eff, possible_pre_eff  = Connies_method();
//               // find orderings
//               std::set<edge> *orderings = find_orderings(m, tpe);
//               std::vector<edge> *linearised_orderings = generate_total_ordering2(m, orderings);
//               out(m, linearised_orderings, pddl);
//        }
// }

// use gregor's original method
void Process1(string filepath)
{

       string sas_file = filepath + ".sas";
       Model *m = setup_model(sas_file, true);
       int num_to_print = std::min((*m).numMethods, 20);
       for (int method = 0; method < num_to_print; method++)
       {
              for (int i = 0; i < (*m).numOrderings[method]; i++)
              {
                     printf("%i ", (*m).ordering[method][i]);
              }
              printf("\n");
       }

       auto start = std::chrono::high_resolution_clock::now();
       bool ***tpe = get_tasks_pre_eff(m);
       // std::set<int> **tpe = get_tasks_pre_eff(m);
       auto stop = std::chrono::high_resolution_clock::now();
       auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       cout << "Found prec and eff (" << duration.count() << " microseconds)\n";

       // int cmpd_task = (*m).decomposedTask[3];
       // printf("prec + eff, task for method %i\n", cmpd_task);
       // for (int i = 0; i < (*m).numVars; i++)
       // {
       //        if (tpe[0][cmpd_task][i])
       //        {
       //               printf("%i ", i);
       //        }
       // }
       // printf("\n");
       // for (int i = 0; i < (*m).numVars; i++)
       // {
       //        if (tpe[1][cmpd_task][i])
       //        {
       //               printf("%i ", i);
       //        }
       // }
       // printf("\n");
       // for (int i = 0; i < (*m).numVars; i++)
       // {
       //        if (tpe[2][cmpd_task][i])
       //        {
       //               printf("%i ", i);
       //        }
       // }
       // printf("\n");

       // find orderings
       start = std::chrono::high_resolution_clock::now();
       std::set<edge> *orderings = find_orderings(m, tpe);
       std::vector<edge> *linearised_orderings = generate_total_ordering(m, orderings);
       linearize_model(m, linearised_orderings);
       stop = std::chrono::high_resolution_clock::now();
       duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       cout << "The rest took (" << duration.count() << " microseconds)\n";

       printf("After linearise \n");
       for (int method = 0; method < min((*m).numMethods, 20); method++)
       {
              for (int i = 0; i < (*m).numOrderings[method]; i++)
              {
                     printf("%i ", (*m).ordering[method][i]);
              }
              printf("( subtasks ");
              for (int i = 0; i < (*m).numSubTasks[method]; i++)
              {
                     printf("%i ", (*m).subTasks[method][i]);
              }
              printf(")");
              printf("\n");
       }

       string domain_name = "linearized-domains/" + sas_file + "-TO-domain.pddl";
       string problem_name = "linearized-problems/" + sas_file + "-TO.pddl";
       m->writeToPDDL(domain_name, problem_name);
}

// IPC PO benchmark hddl (:requirements :method-preconditions :equality :typing :hierarchy :negative-preconditions :universal-preconditions)
// does not have  conditional effects?

int main(int argc, char *argv[])
{
       std::vector<string> problems_to_convert = {"problemrover01out", "parsed/problemtransport03", "parsed/problemtransport20"}; // problem-med4-"}; //,  , "problem-satellite", "problem-riot",
       for (int i = 0; i < problems_to_convert.size(); i++)
       {
              auto start = std::chrono::high_resolution_clock::now();
              Process1(problems_to_convert[i]);
              auto stop = std::chrono::high_resolution_clock::now();
              auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
              cout << duration.count() << " microseconds total\n";

              // Model *m = setup_model(problems_to_convert[i] + ".sas", true);
              // for (int a = 0; a < (*m).numActions; a++)
              // {
              //        print((*m).addVectors[a], (*m).numVars);
              //        print((*m).delVectors[a], (*m).numVars);
              // }
              // printf("\n");

              // Graph g((*m).numTasks);
              // printf("%i DUCK ", m->numMethods);
              // // find SCCs in graph decomposition
              // for (int method = 0; method < (*m).numMethods; method++)
              // {
              //        for (int j = 0; j < (*m).numSubTasks[method]; j++)
              //        {
              //               int subtask = (*m).subTasks[method][j];
              //               int decomposed = (*m).decomposedTask[method];
              //               g.addEdge(decomposed, subtask, 0);
              //        }
              // }
              // std::vector<edge> cycles = g.findAllCyclic();
              // printf("Cycle; ");
              // print(cycles);
       }
}
// int main(int argc, char *argv[])
// {

//        Model *m = setup_model("problemrover01out.sas"); //("test01out.sas"); //
//        std::set<int> **all_pre_eff = get_tasks_pre_eff(m);
//        std::set<int> **tpe = get_tasks_pre_eff(m, all_pre_eff);

//        int action = 3;
//        printf("Sample of results for corresponding primitive  task %i: ", action);
//        print(tpe[0][action]);
//        print(tpe[1][action]);
//        print(tpe[2][action]);

//        std::set<int> **tpe2 = get_tasks_pre_eff2(m);
//        printf("Sample of results for other method, corresponding primitive task %i: ", action);
//        print(tpe2[0][action]);
//        print(tpe2[1][action]);
//        print(tpe2[2][action]);
//        action = 4;
//        printf("Sample of results for other method, corresponding primitive  task %i: ", action);
//        print(tpe2[0][action]);
//        print(tpe2[1][action]);
//        print(tpe2[2][action]);
//        action = 5;
//        printf("Sample of results for other method, corresponding primitive task %i: ", action);
//        print(tpe2[0][action]);
//        print(tpe2[1][action]);
//        print(tpe2[2][action]);

//        // find orderings
//        std::set<edge> *orderings = find_orderings(m, tpe);
//        int method = 3;
//        printf("orderings found for method %i \n", method);
//        // subtasks
//        //  should be  6    8       5         7
//        //             2            2
//        //                        16,14      10
//        //                 10      5,2
//        // i.e. (0, 2), (1,3)  and NOT(2,2)  since thats itself
//        print(orderings[method]);

//        std::vector<edge> *linearised_orderings = break_cycle(m, orderings);
//        printf("orderings after cycle breaking for method");
//        print(linearised_orderings[method]);
//        printf("\n");

//        method = 7;
//        printf("orderings found for method %i\n", method);
//        print(orderings[method]);
//        printf("orderings that method already requires");
//        for (int i = 0; i < (*m).numOrderings[method - 1]; i += 2)
//        {
//               printf("(%i %i) ", (*m).ordering[method][i], (*m).ordering[method][i + 1]);
//        }
//        printf("\n");

//        printf("orderings after cycle breaking for method");
//        print(linearised_orderings[method]);

//        return 0;
// }
