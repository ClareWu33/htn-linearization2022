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

// BUILD A DIRECTED GRAPH OF TASK DECOMPOSITIONS?
// then build up from leaves (ignoring if you have seen this task before)
std::set<int> **get_m_pre_eff(int method, Model *m, std::set<int> **all_pre_eff)
{
       for (int i = 0; i < (*m).numSubTasks[method]; i++)
       {
              int task = (*m).subTasks[method][i]; 
              if ((*m).isPrimitive[task])
              {
                     // integer variable that they act on
                     all_pre_eff[0][method].insert((*m).precLists[task],  &((*m).precLists[task][(*m).numPrecs[task]]));   //= concatenate(all_pre_eff[0][method], (*m).precLists[task], (*m).numPrecs[task]);
                     all_pre_eff[1][method].insert((*m).addLists[task],  &((*m).addLists[task][(*m).numAdds[task]]) ); // = concatenate(all_pre_eff[1][method], (*m).addLists[task], (*m).numAdds[task]);
                     all_pre_eff[2][method].insert((*m).delLists[task],  &((*m).delLists[task][(*m).numDels[task]]) );  // = concatenate(all_pre_eff[2][method], (*m).delLists[task], (*m).numDels[task]);
              }
              else
              {
                     int *more_methods = (*m).taskToMethods[task];
                     for (int j = 0; j < (*m).numMethodsForTask[task]; j++)
                     {
                            int mm = more_methods[j];
                            if (mm != method) {
                                   get_m_pre_eff(mm, m, all_pre_eff); // passes ptr, all_pre_eff changes kept
                            }
                     }
              }
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
       // collect preconditions and effects
       for (int method = 0; method < (*m).numMethods; method++)
       {
              all_pre_eff = get_m_pre_eff(method, m, all_pre_eff); // should keep all_pre_eff state from previous runs
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
                     tasksPreEff[0][task].insert(all_pre_eff[0][method].begin(), all_pre_eff[0][method].end()); // tasks_pre_eff[0][task] += all_pre_eff[0][method];
                     tasksPreEff[1][task].insert(all_pre_eff[1][method].begin(), all_pre_eff[1][method].end()); // tasks_pre_eff[1][task] += all_pre_eff[1][method];
                     tasksPreEff[2][task].insert(all_pre_eff[2][method].begin(), all_pre_eff[2][method].end()); // tasks_pre_eff[2][task] += all_pre_eff[2][method];
              }
              // action
              if ((*m).isPrimitive[task]) {
                     tasksPreEff[0][task].insert(&(*m).precLists[task][0], &(*m).precLists[task][(*m).numPrecs[task]] );  
                     tasksPreEff[1][task].insert(&(*m).addLists[task][0], &(*m).addLists[task][(*m).numAdds[task]] );  // = concatenate(tasksPreEff[1][task], (*m).addLists[task], (*m).numAdds[task]);
                     tasksPreEff[2][task].insert(&(*m).delLists[task][0], &(*m).delLists[task][(*m).numDels[task]] );  // = concatenate(tasksPreEff[2][task], (*m).delLists[task], (*m).numDels[task]);
              }
       }
       return tasksPreEff;
}

