#include <iostream>
#include<cstdio>

int main() { 
    progression::eMaintainTaskReachability maintainTaskReachability = mtrNO;  // enum eMaintainTaskReachability {mtrNO, mtrACTIONS, mtrALL};
    progression::Model * m = new Model(true, maintainTaskReachability, true, true);
    m -> isHtnModel = true;

	std::ifstream fileStream;  
    fileStream.open("problemrover01out.sas"); 
        if (fileStream.is_open()) {
            printf("The problem file was opened successfully.");
    }  
    m -> read(&fileStream);

    while (true)
    {
        std::string haha;
        std::cin >> haha; 
        for (int i=0; i<(*m).numAdds[haha]; i++) {
            printf("%i", (*m).addLists[haha][i]);
        }
        printf("\n");
    }
      
    }