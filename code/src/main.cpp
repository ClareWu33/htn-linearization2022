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
#include <algorithm>

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
       bool progressEffectLess = false;
       bool progressOneModActions = false;
       progression::Model *m = new Model(trackTasksInTN, maintainTaskReachability, progressEffectLess, progressOneModActions);
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

std::set<int> **get_tasks_pre_eff2_helper(Model *m, std::set<int> **&tasks_pre_eff, std::vector<edge> back_edges)
{
       // bool next_to_collect[(*m).numTasks] = {0}; // false
       // bool seen_before[(*m).numTasks] = {0}; // false
       bool is_finished[(*m).numTasks] = {false}; // (meaning that you have collected possible pre+eff from all children) init false
       int finished_tasks = 0;
       // fill the tree from bottom-up - the 'leaves' are actions
       for (int a = 0; a < (*m).numActions; a++)
       {
              is_finished[a] = true; // 1=true
       }
       finished_tasks = (*m).numActions;

       int just_stop = 0;
       while ((finished_tasks < (*m).numTasks)) //  && just_stop < 10
       {
              just_stop++;
              // printf("just stop %i", just_stop);
              for (int parent = 0; parent < (*m).numTasks; parent++)
              {
                     // if the parent has not collected
                     bool collect = !(is_finished[parent]);
                     // check if children for all methods (except back_edges) are done
                     // IN OTHER WORDS: DON'T WAIT FOR THE BACK EDGE NODE TO BE DONE, BECAUSE IT IS WAITING FOR *YOU* TO BE DONE
                     for (int i = 0; i < (*m).numMethodsForTask[parent]; i++)
                     {
                            int method = (*m).taskToMethods[parent][i];
                            for (int subtask_pos = 0; subtask_pos < (*m).numSubTasks[method]; subtask_pos++)
                            {
                                   int subtask = (*m).subTasks[method][subtask_pos];
                                   if (!(is_finished[subtask]))
                                   { // if edge not finished
                                          collect = false;
                                          // and it's not a back_edge
                                          for (edge e : back_edges)
                                          {
                                                 if (e.start == parent && e.end == subtask)
                                                 {
                                                        collect = true;
                                                 }
                                          }
                                   }
                            }
                     }
                     // collect pre_eff from all children
                     if (collect)
                     {
                            for (int i = 0; i < (*m).numMethodsForTask[parent]; i++)
                            {
                                   int method = (*m).taskToMethods[parent][i];
                                   for (int subtask_pos = 0; subtask_pos < (*m).numSubTasks[method]; subtask_pos++)
                                   {
                                          int subtask = (*m).subTasks[method][subtask_pos];
                                          if (parent == 127 && subtask == 128)
                                          {
                                                 printf("***BEFORE2***\n");
                                                 print(tasks_pre_eff[0][parent]);
                                                 print(tasks_pre_eff[1][parent]);
                                                 print(tasks_pre_eff[2][parent]);
                                                 printf("**************\n");
                                                 print(tasks_pre_eff[0][subtask]);
                                                 print(tasks_pre_eff[1][subtask]);
                                                 print(tasks_pre_eff[2][subtask]);
                                                 printf("**************\n");
                                          }
                                          if (parent == 127)
                                          {
                                                 printf("***BEFORE OTHER 127-> ? THINGS***\n");
                                                 print(tasks_pre_eff[0][parent]);
                                                 print(tasks_pre_eff[1][parent]);
                                                 print(tasks_pre_eff[2][parent]);
                                                 printf("**************\n");
                                                 print(tasks_pre_eff[0][subtask]);
                                                 print(tasks_pre_eff[1][subtask]);
                                                 print(tasks_pre_eff[2][subtask]);
                                                 printf("**************\n");
                                          }
                                          tasks_pre_eff[0][parent].insert(tasks_pre_eff[0][subtask].begin(), tasks_pre_eff[0][subtask].end());
                                          tasks_pre_eff[1][parent].insert(tasks_pre_eff[1][subtask].begin(), tasks_pre_eff[1][subtask].end());
                                          tasks_pre_eff[2][parent].insert(tasks_pre_eff[2][subtask].begin(), tasks_pre_eff[2][subtask].end());
                                          if (parent == 127 && subtask == 128)
                                          {
                                                 printf("***AFTER2***\n");
                                                 print(tasks_pre_eff[0][parent]);
                                                 print(tasks_pre_eff[1][parent]);
                                                 print(tasks_pre_eff[2][parent]);
                                                 printf("**************\n");
                                                 print(tasks_pre_eff[0][subtask]);
                                                 print(tasks_pre_eff[1][subtask]);
                                                 print(tasks_pre_eff[2][subtask]);
                                                 printf("**************\n");
                                          }
                                   }
                            }
                            finished_tasks++;
                            is_finished[parent] = true;
                     }
              }
       }

       return tasks_pre_eff;
}

