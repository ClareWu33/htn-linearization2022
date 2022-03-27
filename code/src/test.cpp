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
#include "main.h"

// pandPI code for storing an HTN planning model
#include "../pandaPIengine/src/Model.h"
#include "../pandaPIengine/src/intDataStructures/IntPairHeap.h"
#include "../pandaPIengine/src/ProgressionNetwork.h"
#include "../pandaPIengine/src/flags.h"
#include "../pandaPIengine/src/intDataStructures/noDelIntSet.h"
#include "../pandaPIengine/src/intDataStructures/FlexIntStack.h"
#include "../pandaPIengine/src/intDataStructures/IntUtil.h"
#include "../pandaPIengine/src/intDataStructures/StringUtil.h"

int main(int argc, char *argv[])
{
    Model *m = setup_model("problemrover01out.sas"); //("test01out.sas"); //
    std::set<int> **all_pre_eff = get_methods_pre_eff(m);

    int method = 2;
    printf("Sample of results for method idx=%i:  prec %lu adds %lu del %lu \n", method, all_pre_eff[0][method].size(), all_pre_eff[1][method].size(), all_pre_eff[2][method].size());
    if !(all_pre_eff[0][method]) == new std::set{18})
            printf("failed");
    
    printf("add: ");
    print(all_pre_eff[1][method]); // 16 6 19
    printf("del: ");
    print(all_pre_eff[2][method]); // 9 5 18

    method = 3;
    printf("Sample of results for method idx=%i:  prec %lu adds %lu del %lu \n", method, all_pre_eff[0][method].size(), all_pre_eff[1][method].size(), all_pre_eff[2][method].size());
    printf("pre: ");
    print(all_pre_eff[0][method]); // 2
    printf("add: ");
    print(all_pre_eff[1][method]); // 16 14 10
    printf("del: ");
    print(all_pre_eff[2][method]); // 10 5 2

    method = 4;
    printf("Sample of results for method idx=%i:  prec %lu adds %lu del %lu \n", method, all_pre_eff[0][method].size(), all_pre_eff[1][method].size(), all_pre_eff[2][method].size());
    printf("pre: ");
    print(all_pre_eff[0][method]); // 16
    printf("add: ");
    print(all_pre_eff[1][method]); // 
    printf("del: ");
    print(all_pre_eff[2][method]); //

    method = 5;
    printf("Sample of results for method idx=%i:  prec %lu adds %lu del %lu \n", method, all_pre_eff[0][method].size(), all_pre_eff[1][method].size(), all_pre_eff[2][method].size());
    printf("pre: ");
    print(all_pre_eff[0][method]); // 5  18
    printf("add: "); 
    print(all_pre_eff[1][method]); //  16 6
    printf("del: ");
    print(all_pre_eff[2][method]); //  5 18

    method = 6;
    printf("Sample of results for method idx=%i:  prec %lu adds %lu del %lu \n", method, all_pre_eff[0][method].size(), all_pre_eff[1][method].size(), all_pre_eff[2][method].size());
    printf("pre: ");
    print(all_pre_eff[0][method]); //  5 2
    printf("add: "); 
    print(all_pre_eff[1][method]); //  16 14
    printf("del: ");
    print(all_pre_eff[2][method]); //  5 2

    method = 7;
    printf("Sample of results for method idx=%i:  prec %lu adds %lu del %lu \n", method, all_pre_eff[0][method].size(), all_pre_eff[1][method].size(), all_pre_eff[2][method].size());
    printf("pre: ");                                      // from compund sub-tasks
    print(all_pre_eff[0][method]);  // 10 5 2             16  15
    printf("add: ");
    print(all_pre_eff[1][method]);  // 16 14 10   +       2 5   4
    printf("del: ");
    print(all_pre_eff[2][method]); // 5 2                 14 16   15

    method = 8;
    printf("Sample of results for (task 53) method idx=%i:  prec %lu adds %lu del %lu \n", method, all_pre_eff[0][method].size(), all_pre_eff[1][method].size(), all_pre_eff[2][method].size());
    printf("pre: ");                                     
    print(all_pre_eff[0][method]);  // 16
    printf("add: ");
    print(all_pre_eff[1][method]);  // 2 5 
    printf("del: ");
    print(all_pre_eff[2][method]); // 14 16 

    method = 9;
    printf("Sample of results for (task 53) method idx=%i:  prec %lu adds %lu del %lu \n", method, all_pre_eff[0][method].size(), all_pre_eff[1][method].size(), all_pre_eff[2][method].size());
    printf("pre: ");                                      
    print(all_pre_eff[0][method]);  // 15
    printf("add: ");
    print(all_pre_eff[1][method]);  // 2   4
    printf("del: ");
    print(all_pre_eff[2][method]); // 14 15

    method = 10;
    printf("Sample of results for method idx=%i:  prec %lu adds %lu del %lu \n", method, all_pre_eff[0][method].size(), all_pre_eff[1][method].size(), all_pre_eff[2][method].size());
    printf("pre: ");                                      
    print(all_pre_eff[0][method]);  // 9 5 16 18
    printf("add: ");
    print(all_pre_eff[1][method]);  // 18 5 16  6 9
    printf("del: ");
    print(all_pre_eff[2][method]); // 6 16 9 5 18


    std::set<int> **tpe = get_tasks_pre_eff(m, all_pre_eff);
    int cmpd_task = (*m).decomposedTask[method];
    printf("Sample of results for corresponding COMPOUND task %i:  prec %lu adds %lu del %lu \n", (*m).decomposedTask[method], tpe[0][cmpd_task].size(), tpe[1][cmpd_task].size(), tpe[2][cmpd_task].size());
    print(tpe[0][cmpd_task]); // sum of all for task 52   -> 18 2 16 5 9        16   15
    print(tpe[1][cmpd_task]); //                         5 6 9 10 14 16 18      2 5   4
    print(tpe[2][cmpd_task]); //                         2 5 6 9 10 16 18       14 16   15
}
// Got
// 2 5 9 10 15 16 18 
// 2 4 5 6 9 10 14 16 18 
// 2 5 6 9 10 14 15 16 18


    //    bool trackTasksInTN = false;
    //    progression::eMaintainTaskReachability maintainTaskReachability = mtrNO; // enum eMaintainTaskReachability {mtrNO, mtrACTIONS, mtrALL};
    //    bool progressEffectLess = true;
    //    bool progressOneModActions = true;
    //    progression::Model *m = new Model(true, maintainTaskReachability, true, true);
    //    m->isHtnModel = true;

    //    (*m).numStateBits = 4;
    //    (*m).numActions = 3;
    //    printf(" This assign is legal: %i \n", (*m).numActions);
    //    // per action
    //    (*m).precLists = new int *[3];
    //    (*m).precLists[0] = new int[1]{0};
    //    (*m).precLists[1] = new int[1]{1};
    //    (*m).precLists[2] = new int[1]{2};

    //    (*m).addLists = new int *[3];
    //    (*m).addLists[0] = new int[1]{0};
    //    (*m).addLists[1] = new int[1]{1};
    //    (*m).addLists[2] = new int[1]{2}; // 3 2 1

    //    (*m).delLists = new int *[3];
    //    (*m).delLists[0] = new int[1]{0};
    //    (*m).delLists[1] = new int[1]{1};
    //    (*m).delLists[2] = new int[1]{2}; // 1 2 3??

    //    printf("%i", (*m).delLists[0][0]);

    //    (*m).numPrecs = new int[3]{1, 1, 1};
    //    (*m).numAdds = new int[3]{1, 1, 1};
    //    (*m).numDels = new int[3]{1, 1, 1};

    //    // per task
    //    (*m).numTasks = 5;
    //    (*m).isPrimitive = new bool[5]{false, false, false, true, true};
    //    (*m).taskNames = new string[5]{"A", "B", "C", "AB", "ABC"};

    //    // method definitions
    //    (*m).numMethods = 2;
    //    (*m).decomposedTask = new int[2]{3, 4}; // the task that is decomposed by method i

    //    (*m).subTasks = new int *[2];
    //    (*m).subTasks[0] = new int[2]{0, 1};
    //    (*m).subTasks[1] = new int[2]{3, 2}; // dedompose ABC -> AB  C
    //    (*m).numSubTasks = new int[2]{2, 2};

    //    // int **ordering; // this is a list of ints (p1,s2, p2,s2, ...) means that p1 is before s2, p2 before s2, ...
    //    // int *numOrderings; // this is the length of the ARRAY, not the number of ordering constraints
    //    (*m).taskToMethods = new int *[5];
    //    (*m).taskToMethods[0];                 // = {};
    //    (*m).taskToMethods[1];                 // = {};
    //    (*m).taskToMethods[2];                 // = {};
    //    (*m).taskToMethods[3] = new int[1]{0}; // deompose AB
    //    (*m).taskToMethods[4] = new int[1]{1};
    //    printf("%i %i", (*m).numSubTasks[0], (*m).numSubTasks[1]);

