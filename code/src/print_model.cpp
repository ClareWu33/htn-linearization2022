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

void print_methods(Model *m)
{
       // for each method, what subtasks it decomposes to, and what orderings it has
       printf("For each method, it's subtasks and orderings\n");
       for (int i = 0; i < (*m).numMethods; i++)
       {
              printf("Method %i applies to task %i \n Subtasks ", i, m->decomposedTask[i]);
              for (int j = 0; j < (*m).numSubTasks[i]; j++)
              {
                     printf("%i ", (*m).subTasks[i][j]);
              }
              printf("\n orderings ");
              for (int j = 0; j < (*m).numOrderings[i]; j++)
              {
                     printf("%i ", (*m).ordering[i][j]);
              }
              printf("\n\n");
       }

       // Note that primitive tasks come first, in the same order indexing as actions.
       // for each task, primitive and compund, what methods apply to it
       printf("For each compound task, what method applies to it\n");
       for (int i = 0; i < (*m).numTasks; i++)
       {
              if ((*m).isPrimitive[i])
              {
                     printf("Task %i, is primitive\n", i);
              }
              else
              {
                     printf("Task %i, is compound\n", i);
              }

              for (int j = 0; j < (*m).numMethodsForTask[i]; j++)
              {
                     printf("method %i applies ", m->taskToMethods[i][j]);
              }
              printf("\n\n");
       }
}

void print_actions(Model *m)
{
       // for each action, list it's action preconditions, adds, deletes
       printf("Preconditions, adds, deletes\n");
       for (int i = 0; i < (*m).numActions; i++)
       {
              for (int j = 0; j < (*m).numPrecs[i]; j++)
              {
                     printf("%i ", (*m).precLists[i][j]);
              }
              printf("\n");
              for (int j = 0; j < (*m).numAdds[i]; j++)
              {
                     printf("%i ", (*m).addLists[i][j]);
              }
              printf("\n");
              for (int j = 0; j < (*m).numDels[i]; j++)
              {
                     printf("%i ", (*m).delLists[i][j]);
              }
              printf("\n\n");
       }

       // for each action, list all actions conditional adds, deletes
    //    printf("Conditional adds, deletes\n");
    //    for (int i = 0; i < (*m).numActions; i++)
    //    {
    //           for (int j = 0; j < (*m).numConditionalAdds[i]; j++)
    //           {
    //                  printf("ACCESS TO ANY ELEMENT OF numConditionalAdds?");
    //                  printf("%i ", (*m).conditionalAddLists[i][j]);
    //                  for (int k = 0; k < (*m).numConditionalAddsConditions[i][j]; k++)
    //                  {
    //                         printf("%i ", (*m).conditionalAddListsCondition[i][j][k]);
    //                  }
    //           }
    //           printf("\n");
    //           for (int j = 0; j < (*m).numConditionalDels[i]; j++)
    //           {
    //                  printf("%i ", (*m).conditionalDelLists[i][j]);
    //                  for (int k = 0; k < (*m).numConditionalDelsConditions[i][j]; k++)
    //                  {
    //                         printf("%i ", (*m).conditionalDelListsCondition[i][j][k]);
    //                  }

    //           } // ??? is this how you access it?
    //           printf("\n\n");
    //    }
}

void print_info(Model *m)
{
       print_methods(m);
       print_actions(m);
}

void interactive_model(Model *m)
{
       while (task >= 0) 
       {
              printf("The actions prec, add, del ");
              int task;
              std::cin >> task;
              printf("prec: ");
              for (int i = 0; i < (*m).numPrecs[task]; i++)
              {
                     printf("%i ", (*m).precLists[task][i]);
              }
              printf("\n add:  ");
              for (int i = 0; i < (*m).numAdds[task]; i++)
              {
                     printf("%i ", (*m).addLists[task][i]);
              }
              printf("\n del:  ");
              for (int i = 0; i < (*m).numDels[task]; i++)
              {
                     printf("%i ", (*m).delLists[task][i]);
              }
              printf("\n");
       }
}

void to_file(string fileName, std::vector<int> **results, Model *m)
{
       ofstream myfile(fileName);
       if (myfile.is_open())
       {
              for (int j = 0; j < (*m).numMethods; j++)
              {
                     for (int i = 0; i < 3; i++)
                     {
                            for (int count = 0; count < results[i][j].size(); count++)
                            {
                                   myfile << results[i][j][count] << " ";
                            }
                            myfile << "\n";
                     }
                     myfile << "\n\n";
              }
              myfile.close();
       }
       else
              cout << "Unable to open file";
}

 

int main(int argc, char *argv[])
{
    Model *m = setup_model("problemrover01out.sas"); //("test.sas");
              
    // print_methods(m);
    //print_actions(m);
    print((*m).subTasks[2], (*m).numSubTasks[2]);
    interactive_model(m);
    return 0;
}