//  build up from leaves (ignoring back edges )
std::set<int> **get_tasks_pre_eff2(Model *m)
{
       // make graph
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
       // find back edges in graph decomposition
       std::vector<edge> back_edges = g.findAllCycles((*m).initialTask);
       printf("number of back edges %lu\n", back_edges.size());

       // set up storage of results
       std::set<int> **tasks_pre_eff = new std::set<int> *[3];
       for (int i = 0; i < 3; i++)
       {
              tasks_pre_eff[i] = new std::set<int>[(*m).numTasks];
       }
       // fill the tree from bottom-up - the 'leaves' are actions
       for (int a = 0; a < (*m).numActions; a++)
       {
              tasks_pre_eff[0][a].insert((*m).precLists[a], &((*m).precLists[a][(*m).numPrecs[a]]));
              tasks_pre_eff[1][a].insert((*m).addLists[a], &((*m).addLists[a][(*m).numAdds[a]]));
              tasks_pre_eff[2][a].insert((*m).delLists[a], &((*m).delLists[a][(*m).numDels[a]]));
       }

       // RUN ONE
       get_tasks_pre_eff2_helper(m, tasks_pre_eff, back_edges);
       // push along back edge
       for (edge e : back_edges)
       {
              int parent = e.start;
              int subtask = e.end;

              if (e.start == 127 && e.end == 128)
              {
                     printf("***BEFORE***\n");
                     print(tasks_pre_eff[0][parent]);
                     print(tasks_pre_eff[1][parent]);
                     print(tasks_pre_eff[2][parent]);
                     printf("**************\n");
                     print(tasks_pre_eff[0][subtask]);
                     print(tasks_pre_eff[1][subtask]);
                     print(tasks_pre_eff[2][subtask]);
                     printf("**************\n");
              }
              tasks_pre_eff[0][parent].insert(tasks_pre_eff[0][subtask].begin(), tasks_pre_eff[0][subtask].end());
              tasks_pre_eff[1][parent].insert(tasks_pre_eff[1][subtask].begin(), tasks_pre_eff[1][subtask].end());
              tasks_pre_eff[2][parent].insert(tasks_pre_eff[2][subtask].begin(), tasks_pre_eff[2][subtask].end());
              if (e.start == 127 && e.end == 128)
              {
                     printf("***AFTER***\n");
                     print(tasks_pre_eff[0][parent]);
                     print(tasks_pre_eff[1][parent]);
                     print(tasks_pre_eff[2][parent]);
                     printf("**************\n");
                     print(tasks_pre_eff[0][subtask]);
                     print(tasks_pre_eff[1][subtask]);
                     print(tasks_pre_eff[2][subtask]);
                     printf("**************\n");
              }
       }
       // RUN TWO
       get_tasks_pre_eff2_helper(m, tasks_pre_eff, back_edges);

       return tasks_pre_eff;
}

/*bool ***get_tasks_pre_eff(int collect_to, int method, std::set<int> tasks_seen, Model *m, bool ***all_pre_eff)
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

                                   for (int v = 0; v < (*m).numVars; v++)
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
*/

