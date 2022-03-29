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
#include "../pandaPIengine/src/Model.h"
#include "../pandaPIengine/src/intDataStructures/IntPairHeap.h"
#include "../pandaPIengine/src/ProgressionNetwork.h"
#include "../pandaPIengine/src/flags.h"
#include "../pandaPIengine/src/intDataStructures/noDelIntSet.h"
#include "../pandaPIengine/src/intDataStructures/FlexIntStack.h"
#include "../pandaPIengine/src/intDataStructures/IntUtil.h"
#include "../pandaPIengine/src/intDataStructures/StringUtil.h"

progression::Model *setup_model(string fileName)
{
       bool trackTasksInTN = false;
       progression::eMaintainTaskReachability maintainTaskReachability = mtrNO; // enum eMaintainTaskReachability {mtrNO, mtrACTIONS, mtrALL};
       bool progressEffectLess = true;
       bool progressOneModActions = true;
       progression::Model *m = new Model(true, maintainTaskReachability, true, true);
       m->isHtnModel = true;

       std::ifstream fileStream;
       fileStream.open(fileName);
       if (fileStream.is_open())
       {
              printf("The problem file was opened successfully.");
       }

       m->read(&fileStream);
       return m;
}

// find a better compund task pre + eff ? // def get_Connie_compound_pre_eff(Node Compound_Task) {}

// find the cmpd task pre+eff by just aggregrating all of them together
// gets the preconditons and effects for one method

// TODO: build a directed graph ~= TDG
// then build up from leaves (ignoring if you have seen this task before)
// TODO: time difference
//  #include <chrono>
// using namespace std::chrono;

// auto start = high_resolution_clock::now();

// auto duration = duration_cast<microseconds>(stop - start);
// cout << duration.count() << endl;
/*
std::set<int> **get_m_pre_eff2(int collect_to, int method, std::set<int> tasks_seen, Model *m, std::set<int> **tasks_pre_eff)
{
       // build tdg/ 2 dir graph
       Graph to_subtask = Graph((*m).numTasks);
       Graph from_subtask = Graph((*m).numTasks);

       for (int method = 0; method < (*m).numMethods; method++)
       {
              int decomposed_task = (*m).decomposedTask[method];
              for (int subtask_pos = 0; subtask_pos < (*m).numSubTasks; subtask_pos++)
              {
                     int subtask = (*m).subTasks[method][subtask_pos];

                     to_subtask.addEdge(decomposed_task, subtask);
                     from_subtask.addEdge(subtask, decomposed_task);
              }
       }

       // fill the tree from bottom-up
       bool is_filled[(*m).numTasks] = {0}; // false
       int filled_tasks = 0;
       // the 'leaves' are actions
       for (int a = 0; a < (*m).numActions; a++)
       {
              tasks_pre_eff[0][a].insert((*m).precLists[subtask], &((*m).precLists[subtask][(*m).numPrecs[subtask]]));
              tasks_pre_eff[1][a].insert((*m).addLists[subtask], &((*m).addLists[subtask][(*m).numAdds[subtask]]));
              tasks_pre_eff[2][a].insert((*m).delLists[subtask], &((*m).delLists[subtask][(*m).numDels[subtask]]));
              is_filled[a] = 1; // true
       }
       filled_tasks = (*m).numActions;

       // // ver1 collect for all compund tasks whose every subtasks has pre+add+del collected
       // for (int task = (*m).numActions; task < (*m).numTasks; task++)
       // {
       //        int parent_task = g.adj[task];
       //        if (is_filled[task]) && !(is_filled[parent_task])))
       //               {
       //                      parent_task = g.adj[task];
       //                      tasks_pre_eff[0][parent_task].insert(tasks_pre_eff[0][task].begin(), tasks_pre_eff[0][task].end());
       //                      tasks_pre_eff[1][parent_task].insert(tasks_pre_eff[1][task].begin(), tasks_pre_eff[1][task].end());
       //                      tasks_pre_eff[2][parent_task].insert(tasks_pre_eff[2][task].begin(), tasks_pre_eff[2][task].end());
       //               }
       //        is_filled[parent_task] = (all_true(is_filled, to_subtask.adj[c_task]);
       // }

       // ver2 collect for all compund tasks whose every subtasks has pre+add+del collected
       while (filled_tasks < (*m).numTasks)
       {
              for (int c_task = (*m).numActions; c_task < (*m).numTasks; c_task++)
              {
                     // for compund tasks that still need pre+eff
                     if (!(is_filled[c_task]))
                     {
                            // if all subtasks (all method) for this parent task, has pre+add+del collected
                            if (all_true(is_filled, to_subtask.adj[c_task])
                            {
                                   for (int i = 0; i < numMethodsForTask[c_task]; i++)
                                   {
                                          int method = (*m).taskToMethods[c_task][i];
                                          for (int subtask_pos = 0; subtask_pos < (*m).numSubTasks[method]; subtask_pos++)
                                          {
                                                 int subtask = (*m).subTasks[method][subtask_pos];
                                                 tasks_pre_eff[0][c_task].insert(tasks_pre_eff[0][subtask].begin(), tasks_pre_eff[0][subtask].end());
                                                 tasks_pre_eff[1][c_task].insert(tasks_pre_eff[1][subtask].begin(), tasks_pre_eff[1][subtask].end());
                                                 tasks_pre_eff[2][c_task].insert(tasks_pre_eff[2][subtask].begin(), tasks_pre_eff[2][subtask].end());
                                          }
                                   }
                            }
                     }
              }
       }
} */
//* END TODO *//

