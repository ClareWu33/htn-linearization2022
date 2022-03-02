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

// e.g. decomposedTask[i] = 64;  // the task that is decomposed by method i
//      int **subTasks[i] = 52 49; 
// void find_all(int task, Model * m) {
//        m -> numMethodsForTask
//        int * result[m -> numMethodsForTask[task]] = []
//        for (int i=0; i<(*m).numMethods; i++) {
//              if (m -> decomposedTask[i] == task) {

//              }

//        }
// }

// find the cmpd task pre+eff by just aggregrating all of them together
Model * setup_model { 
       bool trackTasksInTN = true; //?
       progression::eMaintainTaskReachability maintainTaskReachability = mtrNO;  // enum eMaintainTaskReachability {mtrNO, mtrACTIONS, mtrALL};
	bool progressEffectLess = true;
	bool progressOneModActions = true; 
       progression::Model * m = new Model(true, maintainTaskReachability, true, true);
       m -> isHtnModel = true;

	std::ifstream fileStream;  
       fileStream.open("problemrover01out.sas"); 
       if (fileStream.is_open()) {
              printf("The problem file was opened successfully.");
       }  

       m -> read(&fileStream);
       return m;
}

get_compound_pre_eff(Model * m) {
       std::vector<std::vector<int>> pre;  // pre.reserve((*m).numMethods);?  [? number of preconditions per method]
       std::vector<std::vector<int>> add;  // add.reserve((*m).numMethods);?  [? number of adds per method]
       std::vector<std::vector<int>> del;  // del.reserve((*m).numMethods);?  [? number of deletes per method]
       recursive_find_pre_eff(*m).numMethods, (*m).numMethods, Model * m) // i.e. investigate all of them
}

// search methods collect all actions possible from the abstract tasks
       // for m in methods  
              //   m -> tn
              //   for t in tn:
              //         t -m'-> tn'
              //      OR t -> action
       //n
def recursive_find_pre_eff(num_methods, method_ids_to_check, Model * m) {
       // std::vector<std::vector<int>> pre;  // pre.reserve((*m).numMethods);?  [? number of preconditions per method]
       // std::vector<std::vector<int>> add;  // add.reserve((*m).numMethods);?  [? number of adds per method]
       // std::vector<std::vector<int>> del;  // del.reserve((*m).numMethods);?  [? number of deletes per method]
       for (int i=0; i < (*m).numMethods; i++) {    
              // (n -> tn)
              for (int j=0; j<(*m).numSubTasks[i]; j++) {
                     // subTasks[i][j]  // this is one of the TASK it decomposes to
                     // t' -> action  (identify the action that the primitive task maps to. Get its pre+eff)
                     if ((*m).isPrimitive[ subTasks[i][j] ]) {
			       action = subTasks[i][j] 
                            pre[i].add(precLists[action]);
			       add[i].add(addLists[action]); // list od add effects for this action
			       del[i].add(delLists[action]);     
                            return pre, add, del                
                     // t' -> tn' (identify more methods that apply to this task.  Expand it to a task netework)
                     } else {
                            for m in ((*m).tasktoMethods[subTasks[i][j]]) {}  // all the methods that could apply to this task
                            // repeat this process for tasktoMethods
                     }
              }
       }

       // for each method, what subtasks it decomposes to, and what orderings it has
       for (int i=0; i < (*m).numMethods; i++) {    
              printf("Method %i \n Subtasks", m -> decomposedTask[i]);        
              for (int j=0; j < (*m).numSubTasks[i]; j++) { 
                     printf("%i ", (*m).subTasks[i][j]);                           
              }
              printf("\n"); 
              for (int j=0; j<(*m).numOrderings; j++) {
                     printf("%i ", m -> ordering[i][j]);
              }
              printf("\n\n"); 
       }
       
       // for each task, what methods apply to it
       for (int i=0; i<(*m).numTasks; i++) {    
              printf('Task %i \n', i);
              for (int j=0; j < (*m).numMethodsForTask[i]; j++) {          
                      printf("method %i applies", m->taskToMethods[i][j]);    
              }
              printf("\n\n");
       }

       // abstract tasks = set of all preconditions, effects
       
       //  iterate through every method and its "preconditions and effects"

  //   * For each add effect a of c move all tasks with precondition a behind c
  //     and all tasks with a delete effect in front of it.  
  //   * Fir each delete effect d of c move all tasks with precondition d before c
  //     and all tasks with an add effect behind it.
// orderings = { (pre, aft), }  <- accumulate order pairs

// search for cycles in the set of orderings

// no cycles use this linearization,  OR random break
} 
       



  

int main(int argc, char *argv[])
{
       get_compound_pre_eff();
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

