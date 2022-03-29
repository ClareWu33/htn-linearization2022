#include<bits/stdc++.h>

using namespace std;


class edge
{
public:
       int start;
       int end;
       edge(int s, int e);

       bool operator<(const edge &rhs) const;
       bool operator==(const edge &rhs) const;
       bool operator>(const edge &rhs) const;
       void print();
};
 
void print(std::set<edge> s);
void print(std::vector<edge> s);

struct cycle {
    bool isCycle;
    std::set<edge> * edges;
};


class priority_node {
public:
    int value;
    int priority;
    priority_node(int v, int p);
    bool operator==(const priority_node &rhs) const;
};


class Graph
{
    bool isCyclicUtil(int v, bool visited[], bool *rs); // used by isCyclic()
    cycle findCyclicUtil(int v, bool visited[], bool *rs);  
     // A function used by topologicalSort
    void topologicalSortUtil(int v, bool visited[],
                             stack<int>& Stack);

public:
    int V;    // No. of vertices
    int p_levels;  // No of priority levels
    list<priority_node> *adj;  // Pointer to an array containing adjacency lists
    
    Graph(int V);   // Constructor
    Graph(int V, int p_lev);
    void addEdge(int v, int w);
    void addEdge(int v, int w, int p);  // to add an edge to graph from v to w,  with priority
    std::set<edge> * get_orderings_with_priority();
    std::set<edge>  get_orderings();
    bool isCyclic();    // returns true if there is a cycle in this graph        
    std::vector<cycle> findCyclic();  // returns cycle  if there is a cycle in this graph

     
    // a Topological Sort of
    // the complete graph
    stack<int> topologicalSort();
};
 