std::set<int> **get_m_pre_eff(int collect_to, int method, std::set<int> tasks_seen, Model *m, std::set<int> **all_pre_eff)
{
       for (int i = 0; i < (*m).numSubTasks[method]; i++)
       {
              int subtask = (*m).subTasks[method][i];
              if (!(is_in(subtask, tasks_seen)))
              {
                     if ((*m).isPrimitive[subtask])
                     {
                            // integer variable that they act on
                            all_pre_eff[0][collect_to].insert((*m).precLists[subtask], &((*m).precLists[subtask][(*m).numPrecs[subtask]]));
                            all_pre_eff[1][collect_to].insert((*m).addLists[subtask], &((*m).addLists[subtask][(*m).numAdds[subtask]]));
                            all_pre_eff[2][collect_to].insert((*m).delLists[subtask], &((*m).delLists[subtask][(*m).numDels[subtask]]));
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

// if ordering between them doesn't exist, split it up?
// search for cycles in the set of orderings
// //no cycles use this linearization,  OR random break
std::vector<edge> *break_cycle(Model *m, std::set<edge> *old_orderings)
{
       std::set<edge> *new_orderings = new std::set<edge>[(*m).numMethods];
       std::vector<edge> *linearised_orderings = new std::vector<edge>[(*m).numMethods];

       for (int method = 0; method < (*m).numMethods; method++)
       {
              Graph g((*m).numSubTasks[method], 2); // num of vertices = subtasks for method

              //  first priority to respect: (*m).orderings
              for (int i = 0; i < (*m).numOrderings[method] - 2; i += 2)
              {
                     int o1 = (*m).ordering[method][i];
                     int o2 = (*m).ordering[method][i + 1];
                     g.addEdge(o1, o2, 0);
              }

              //   second priority to respect: output of find_orderings
              for (auto e : old_orderings[method])
              {
                     g.addEdge(e.start, e.end, 1);
              }

              // find cycles
              new_orderings[method] = old_orderings[method];
              std::vector<cycle> all_cycles = g.findCyclic();
              for (cycle c : all_cycles)
              {
                     if (c.isCycle)
                     {
                            if (c.edges[1].size() > 0)
                            {
                                   // select a random cycle where priority = 1
                                   new_orderings[method] = g.get_orderings(); // array of  edge set
                                   // check that it is not a higher priority edge as well
                                   edge rand_edge = *(c.edges[0].begin());
                                   while (c.edges[0].find(rand_edge) != c.edges[0].end())
                                   { 
                                          int rand_edge_idx = (std::rand() % (c.edges[1].size()) );
                                          std::vector<edge> edges_vec;    edges_vec.assign((c.edges[1]).begin(), (c.edges[1]).end());
                                          rand_edge = edges_vec[rand_edge_idx];
                                   }
                                   // break cycles
                                   new_orderings[method].erase(rand_edge);
                            }
                     }
              }

              //// TODO: debug make new orderings totally ordered
              Graph g2((*m).numSubTasks[method]);
              for (auto e : new_orderings[method])
                     g2.addEdge(e.start, e.end);

              stack<int> Stack = g.topologicalSort();

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

// produce new T.O Domain  (modifies it in place)
Model *TO_Domain(Model *m, std::vector<edge> *new_orderings)
{
       for (int method = 0; method < (*m).numMethods; method++)
       {
              (*m).numOrderings[method] = new_orderings[method].size();
              (*m).ordering[method] = new int[new_orderings[method].size()];
              int i = 0;
              for (auto edge : new_orderings[method])
              {
                     (*m).ordering[method][i] = edge.start;
                     (*m).ordering[method][i] = edge.end;
                     i += 2;
              }
       }
       return m;
}

// use gregor's original method
// void Process1() {
//       std::set<int> **all_pre_eff = get_methods_pre_eff(m);
//       std::set<int> **tpe = get_tasks_pre_eff(m, all_pre_eff);
//       std::vector<int> *orderings = find_orderings(m, tpe);
//        std::vector<int> * new_orderings  = break_cycle(m, orderings);
//        // new_orderings = linearised
// }

// // use connies method
// void Process2() {
//        certain_pre_eff, possible_pre_eff  = Connies_method();
//        std::vector<int> * orderings = find_orderings(m, certain_pre_eff);
//        std::vector<int> * new_orderings  = break_cycle_more(orderings);
//        // new_orderings = linearised
// }

int main(int argc, char *argv[])
{

       Model *m = setup_model("problemrover01out.sas"); //("test01out.sas"); //
       std::set<int> **all_pre_eff = get_methods_pre_eff(m);
       std::set<int> **tpe = get_tasks_pre_eff(m, all_pre_eff);

       int action = 3;
       printf("Sample of results for corresponding primitive task %i:  prec %lu adds %lu del %lu \n", action, tpe[0][action].size(), tpe[1][action].size(), tpe[2][action].size());
       print(tpe[0][action]);
       print(tpe[1][action]);
       print(tpe[2][action]);

       std::set<edge> *orderings = find_orderings(m, tpe);
       int method = 3;
       printf("orderings found for %i method \n", method);
       printf("Subtasks for method "); // should be  6    8      5         7
                                       //            2           2
                                       //                      16,14      10
                                       //                10    5,2
                                       //        i.e. (0, 2)  and NOT(2,2)  since thats itself
       printf("orderings ");
       print(orderings[method]);

       // TODO: not yet fully debugged
       std::vector<edge> *linearised_orderings = break_cycle(m, orderings);
       printf("orderings after cycle breaking for 1st method");
       print(linearised_orderings[method]);

       return 0;
}
