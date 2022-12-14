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
#include <numeric>
#include "util.h"



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

void print(bool *arr1, int arr1_size) {
       for (int i = 0; i < arr1_size; i++)
       {
              printf("%i ", arr1[i]);
       }
       printf("\n");
}

void print(std::set<int> s)
{
       for (auto elem : s)
       {
              printf("%i ", elem);
       }
       printf("\n");
}

// void print(std::unordered_set<int> s)
// {
//        for (auto elem : s)
//        {
//               printf("%i ", elem);
//        }
//        printf("\n");
// }


bool is_in(int m1, std::vector<int> m_to_check)
{
       for (int i = 0; i < m_to_check.size(); i++)
       {
              if (m1 == m_to_check[i])
              {
                     return true;
              }
       }
       return false;
}

bool is_in(int m1, std::set<int> m_to_check)
{
       return (m_to_check.find(m1) != m_to_check.end());
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

std::set<int> concatenate(std::set<int> set1, int *arr2, int arr2_size)
{
       for (int i = 0; i < arr2_size; i++)
       {
              int elem = arr2[i];
              set1.insert(elem);
       }
       return set1;
}

// n = length of the array
bool all_true(bool * arr, std::vector<int> idxs_to_check) 
{
       for (int i : idxs_to_check) 
       {
              if (arr[i] == false) 
              {
                     return false;
              }
       }
       return true;
}

bool all_true(bool * arr, int size) 
{
       for (int i=0; i<size; i++) 
       {
              if (arr[i] == false) 
              {
                     return false;
              }
       }
       return true;
       // sum = 0;  
       // sum = accumulate(arr, arr+n, sum);
       // return (sum >= n);  // since false=0?
}