std::set<edge> *find_orderings(Model *m, std::set<int> **tasks_pre_eff)
{
       // additional orderings per method
       std::set<edge> *orderings = new ::std::set<edge>[(*m).numMethods];

       //  iterate through every method and its "preconditions and effects"
       for (int method = 0; method < (*m).numMethods; method++)
       {
              // consider their subtasks
              for (int i = 0; i < (*m).numSubTasks[method]; i++)
              {
                     int subtask_pos = i; // its position among subtasks
                     int subtask = (*m).subTasks[method][i];
                     //   * For each add effect a of c
                     for (int add_effect : tasks_pre_eff[1][subtask])
                     {
                            for (int j = 0; j < (*m).numSubTasks[method]; j++)
                            {
                                   int x = 0;
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
// no cycles use this linearization,  OR random break
std::vector<edge> *generate_total_ordering(Model *m, std::set<edge> *old_orderings)
{
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
              std::set<edge> *new_orderings = new std::set<edge>[(*m).numMethods];
              int V = (*m).numSubTasks[method];
              new_orderings[method] = break_cycle(edges, V);

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
       printf("Before linearise \n");
       int num_to_print = std::min((*m).numMethods, 20);
       for (int method = 0; method < min((*m).numMethods, num_to_print); method++)
       {
              for (int i = 0; i < (*m).numOrderings[method]; i++)
              {
                     printf("%i ", (*m).ordering[method][i]);
              }
              printf("\n");
       }

       auto start = std::chrono::high_resolution_clock::now();
       // bool ***tpe = get_tasks_pre_eff(m);
       std::set<int> **tpe = get_tasks_pre_eff2(m);
       auto stop = std::chrono::high_resolution_clock::now();
       auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       cout << "Found prec and eff (" << duration.count() << " microseconds)\n";

       // find orderings
       start = std::chrono::high_resolution_clock::now();
       std::set<edge> *orderings;// = find_orderings(m, tpe);
       stop = std::chrono::high_resolution_clock::now();
       duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       cout << "Find Orderings took (" << duration.count() << " microseconds)\n";


       start = std::chrono::high_resolution_clock::now();
       // std::vector<edge> *linearised_orderings = generate_total_ordering(m, orderings);
       stop = std::chrono::high_resolution_clock::now();
       duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
       cout << "Linearise Orderings took (" << duration.count() << " microseconds)\n";

       // linearize_model(m, linearised_orderings);
       


       // printf("After linearise \n");
       // for (int method = 0; method < min((*m).numMethods, num_to_print); method++)
       // {
       //        for (int i = 0; i < (*m).numOrderings[method]; i++)
       //        {
       //               printf("%i ", (*m).ordering[method][i]);
       //        }
       //        printf("( subtasks ");
       //        for (int i = 0; i < (*m).numSubTasks[method]; i++)
       //        {
       //               printf("%i ", (*m).subTasks[method][i]);
       //        }
       //        printf(")");
       //        printf("\n");
       // }

       // string domain_name = "linearized-domains/" + sas_file + "-TO-domain.pddl";
       // string problem_name = "linearized-problems/" + sas_file + "-TO.pddl";
       // m->writeToPDDL(domain_name, problem_name);

       if (filepath == "problemrover01out")
       {
              int cmpd_task = 52;
              printf("cmpd task %i\n", cmpd_task);
              print(tpe[0][cmpd_task]); // 2 5 9 10 15 16 18
              print(tpe[1][cmpd_task]); // 2 4 5 6 9 10 14 16 18
              print(tpe[2][cmpd_task]); // 2 5 6 9 10 14 15 16 18
       }

       if (filepath == "parsed/problemtransport03")
       {
              //<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_4,package_7];m_load_ordering_0;1;0,-1>
              // 113
              // 114 1 -1
              // 0 1 -1
              ///////////

              int cmpd_task = 127;
              printf("cmpd task %i\n", cmpd_task);
              print(tpe[0][cmpd_task]);
              print(tpe[1][cmpd_task]);
              print(tpe[2][cmpd_task]);
              // m_drive_to_via_ordering_0
              // 127
              // 128 37 -1
              // m_drive_to_via_ordering_0
              // 128
              // 127 40 -1
              cmpd_task = 128;
              printf("cmpd task %i\n", cmpd_task);
              print(tpe[0][cmpd_task]);
              print(tpe[1][cmpd_task]);
              print(tpe[2][cmpd_task]);

              print((*m).addLists[40], (*m).numAdds[40]);
       }

       if (filepath == "problem-med4-")
       {
              // m_get_to_already_there
              // 66984
              // 32283 -1
              // -1
              // m_get_to_person_drives_themself
              // 66984
              // 66985 64995 -1
              // 0 1 -1
              printf("problem-med4-");

              int cmpd_task = 66984;
              printf("cmpd task %i\n", cmpd_task);
              print(tpe[0][cmpd_task]);

              // should be a subset of 66984
              cmpd_task = 66985;
              printf("cmpd task %i\n", cmpd_task);
              print(tpe[0][cmpd_task]);
       }
}

// IPC PO benchmark hddl (:requirements :method-preconditions :equality :typing :hierarchy :negative-preconditions :universal-preconditions)
// does not have  conditional effects?
int main(int argc, char *argv[])
{
       std::vector<string> problems_to_convert = {"problemrover01out", "parsed/problemtransport03", "problem-med4-"}; // "problem-med4-"}; // "problem-med4-"}; // "parsed/problemtransport20"}; // problem-med4-"}; //,  , "problem-satellite", "problem-riot", "problemrover01out", "parsed/problemtransport03",
       for (int i = 0; i < problems_to_convert.size(); i++)
       {
              auto start = std::chrono::high_resolution_clock::now();
              Process1(problems_to_convert[i]);
              auto stop = std::chrono::high_resolution_clock::now();
              auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
              cout << duration.count() << " microseconds total\n";


              /*Model *m = setup_model(problems_to_convert[i] + ".sas", true);
              int max=0;
              for (int method=0; method<(*m).numMethods; method++) {
                     if (max < (*m).numSubTasks[method]) {
                            max = (*m).numSubTasks[method];
                     }
              }
              printf("MAX size of method %i", max);*/
              /* Model *m = setup_model(problems_to_convert[i] + ".sas", true);
               (*m).calcSCCs();

               if ( (*m).calculatedSccs ) {
                      printf(" The SCCs has been calcualted ");
               }
               (*m).analyseSCCcyclicity();
               printf("numSCC: %i   num CyclicSCC: %i",  (*m).numSCCs, (*m).numCyclicSccs );
               (*m).sccsCyclic;
               for (int j=0; j<3; j++) {
                      if ((*m).sccIsAcyclic[j]) {
                             printf("There is acyclic at %i", j);
                      }
               }

               for (int j=0; j<(*m).numSCCs; j++) {
                      printf("There is acyclic at %i", (*m).sccTopOrder[j] );

               } */

              // std::set<int> **resulst = get_tasks_pre_eff2(m);
              //  for (int a = 0; a < (*m).numActions; a++)
              //  {
              //         print((*m).addVectors[a], (*m).numVars);
              //         print((*m).delVectors[a], (*m).numVars);
              //  }
              //  printf("\n");

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