// // Each such non-negative integer $i$ describes that the state feature $i$ is a precondition of this action.
// // orderings [per method] <array of order pairs>  <- accumulate order pairs
std::vector<int> *find_orderings(Model *m, std::set<int> **tasks_pre_eff)
{
       // additional orderings per method
       std::vector<int> *orderings = new ::std::vector<int>[(*m).numMethods];

       //  iterate through every method and its "preconditions and effects"
       for (int method = 0; method < (*m).numMethods; method++)
       {
              // consider their subtasks
              for (int i = 0; i < (*m).numSubTasks[method]; i++)
              {
                     int subtask = (*m).subTasks[method][i];
                     // //   * For each add effect a of c
                     for (int add_effect : tasks_pre_eff[1][subtask])
                     {
                            for (int j = 0; j < (*m).numSubTasks[method]; j++)
                            {
                                   if (i != j)
                                   {
                                          int other_subtask = (*m).subTasks[method][j];
                                          // move all other subtasks with precondition a behind c
                                          for (int precondition : tasks_pre_eff[0][other_subtask])
                                          {
                                                 if (add_effect == precondition)
                                                 {
                                                        orderings[method].push_back(subtask);
                                                        orderings[method].push_back(other_subtask); //(subtask, other_subtask);  (add_idx, pre_idx)
                                                 }
                                          }
                                          //  and all other sub tasks with a delete effect in front of it.
                                          for (int del_effect : tasks_pre_eff[2][other_subtask])
                                          {
                                                 if (add_effect == del_effect)
                                                 {
                                                        orderings[method].push_back(other_subtask);
                                                        orderings[method].push_back(subtask); // (other_subtask, subtask); (del_idx, add_idx);
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
                                   if (i != j) {
                                          int other_subtask = (*m).subTasks[method][j];
                                          // move all tasks with precondition d before c  "move all subtasks with precondition a behind c"
                                          for (int precondition : tasks_pre_eff[0][other_subtask])
                                          {
                                                 if (del_effect == precondition)
                                                 {
                                                        orderings[method].push_back(other_subtask);
                                                        orderings[method].push_back(subtask);
                                               }
                                          }
                                          // and all tasks with an add effect behind it.  "and all sub tasks with a delete effect in front of it"
                                          for (int add_effect : tasks_pre_eff[1][other_subtask])
                                          {
                                                 if (del_effect == add_effect)
                                                 {
                                                        orderings[method].push_back(subtask);
                                                        orderings[method].push_back(other_subtask);
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
std::vector<int> * break_cycle(Model * m, std::vector<int> * orderings)
{
       for (int method=0; method<(*m).numMethods; method++) { 
              Graph g((*m).numSubTasks[method]); // num of vertices = subtasks

              //  first priority to respect: (*m).orderings
              for (int i=0; i<(*m).numOrderings[method]-1; i=i+2) 
              {
                     int o1 = (*m).ordering[method][i];
                     int o2 = (*m).ordering[method][i+1];
                     g.addEdge(o1, o2);
              }

              //   second priority to respect: output of find_orderings
              for (int i=0; i<orderings[method].size()-1; i=i+2) 
              {
                     int o1 = (*m).ordering[method][i];
                     int o2 = (*m).ordering[method][i+1];
                     g.addEdge(o1, o2);
              }

              // find cycles
              cycle c = g.findCyclic();
              int rand_idx =  std::rand() % (c.edges.size() / 2);
              // break cycles
              orderings[method] = g.get_orderings();
              //printf("Is it here it broke?");
              //orderings[method].erase(orderings[method].begin() + rand_idx);  // [0 ,1,2, 3, ...] ->
              //orderings[method].erase(orderings[method].begin() + rand_idx);   // [0, 1 ,3, ...]  -> [0,1, ...]    is  pop_at(2), pop_at(2) 
       }
       return orderings;
}

std::vector<int> test() {
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
       std::vector v = test();
       Model *m = setup_model("problemrover01out.sas"); //("test.sas"); 

       std::set<int> **all_pre_eff = get_methods_pre_eff(m);

       int method = 2;
       printf("Sample of results for 3rd method:  prec %lu adds %lu del %lu \n", all_pre_eff[0][method].size(), all_pre_eff[1][method].size(), all_pre_eff[2][method].size());
       print(all_pre_eff[0][method]);
       print(all_pre_eff[1][method]);
       print(all_pre_eff[2][method]);

       method = 1;
       printf("Sample of results for 2nd method:  prec %lu adds %lu del %lu \n", all_pre_eff[0][method].size(), all_pre_eff[1][method].size(), all_pre_eff[2][method].size());
       print(all_pre_eff[0][method]);
       print(all_pre_eff[1][method]);
       print(all_pre_eff[2][method]);

       std::set<int> **tpe = get_tasks_pre_eff(m, all_pre_eff);
       int cmpd_task = (*m).decomposedTask[method];
       printf("Sample of results for corresponding COMPOUND task %i:  prec %lu adds %lu del %lu \n", (*m).decomposedTask[method], tpe[0][cmpd_task].size(), tpe[1][cmpd_task].size(), tpe[2][cmpd_task].size());
       print(tpe[0][cmpd_task]);
       print(tpe[1][cmpd_task]);
       print(tpe[2][cmpd_task]);

       std::vector<int> *orderings = find_orderings(m, tpe);
       printf("orderings found for 1st method \n");
       print(orderings[method]);

       std::vector<int> * new_orderings  = break_cycle(m, orderings);
       printf("orderings fafter cycle breaking for 1st method");
       print(new_orderings[method]);
//        // new_orderings = linearised
       // for (int i = 0; i < results[0][0].size(); i++)
       // {
       //        printf("%i ", results[0][0][i]);
       // };
       // printf("\n");
       // for (int i = 0; i < results[1][0].size(); i++)
       // {
       //        printf("%i ", results[1][0][i]);
       // };
       // printf("\n");
       // for (int i = 0; i < results[2][0].size(); i++)
       // {
       //        printf("%i ", results[2][0][i]);
       // };
       // printf("\n");

       return 0;
}
 