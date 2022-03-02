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


void get_compound_pre_eff() {        
       bool trackTasksInTN = true; //?
       eMaintainTaskReachability maintainTaskReachability = mtrNO;  // enum eMaintainTaskReachability {mtrNO, mtrACTIONS, mtrALL};
	bool progressEffectLess = true;
	bool progressOneModActions = true;
       progression::Model * m = new Model(false, maintainTaskReachability, true, true);

       std::ifstream fileStream; // = "I am allocating this much space, ok?"; // "problemrover01out.sas"
       printf("A FUCKING SEGFAULT?");
       fileStream.open("problemrover01out.sas"); 
       printf("... work ... please ...");
       std::ifstream  * fileStreampointer = &fileStream;
       if ((*fileStreampointer).is_open()) {
              printf("The problem file was opened succesfully.");
       }  
       
       m -> read(&fileStream);
}


int main(int argc, char *argv[]) {
       get_compound_pre_eff();
       printf("Oh so YOU don't segfault\n");
	return 0;
}
