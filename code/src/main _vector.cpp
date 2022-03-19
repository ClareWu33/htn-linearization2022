#include <climits>
#include <string>
#include <vector>
#include <set>
#include <istream>
#include <map>
#include <forward_list>
#include <iostream>
#include <fstream>
#include <sstream>

// pandPI code for storing an HTN planning model
#include "../pandaPIengine/src/Model.h"
#include "../pandaPIengine/src/intDataStructures/IntPairHeap.h"
#include "../pandaPIengine/src/ProgressionNetwork.h"
#include "../pandaPIengine/src/flags.h"
#include "../pandaPIengine/src/intDataStructures/noDelIntSet.h"
#include "../pandaPIengine/src/intDataStructures/FlexIntStack.h"
#include "../pandaPIengine/src/intDataStructures/IntUtil.h"
#include "../pandaPIengine/src/intDataStructures/StringUtil.h"

void print(std::vector<int> vec1)
{
       for (int i = 0; i < vec1.size(); i++)
       {
              printf("%i ", vec1[i]);
       }
       printf("\n");
}

void print(int *arr1, int arr1_size)
{
       for (int i = 0; i < arr1_size; i++)
       {
              printf("%i ", arr1[i]);
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

// find a better compund task pre + eff ?
// def get_Connie_compound_pre_eff(Node Compound_Task) {}

// find the cmpd task pre+eff by just aggregrating all of them together
bool is_in(int m1, std::vector<int> *m_to_check)
{
       for (int i = 0; i < (*m_to_check).size(); i++)
       {
              if (m1 == (*m_to_check)[i])
              {
                     return true;
              }
       }
       return false;
}

std::vector<int> concatenate(std::vector<int> arr1, int *arr2, int arr2_size)
{
       for (int i = 0; i < arr2_size; i++)
       {
              int elem = arr2[i];
              arr1.push_back(elem);
       }
       return arr1;
}

std::set<int> concatenate(std::set<int> arr1, int *arr2, int arr2_size)
{
       for (int i = 0; i < arr2_size; i++)
       {
              int elem = arr2[i];
              arr1.insert(elem);
       }
       return arr1;
}

// fills in the int method,   section of all_pre_eff[0]m all_pre_eff[1], and   all_pre_eff[2]
std::set<int> **get_m_pre_eff(int method, Model *m, std::set<int> **all_pre_eff)
{
       for (int i = 0; i < (*m).numSubTasks[method]; i++)
       {
              int task = (*m).subTasks[method][i];
              // printf("task %s \n", (*m).taskNames[task].c_str());
              if ((*m).isPrimitive[task])
              {
                     all_pre_eff[0][method] = concatenate(all_pre_eff[0][method], (*m).precLists[task], (*m).numPrecs[task]);
                     all_pre_eff[1][method] = concatenate(all_pre_eff[1][method], (*m).addLists[task], (*m).numAdds[task]);
                     all_pre_eff[2][method] = concatenate(all_pre_eff[2][method], (*m).delLists[task], (*m).numDels[task]);
              }
              else
              {
                     int *more_methods = (*m).taskToMethods[task];
                     for (int j = 0; j < (*m).numMethodsForTask[task]; j++)
                     {
                            int mm = more_methods[j];
                            get_m_pre_eff(mm, m, all_pre_eff); // automatically keeps all_pre_eff changes, bcs pointer
                     }
              }
       }
       return all_pre_eff; // pre, add, dele
}

// finds all methods
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
std::vector<int> **get_tasks_pre_eff(Model *m, std::vector<int> **all_pre_eff)
{
       std::vector<int> **tasksPreEff = new ::std::vector<int> *[3];
       for (int i = 0; i < 3; i++)
       {
              tasksPreEff[i] = new std::vector<int>[(*m).numTasks];
       }

       // for each task
       for (int task = 0; task < (*m).numTasks; task++)
       {
              // collect pre+eff for each method (if any) that applies to the task
              for (int j = 0; j < (*m).numMethodsForTask[task]; j++)
              {
                     int method = (*m).taskToMethods[task][j];                                                                              // printf("method %i applies", m->taskToMethods[i][j]);
                     tasksPreEff[0][task].insert(tasksPreEff[0][task].end(), all_pre_eff[0][method].begin(), all_pre_eff[0][method].end()); // tasks_pre_eff[0][task] += all_pre_eff[0][method];
                     tasksPreEff[1][task].insert(tasksPreEff[1][task].end(), all_pre_eff[1][method].begin(), all_pre_eff[1][method].end()); // tasks_pre_eff[1][task] += all_pre_eff[1][method];
                     tasksPreEff[2][task].insert(tasksPreEff[2][task].end(), all_pre_eff[2][method].begin(), all_pre_eff[2][method].end()); // tasks_pre_eff[2][task] += all_pre_eff[2][method];
              }
              // // action
              // if ((*m).isPrimitive[task]) {
              //        //tasksPreEff[0][task] = concatenate(tasksPreEff[0][task], (*m).precLists[task], (*m).numPrecs[task]); // int x = 0;
              //        //tasksPreEff[1][task] = concatenate(tasksPreEff[1][task], (*m).addLists[task], (*m).numAdds[task]);
              //        //tasksPreEff[2][task] = concatenate(tasksPreEff[2][task], (*m).delLists[task], (*m).numDels[task]);
              // }
       }
       return tasksPreEff;
}

// // Each such non-negative integer $i$ describes that the state feature $i$ is a precondition of this action.
// // orderings [per method] <array of order pairs>  <- accumulate order pairs
std::vector<int> *find_orderings(Model *m, std::vector<int> **all_pre_eff)
{
       // additional orderings per method
       std::vector<int> *orderings = new ::std::vector<int>[(*m).numMethods];

       //  iterate through every method and its "preconditions and effects"
       for (int method = 0; method < (*m).numMethods; method++)
       {
              // int decomposed_task = decomposedTask[method];
              // consider their subtasks
              for (int i = 0; i < (*m).numSubTasks[method]; i++)
              {
                     int subtask = (*m).subTasks[method][i];
                     // //   * For each add effect a of c
                     for (int add_idx = 0; add_idx < all_pre_eff[1][method].size(); add_idx++)
                     {
                            int add_effect = all_pre_eff[1][method][add_idx];

                            for (int j = 0; j < (*m).numSubTasks[method]; j++)
                            {
                                   int other_subtask = (*m).subTasks[method][j];
                                   // move all subtasks with precondition a behind c
                                   for (int pre_idx = 0; pre_idx < all_pre_eff[0][method].size(); pre_idx++)
                                   {
                                          int precondition = all_pre_eff[0][method][pre_idx];
                                          if (precondition == add_effect)
                                          {
                                                 orderings += (subtask, other_subtask); // (add_idx, pre_idx)
                                          }
                                   }
                                   //  and all sub tasks with a delete effect in front of it.
                                   for (int del_idx = 0; del_idx < all_pre_eff[2][method].size(); del_idx++)
                                   {
                                          int del_effect = all_pre_eff[2][method][del_idx];
                                          if (add_effect == del_effect)
                                          {
                                                 orderings += (other_subtask, subtask); // (del_idx, add_idx);
                                          }
                                   }
                            }
                     }

                     // //   * For each delete effect d of c move all tasks with precondition d before c
                     // //     and all tasks with an add effect behind it.
                     for (int del_idx = 0; del_idx < all_pre_eff[2][method].size(); del_idx++)
                     {
                            int x=0;       // what
                     }
                            
              }
       }
              return orderings;
}

              // search for cycles in the set of orderings
              // no cycles use this linearization,  OR random break
              void break_cycle(std::vector<int> orderings)
              {

                     // first priority to respect (*m).orderings

                     // second priority to respect:  output of find_orderings
              }

              void help(int i, int j, std::vector<int> **all_pre_eff)
              {
                     all_pre_eff[i][j].push_back(i);
                     all_pre_eff[i][j].push_back(j);
              }

              std::vector<int> **test(Model * m)
              {
                     // initialise pre[m], add[m],  del[m]<>
                     std::vector<int> **all_pre_eff = new std::vector<int> *[3];
                     for (int i = 0; i < 3; i++)
                     {
                            all_pre_eff[i] = new std::vector<int>[(*m).numMethods];
                            for (int j = 0; j < (*m).numMethods; j++)
                            {
                                   help(i, j, all_pre_eff);
                            }
                     }
                     return all_pre_eff;
              }

              int main(int argc, char *argv[])
              {
                     Model *m = setup_model("problemrover01out.sas"); //("test.sas");
                     // std::vector<int> ** results = test(m);
                     // for (int i=0; i<3; i++) {
                     //        for (int j=0; j<(*m).numMethods; j++) {
                     //               for (int k=0; k<results[i][j].size(); k++) {
                     //                      printf("%i ", results[i][j][k]);
                     //               }
                     //               printf("\n");
                     //        }
                     // }

                     std::vector<int> **all_pre_eff = get_methods_pre_eff(m);
                     printf("Sample of results for 1st method:  prec %lu adds %lu del %lu \n", all_pre_eff[0][0].size(), all_pre_eff[1][0].size(), all_pre_eff[2][0].size());
                     print(all_pre_eff[0][0]);
                     print(all_pre_eff[1][0]);
                     print(all_pre_eff[2][0]);

                     std::vector<int> **tpe = get_tasks_pre_eff(m, all_pre_eff);
                     int cmpd_task = 59;
                     printf("Sample of results for 1st COMPOUND task:  prec %lu adds %lu del %lu \n", tpe[0][cmpd_task].size(), tpe[1][cmpd_task].size(), tpe[2][cmpd_task].size());
                     print(tpe[0][cmpd_task]);
                     print(tpe[1][cmpd_task]);
                     print(tpe[2][cmpd_task]);

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

       // - Consider each method independently, no interaction is considered.
       // - For each compound task c infer its (super-relaxed) preconditions and effects.
       // - Construct a graph with possible dependencies:
       //   * For each add effect a of c move all tasks with precondition a behind c
       //     and all tasks with a delete effect in front of it.
       //   * Fir each delete effect d of c move all tasks with precondition d before c
       //     and all tasks with an add effect behind it.
       // - If this graph does not have a circle, choose this linearization.
       //   [It needs to be proved that (or whether) this sacrifices solutions!]
       // - If this graph does have a circle, choose a linearization at random
       //   [Pretty sure that this is incomplete! It should be checked how often that
       //    was the case in the IPC domains since they all admit a solution! Also
       //    investigate whether there are other circle-breaking strategies that are
       //    complete. Note though that even the circle-free systematic might be
       //    incomplete. If that's the case even, then clearly breaking cycles, no
       //    matter how, can't work either.]

       // int * method_tasks -> m.subTasks[i];
       //  printf(method_tasks)
       //  method_tasks
       //	int **precToAction;?
       //        addtoAction
       //        delToAction?
       //	searchNode *decompose(searchNode *n, int taskNo, int method);
       //	searchNode *apply(searchNode *n, int taskNo);
       //	bool isApplicable(searchNode *n, int action) const;
       //     bool isGoal(searchNode *n) const;

       //	void updateReachability(searchNode *n);
       //     void calcReachability(planStep *ps);

       // void Model::computeTransitiveClosureOfMethodOrderings(){
       // 	for (int i = 0; i < numMethods; i++){
       // 		computeTransitiveChangeOfMethodOrderings(true,i);
       // 	}
       // }
       // void Model::buildOrderingDatastructures(){
       //      for children in tree(Compound_Task):
       //          list.append(children.pre)
       //          list.append(children.eff)

       // 	maintainTaskReachability(maintainTaskReachability) {
       // 		numStateBits = 0;
       // 		numTasks = 0;
       // 		numPrecLessActions = 0;
       // 		numMethods = 0;
       // 		initialTask = -1;
       // 		gSize = 0;
       // 		isHtnModel = false;
       // 		numActions = 0;
       // 		numVars = 0;
       // 		s0Size = 0;
       // 		factStrs = nullptr;
       // 		firstIndex = nullptr;
       // 		lastIndex = nullptr;
       // 		varNames = nullptr;
       // 		actionCosts = nullptr;
       // 		precLists = nullptr;
       // 		addLists = nullptr;
       // 		delLists = nullptr;
       // 		precLessActions = nullptr;
       // 		precToActionSize = nullptr;
       // 		precToAction = nullptr;
       // 		addToActionSize = nullptr;
       // 		addToAction = nullptr;
       // 		delToActionSize = nullptr;
       // 		delToAction = nullptr;
       // 		numPrecs = nullptr;
       // 		numAdds = nullptr;
       // 		numDels = nullptr;
       // 		s0List = nullptr;
       // 		gList = nullptr;
       // 		isPrimitive = nullptr;
       // 		taskNames = nullptr;
       // 		emptyMethod = nullptr;
       // 		decomposedTask = nullptr;
       // 		numSubTasks = nullptr;
       // 		numFirstPrimSubTasks = nullptr;
       // 		numFirstAbstractSubTasks = nullptr;
       // 		numOrderings = nullptr;
       // 		methodIsTotallyOrdered = nullptr;
       // 		methodTotalOrder = nullptr;
       // 		methodNames = nullptr;
       // 		numFirstTasks = nullptr;
       // 		numLastTasks = nullptr;
       // 		taskToMethods = nullptr;
       // 		numMethodsForTask = nullptr;
       // 		subTasks = nullptr;
       // 		ordering = nullptr;
       // 		methodsFirstTasks = nullptr;
       // 		methodsLastTasks = nullptr;
       // 		methodSubtaskSuccNum = nullptr;
       // 		addVectors = nullptr;
       // 		delVectors = nullptr;
       // 		s0Vector = nullptr;

       // 		if (progressEffectLess) {
       // 			effectLess = new FlexIntStack();
       // 			effectLess->init(25);
       // 		}
       // #ifdef ONEMODMETH
       // 		oneMod = new FlexIntStack();
       // 		oneMod->init(25);
       // #endif

       // 		/*
       // #ifdef TRACKLMSFULL
       // newlyReachedFLMs = new noDelIntSet();
       // newlyReachedTLMs = new noDelIntSet();
       // newlyReachedMLMs = new noDelIntSet();
       // newlyReachedFLMs->init(tn);
       // newlyReachedTLMs = new noDelIntSet();
       // newlyReachedMLMs = new noDelIntSet();
       // #endif
       // */

       // 	}
