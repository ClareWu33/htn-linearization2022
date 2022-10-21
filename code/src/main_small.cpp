//============================================================================
// Name        : Main.cpp
// Author      : Ying Xian Wu
// Version     :
// Copyright   :
// Description : Naive algorithm for linearising a domain given problem in .sas file
//============================================================================


// pandaPI code for storing an HTN planning model
#include "../../pandaPIengine/src/Model.h"
// #include "../../pandaPIengine/src/intDataStructures/IntPairHeap.h"
// #include "../../pandaPIengine/src/ProgressionNetwork.h"
// #include "../../pandaPIengine/src/flags.h"
// #include "../../pandaPIengine/src/intDataStructures/noDelIntSet.h"
// #include "../../pandaPIengine/src/intDataStructures/FlexIntStack.h"
// #include "../../pandaPIengine/src/intDataStructures/IntUtil.h"
// #include "../../pandaPIengine/src/intDataStructures/StringUtil.h"

// using namespace std;

progression::Model *setup_model(string fileName)
{
       bool trackTasksInTN = false;
       progression::eMaintainTaskReachability maintainTaskReachability = mtrNO; // enum eMaintainTaskReachability {mtrNO, mtrACTIONS, mtrALL};
       bool progressEffectLess = false;
       bool progressOneModActions = false;
       progression::Model *m = new Model(trackTasksInTN, maintainTaskReachability, progressEffectLess, progressOneModActions);
       m->isHtnModel = true;

       std::ifstream fileStream;
       fileStream.open(fileName);
       if (fileStream.is_open())
       {
              printf("The problem file %s was opened successfully.", fileName.c_str());
              m->read(&fileStream);
       }
       else
       {
              printf("Could not open the specified file, %s", fileName.c_str());
       }

       return m;
}

