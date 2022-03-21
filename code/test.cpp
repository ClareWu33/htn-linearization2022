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
#include "pandaPIengine/src/Model.h"
#include "pandaPIengine/src/intDataStructures/IntPairHeap.h"
#include "pandaPIengine/src/ProgressionNetwork.h"
#include "pandaPIengine/src/flags.h"
#include "pandaPIengine/src/intDataStructures/noDelIntSet.h"
#include "pandaPIengine/src/intDataStructures/FlexIntStack.h"
#include "pandaPIengine/src/intDataStructures/IntUtil.h"
#include "pandaPIengine/src/intDataStructures/StringUtil.h" 

using namespace std;  


// void get_compound_pre_eff() {        
//        bool trackTasksInTN = true; //?
//        eMaintainTaskReachability maintainTaskReachability = mtrNO;  // enum eMaintainTaskReachability {mtrNO, mtrACTIONS, mtrALL};
// 	bool progressEffectLess = true;
// 	bool progressOneModActions = true;
//        progression::Model * m = new Model(false, maintainTaskReachability, true, true);

//        std::ifstream fileStream; // = "I am allocating this much space, ok?"; // "problemrover01out.sas"
 
//        fileStream.open("problemrover01out.sas"); 
 
//        std::ifstream  * fileStreampointer = &fileStream;
//        if ((*fileStreampointer).is_open()) {
//               printf("The problem file was opened succesfully.");
//        }  
       
//        m -> read(&fileStream);
// }


int main(int argc, char *argv[]) {
       // get_compound_pre_eff(); 
       std::vector<int> vec = {1,2};
       int array[3] = {3,4,5};
       int * arr;
       arr = array;
       vec.insert(vec.end(), &arr[0], &arr[3]); //    dataVec.insert(dataVec.end(), &dataArray[0], &dataArray[dataArraySize]);
       printf("%i %i %i %i %i \n", vec[0], vec[1], vec[2], vec[3], vec[4]);


       std::vector<int> another_vec = {1,2};
       vec.insert(vec.end(), another_vec.begin(), another_vec.end());
       printf("%i %i %i %i %i \n", vec[5], vec[6]);


       return 0;
}

// void break_cycle(Model * m, std::vector<int> * orderings)
// {

//        for (int method=0; method<(*m).numMethod; method++) { 
//               Graph g = new Graph((*m).numSubTasks[method]); // num of vertices = subtasks

//               //  first priority to respect: (*m).orderings
//               for (int i=0; i<(*m).numOrderings[method]-1; i=i+2) 
//               {
//                      int o1 = (*m).ordering[method][i];
//                      int o2 = (*m).ordering[method][i+1];
//                      g.addEdge(o1, o2);
//               }

//               //   second priority to respect: output of find_orderings
//               for (int i=0; i<orderings[method].size()-1; i=i+2) 
//               {
//                      int o1 = (*m).ordering[method][i];
//                      int o2 = (*m).ordering[method][i+1];
//                      g.addEdge(o1, o2);
//               }
//        }
// }

