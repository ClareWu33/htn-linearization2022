#include<bits/stdc++.h>
using namespace std;

struct cycle {
    bool isCycle;
    vector<int> edges;
};


void print(vector<int> vec1);



class Graph
{
    int V;    // No. of vertices
    list<int> *adj;    // Pointer to an array containing adjacency lists
    bool isCyclicUtil(int v, bool visited[], bool *rs); // used by isCyclic()
    cycle findCyclicUtil(int v, bool visited[], bool *rs);  
 
public:
    Graph(int V);   // Constructor
    void addEdge(int v, int w);   // to add an edge to graph
    vector<int> get_orderings();
    bool isCyclic();    // returns true if there is a cycle in this graph
    cycle findCyclic();    // returns cycle  if there is a cycle in this graph
};
 