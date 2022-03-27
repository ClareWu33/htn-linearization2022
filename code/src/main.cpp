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

class edge
{

public:
       int start;
       int end;
       edge(int s, int e)
       {
              start = s;
              end = e;
       }

       bool operator<(const edge &rhs) const
       {
              if (start < rhs.start || (start == rhs.start && end < rhs.end))
              {
                     return true;
              }
              return false;
       }

       bool operator==(const edge &rhs) const
       {
              if (start == rhs.start && end == rhs.end)
              {
                     return true;
              }
              return false;
       }
       bool operator>(const edge &rhs) const
       {
              return !(operator<(rhs)) && !(operator==(rhs));
              // if (start > rhs.start)
              // {
              //        return true;
              // }
              // if (start == rhs.start && end > rhs.end) {
              //        return true;
              // }
              // return false;
       }

       void print()
       {
              printf("(%i, %i)", start, end);
       }
};

void print(std::set<edge> s)
{
       for (auto elem : s)
       {
              elem.print();
       }
       printf("\n");
}

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

// or build a directed graph ~= TDG
// then build up from leaves (ignoring if you have seen this task before)
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
                            all_pre_eff[0][collect_to].insert((*m).precLists[subtask], &((*m).precLists[subtask][(*m).numPrecs[subtask]])); //= concatenate(all_pre_eff[0][method], (*m).precLists[task], (*m).numPrecs[task]);
                            all_pre_eff[1][collect_to].insert((*m).addLists[subtask], &((*m).addLists[subtask][(*m).numAdds[subtask]]));    // = concatenate(all_pre_eff[1][method], (*m).addLists[task], (*m).numAdds[task]);
                            all_pre_eff[2][collect_to].insert((*m).delLists[subtask], &((*m).delLists[subtask][(*m).numDels[subtask]]));    // = concatenate(all_pre_eff[2][method], (*m).delLists[task], (*m).numDels[task]);
                     }
                     else
                     {
                            int *more_methods = (*m).taskToMethods[subtask];
                            for (int j = 0; j < (*m).numMethodsForTask[subtask]; j++)
                            {
                                   int mm = more_methods[j];
                                   std::set<int> new_tasks_seen(tasks_seen);  new_tasks_seen.insert(subtask);
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
                     int x=0;
                     tasksPreEff[0][task].insert(&(*m).precLists[task][0],  &(*m).precLists[task][(*m).numPrecs[task]]);
                     tasksPreEff[1][task].insert(&(*m).addLists[task] [0],  &(*m).addLists[task] [(*m).numAdds[task]]); 
                     tasksPreEff[2][task].insert(&(*m).delLists[task] [0],  &(*m).delLists[task] [(*m).numDels[task]]); 
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
std::set<edge> *break_cycle(Model *m, std::set<edge> *orderings)
{
       std::set<edge> *new_orderings = new std::set<edge>[(*m).numMethods];

       for (int method = 0; method < (*m).numMethods; method++)
       {
              Graph g((*m).numSubTasks[method]); // num of vertices = subtasks
              //  first priority to respect: (*m).orderings
              for (int i = 0; i < (*m).numOrderings[method] - 2; i += 2)
              {
                     int o1 = (*m).ordering[method][i];
                     int o2 = (*m).ordering[method][i + 1];
                     // printf("numOrderings  o1 %i o2 % i\n", o1, o2);
                     g.addEdge(o1, o2);
              }

              //   second priority to respect: output of find_orderings
              int i = 0;
              for (auto e : orderings[method])
              {
                     i++;
                     printf("why does this go forever? i=%i \n", i);
                     g.addEdge(e.start, e.end);
              }

              // // find cycles
              // cycle c = g.findCyclic();
              // int rand_idx =  std::rand() % (c.edges.size() / 2);
              //// break cycles
              // new_orderings[method] = g.get_orderings();
              // printf("Is it here it broke?");
              // orderings[method].erase(orderings[method].begin() + rand_idx);  // [0 ,1,2, 3, ...] ->
              // orderings[method].erase(orderings[method].begin() + rand_idx);   // [0, 1 ,3, ...]  -> [0,1, ...]    is  pop_at(2), pop_at(2)
       }
       return new_orderings;
}

// make it totally ordered

// produce new T.O Domain
Model * TO_Domain(Model *m, std::set<edge> *orderings) {
for (int method=0; method < (*m).numMethods; method++) {

}
return m;
}

std::vector<int> test()
{
       std::vector<int> v1;
       return v1;
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

       Model *       m = setup_model("problemrover01out.sas"); //("test01out.sas"); //
       std::set<int> **all_pre_eff = get_methods_pre_eff(m);
       std::set<int> **tpe = get_tasks_pre_eff(m, all_pre_eff);
       
       int action = 3;
       printf("Sample of results for corresponding primitive task %i:  prec %lu adds %lu del %lu \n", action, tpe[0][action ].size(), tpe[1][action ].size(), tpe[2][action ].size());
       print(tpe[0][action ]);
       print(tpe[1][action ]);
       print(tpe[2][action ]);

       std::set<edge> *orderings = find_orderings(m, tpe);
       int method = 3;
       printf("orderings found for %i method \n", method);
       printf("Subtasks for method ");                         // should be  6    8      5         7
                                                               //            2           2 
                                                               //                      16,14      10
                                                               //                10    5,2     
                                                               //        i.e. (0, 2)  and NOT(2,2)  since thats itself
       print((*m).subTasks[method], (*m).numSubTasks[method]);
       print((*m).precLists[6], (*m).numPrecs[6]);
       print((*m).precLists[8], (*m).numPrecs[8]);
       print((*m).precLists[5], (*m).numPrecs[5]);
       print((*m).precLists[7], (*m).numPrecs[7]);

       printf("__________");
       print((*m).addLists[6], (*m).numAdds[6]);
       print((*m).addLists[8], (*m).numAdds[8]);
       print((*m).addLists[5], (*m).numAdds[5]);
       print((*m).addLists[7], (*m).numAdds[7]);

       printf("__________");

       printf("orderings "); print(orderings[method]);

       // for (int me = 0; me <(*m).numMethods; me++) {
       //        printf("size of orderings for me %i? %lu\n", me, orderings[me].size());
       // }

       // problem is HERE
      std::set<edge> *new_orderings = break_cycle(m, orderings);
       printf("orderings after cycle breaking for 1st method");
      print(new_orderings[method]);

       return 0;
}
