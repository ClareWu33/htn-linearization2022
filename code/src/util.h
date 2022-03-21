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
  

void print(std::vector<int> vec1);

void print(int *arr1, int arr1_size);

void print(std::set<int> s);

bool is_in(int m1, std::vector<int> *m_to_check);

std::vector<int> concatenate(std::vector<int> arr1, int *arr2, int arr2_size);

std::set<int> concatenate(std::set<int> set1, int *arr2, int arr2_size);
 