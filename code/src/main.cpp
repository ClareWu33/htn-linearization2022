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
 

// find a better compund task pre + eff ?
// def get_Connie_compound_pre_eff(Node Compound_Task) {}
 
// find the cmpd task pre+eff by just aggregrating all of them together
progression::Model * setup_model(string fileName) { 
       bool trackTasksInTN = false;  
       progression::eMaintainTaskReachability maintainTaskReachability = mtrNO;  // enum eMaintainTaskReachability {mtrNO, mtrACTIONS, mtrALL};
	bool progressEffectLess = true;
	bool progressOneModActions = true; 
       progression::Model * m = new Model(true, maintainTaskReachability, true, true);
       m -> isHtnModel = true;

	std::ifstream fileStream;  
       fileStream.open(fileName); 
       if (fileStream.is_open()) {
              printf("The problem file was opened successfully.");
       }  

       m -> read(&fileStream);
       return m;
}


void print_methods(Model * m) {
       // for each method, what subtasks it decomposes to, and what orderings it has
       printf("Tasks and Orderings\n");
       for (int i=0; i < (*m).numMethods; i++) {    
              printf("Method %i \n Subtasks", m -> decomposedTask[i]);        
              for (int j=0; j < (*m).numSubTasks[i]; j++) { 
                     printf("%i ", (*m).subTasks[i][j]);                           
              }
              printf("\n"); 
              for (int j=0; j<(*m).numOrderings[i]; j++) {
                     printf("%i ", (*m).ordering[i][j]);
              }
              printf("\n\n"); 
       }

       // for each task, what methods apply to it
       printf("For each Task, what method applies to it\n");
       for (int i=0; i<(*m).numTasks; i++) {    
              printf("Task %i \n", i);
              for (int j=0; j < (*m).numMethodsForTask[i]; j++) {          
                      printf("method %i applies", m->taskToMethods[i][j]);    
              }
              printf("\n\n");
       }

}

void print_actions(Model * m) {      
       // for each action, list it's action preconditions, adds, deletes
       printf("Preconditions, adds, deletes\n");
       for (int i=0; i<(*m).numActions; i++) {
              for (int j=0; j<(*m).numPrecs[i]; j++) {
                     printf("%i ", (*m).precLists[i][j]);
              }
              printf("\n");
              for (int j=0; j<(*m).numAdds[i]; j++) {
                     printf("%i ", (*m).addLists[i][j]);
              }
              printf("\n");
                     for (int j=0; j<(*m).numDels[i]; j++) {
                     printf("%i ", (*m).delLists[i][j]);
              }
              printf("\n\n");
       } 


       // for each action, list all actions conditional adds, deletes
       printf("Conditional adds, deletes\n");
       for (int i=0; i<(*m).numActions; i++) {
              for (int j=0; j<(*m).numConditionalAdds[i]; j++) {
                     printf("ACCESS TO ANY ELEMENT OF numConditionalAdds?");
                     printf("%i ", (*m).conditionalAddLists[i][j]);
                     for (int k=0; k<(*m).numConditionalAddsConditions[i][j]; k++) {
                            printf("%i ", (*m).conditionalAddListsCondition[i][j][k]);
                     }
              }
              printf("\n");
                     for (int j=0; j<(*m).numConditionalDels[i]; j++) {
                     printf("%i ", (*m).conditionalDelLists[i][j]);
                     for (int k=0; k<(*m).numConditionalDelsConditions[i][j]; k++) {
                            printf("%i ", (*m).conditionalDelListsCondition[i][j][k]);
                     }

              }  // ??? is this how you access it?
              printf("\n\n");
       } 
}


void interactive_model(Model * m) {
    while (true)
    {
       int haha;
       std::cin >> haha; 
       printf("prec: ");
       for (int i=0; i<(*m).numPrecs[haha]; i++) {
            printf("%i ", (*m).precLists[haha][i]);
        }
        printf("\n add:  ");
        for (int i=0; i<(*m).numAdds[haha]; i++) {
            printf("%i ", (*m).addLists[haha][i]);
        }
        printf("\n del:  ");
        for (int i=0; i<(*m).numDels[haha]; i++) {
            printf("%i ", (*m).delLists[haha][i]);
        }
        printf("\n");
    }      
}

void to_file(fileName, std::vector<int> ** results, Model * m) {
       ofstream myfile (fileName);
       if (myfile.is_open()) 
       {
              for (int j=0; j<(*m).numMethods; j++) {
                     for (int i=0; i<3; i++) {
                            for(int count = 0; count < results[i][j].size(); count ++){
                                   myfile << results[i][j][count] << " " ;
                            } 
                            myfile << "\n";
                     }
                     myfile << "\n\n";
              }
              myfile.close(); 
       }
  else cout << "Unable to open file";
}


void print_info(Model * m) {
       print_methods(m);
       print_actions(m);
}


// search methods collect all actions possible from the abstract tasks
       // for m in methods  
              //   m -> tn
              //   for t in tn:
              //         t -m'-> tn'
              //      OR t -> action
// result = []
// for (name, tn) in methods:
//     for task in tn:
//         if is_primitive(task):
//         	return result + [(task.prec, task.eff)]
//         else:
//     		methods' = methods_for_task[task]
//     		for (name' tn') in methods:
//     			for task' in tn':

