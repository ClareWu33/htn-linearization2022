#include<bits/stdc++.h>

using namespace std;
 
class edge
{
public:
       int start;
       int end;
       int weight;
       edge(int s, int e);
       edge(int s, int e, int w);

       bool operator<(const edge &rhs) const;
       bool operator==(const edge &rhs) const;
       bool operator>(const edge &rhs) const;
       void print();
};
 
void print(std::set<edge> s);
void print(std::vector<edge> s);

// represents a cycle
// edge[0] is all the edges of priority zero
// edge[1] is all the edges of priority one, etc
class adj_edge {
public:
    int end;
    int weight;
    adj_edge(int v, int p);
    bool operator==(const adj_edge &rhs) const;
};


class Graph
{
    bool isCyclicUtil(int v, bool visited[], bool *rs); // used by isCyclic()
    std::vector<edge> findCyclicUtil(int v, bool visited[], bool *rs);  
     // A function used by topologicalSort
    void topologicalSortUtil(int v, bool visited[],
                             stack<int>& Stack);

public:
    int V;    // No. of vertices
    int p_levels;  // No of priority levels
    list<adj_edge> *adj;  // Pointer to an array containing adjacency lists
    
    Graph(int V);   // Constructor
    Graph(int V, int p_lev); 
    void addEdge(int v, int w, int p);  // to add an edge to graph from v to w,  with priority
    void addEdge(edge e);
    std::set<edge> * get_orderings_with_priority();
    std::set<edge>  get_orderings();
    bool isCyclic();    // returns true if there is a cycle in this graph        
    std::vector<edge> findCyclic();  // returns cycle  if there is a cycle in this graph
    
    int* shortestPath(int src);
    std::set<edge> find_path(int * prev, int src, int dest, std::set<edge> path);
    // a Topological Sort of
    // the complete graph
    stack<int> topologicalSort();
};
    
std::set<edge> break_cycle(std::set<edge> edges, int V);