// Assumptions: That actions and primitive tasks are ordered in the same way. i.e. action k correpends to primitive task k
std::vector<int> ** recursive_find_pre_eff(int num_methods, int * method_ids_to_check, Model *m, std::vector<int> **results) { 
       for (int n=0; n<num_methods; n++) {    
              int method = method_ids_to_check[n];
              // subTasks[i][j]  // this is one of the TASK it decomposes to
              for (int j=0; j<(*m).numSubTasks[method]; j++) {
                     // t' -> action  (identify the action that the primitive task maps to. Get its pre+eff)
                     if ((*m).isPrimitive[ (*m).subTasks[method][j] ]) {
			       int action = (*m).subTasks[method][j]; 
                            // for this task, add all preconditions 
                            for (int k=0; k<(*m).numPrecs[action]; k++) {
                                  // printf("Method %i preconditions, adding %i for action %i\n", method, (*m).precLists[action][k], action);
                                  results[0][method].push_back((*m).precLists[action][k]);
                            }
                            for (int k=0; k<(*m).numAdds[action]; k++) {
	                            results[1][method].push_back((*m).addLists[action][k]);
                            }
                            for (int k=0; k<(*m).numDels[action]; k++) {
                                   results[2][method].push_back((*m).delLists[action][k]);   
                            } 
                            // for this task, add all conditional ads and preconditions, withou considering if precondition is met (since we can't consider it!)    

                     // t' -> tn' (identify more methods that apply to this task.  Expand it to a task netework)
                     } else {
                            int cmpd_task = (*m).subTasks[method][j]; 
                            // for all the methods that could apply to this task (tasktoMethods), repeat this process
                            results = recursive_find_pre_eff((*m).numMethodsForTask[cmpd_task], (*m).taskToMethods[cmpd_task], m, results);                            
                     }
              }
       }
       return results;
} 


std::vector<int> ** get_compound_pre_eff(Model * m) {
       // methods (pre, add, del), task it applies to, 
       std::vector<int>** results;
       results = new std::vector<int>*[3]; // pre add del  ( [task]? )
       for (int i=0; i<3; i++) {
        	results[i] = new std::vector<int>[(*m).numMethods]; //
       }
       // results[3].push_back(task);
	
       // methods to investigate
       int methods [(*m).numMethods];
       for (int i=0; i<(*m).numMethods; i++) {
              methods[i] = i;
       }       

       results = recursive_find_pre_eff((*m).numMethods, methods, m, results); // i.e. investigate all of them
       return results;
}
       


// abstract tasks => set of all preconditions, effects
// every abstract task SHOULD have a method applicable in a well-formed domain
// e.g. 15 abstract tasks in rover01 has methods
std::set<int> ** assign_pre_eff(std::vector<int> ** results, Model * m) {
       // pre, add, del 
       std::set<int>** tasksPreEff;
       tasksPreEff = new std::set<int>*[3]; // pre add del
       for (int i=0; i<3; i++) {
        	tasksPreEff[i] = new std::set<int>[(*m).numMethods]; //
       }
	
       // methods to investigate
       int methods [(*m).numTasks];
       for (int i=0; i<(*m).numTasks; i++) {
              if (!(*m).isPrimitive[i]) {
                     task[i] = i;
              }   
       }

       // for each task, what methods apply to it
       printf("For each Task, what method applies to it\n");
       for (int i=0; i<(*m).numTasks; i++) {    
              printf("Task %i \n", i);
              for (int j=0; j < (*m).numMethodsForTask[i]; j++) {          
                      printf("method %i applies", m->taskToMethods[i][j]);    
              }
              printf("\n\n");

              tasksPreEff[0][i] = results[0][i];
              tasksPreEff[1][i] = results[1][i];
              tasksPreEff[2][i] = results[2][i];
       }
 
       return tasksPreEff;
}
       
//  //  iterate through every method and its "preconditions and effects"
//   //   * For each add effect a of c move all tasks with precondition a behind c
//   //     and all tasks with a delete effect in front of it.  
//   //   * Fir each delete effect d of c move all tasks with precondition d before c
//   //     and all tasks with an add effect behind it.
// // orderings = { (pre, aft), }  <- accumulate order pairs
// void order_more(std::vector<std::vector<int>> orderings) {
//        orderings  = (*m).orderings;
//        orderings+;
//        return orderings;
// }

// // search for cycles in the set of orderings
// void find_cycle(orderings) {

// }

// no cycles use this linearization,  OR random break

  
int main(int argc, char *argv[])
{
       Model * m = setup_model("problemrover01out.sas");
       std::vector<int> **results; //[3][(*m).numMethods];
       results = get_compound_pre_eff(m);

       std::set<int> **results;
       results_2 = assign_pre_eff(results, m);
       printf("Sample of results for 1st method:  prec %lu  adds %lu  del %lu \n", results[0][0].size(), results[1][0].size(), results[2][0].size());

       for (int i=0; i<results[0][0].size(); i++) {
              printf("%i ", results[0][0][i]); 
       }; printf("\n");
       for (int i=0; i<results[1][0].size(); i++) {
              printf("%i ", results[1][0][i]); 
       }; printf("\n");
       for (int i=0; i<results[2][0].size(); i++) {
              printf("%i ", results[2][0][i]); 
       }; printf("\n");


       // print_actions(m);
       interactive_model(m);

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




              //int * method_tasks -> m.subTasks[i];
              // printf(method_tasks)
              // method_tasks
              		//	int **precToAction;?
                            //       addtoAction
                            //       delToAction?
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
//void Model::buildOrderingDatastructures(){
//     for children in tree(Compound_Task):
//         list.append(children.pre)
//         list.append(children.eff)


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

