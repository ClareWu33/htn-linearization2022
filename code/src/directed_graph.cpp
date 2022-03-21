// A C++ Program to detect cycle in a graph (from https://www.geeksforgeeks.org/detect-cycle-in-a-graph/)
#include<bits/stdc++.h>
#include "directed_graph.h"
#include "util.h"

using namespace std;


Graph::Graph(int V)
{
    this->V = V;
    adj = new list<int>[V];
}
 
void Graph::addEdge(int v, int w)
{
    adj[v].push_back(w); // Add w to v’s list.
}

vector<int> Graph::get_orderings()
{
    vector<int> result;
    for (int v=0; v<V; v++) {
        for (int u : adj[v]) {
            result.push_back(v);
            result.push_back(u);
        } 
    }
    return result;
}


// This function is a variation of DFSUtil() in https://www.geeksforgeeks.org/archives/18212
bool Graph::isCyclicUtil(int v, bool visited[], bool *recStack)
{
    if(visited[v] == false)
    {
        // Mark the current node as visited and part of recursion stack
        visited[v] = true;
        recStack[v] = true;
 
        // Recur for all the vertices adjacent to this vertex
        list<int>::iterator i;
        for(i = adj[v].begin(); i != adj[v].end(); ++i)
        {
            if ( !visited[*i] && isCyclicUtil(*i, visited, recStack) )
                return true;
            else if (recStack[*i])
                return true;
        }
 
    }
    recStack[v] = false;  // remove the vertex from recursion stack
    return false;
}


bool Graph::isCyclic()
{
    // Mark all the vertices as not visited and not part of recursion stack
    bool *visited = new bool[V];
    bool *recStack = new bool[V];
    for(int i = 0; i < V; i++)
    {
        visited[i] = false;
        recStack[i] = false;
    }
 
    // Call the recursive helper function to detect cycle in different
    // DFS trees
    for(int i = 0; i < V; i++)
        if ( !visited[i] && isCyclicUtil(i, visited, recStack))
            return true;
 
    return false;
}
 
// This function is a variation of DFSUtil() in https://www.geeksforgeeks.org/archives/18212
cycle Graph::findCyclicUtil(int v, bool visited[], bool *recStack)
{
    if(visited[v] == false)
    {
        // Mark the current node as visited and part of recursion stack
        visited[v] = true;
        recStack[v] = true;
 
        // Recur for all the vertices adjacent to this vertex
        list<int>::iterator i;
        for(i = adj[v].begin(); i != adj[v].end(); ++i)
        {
            if ( !visited[*i]) {
                cycle result = findCyclicUtil(*i, visited, recStack);
                if (result.isCycle) {
                    // printf("visited,  cycle found at %i %i \n", v, *i);
                    result.isCycle = true;
                    result.edges.push_back(v);
                    result.edges.push_back(*i);
                    return result;
                }
            }
            else if (recStack[*i]) {
                // printf("recStack, cycle found at %i %i \n", v, *i);
                cycle result;
                result.isCycle = true;
                result.edges.push_back(v);
                result.edges.push_back(*i);
                return result;
            }
        }
 
    }
    recStack[v] = false;  // remove the vertex from recursion stack

    cycle result;
    result.isCycle = false;
    return result;
}
 
// Returns true if the graph contains a cycle, else false.
// This function is a variation of DFS() in https://www.geeksforgeeks.org/archives/18212
cycle Graph::findCyclic()
{
    // Mark all the vertices as not visited and not part of recursion
    // stack
    bool *visited = new bool[V];
    bool *recStack = new bool[V];
    for(int i = 0; i < V; i++)
    {
        visited[i] = false;
        recStack[i] = false;
    }
 
    // Call the recursive helper function to detect cycle in different
    // DFS trees
    for(int i = 0; i < V; i++) {
        if ( !visited[i]) {
            cycle c = findCyclicUtil(i, visited, recStack); 
            if (c.isCycle) { return c; }
        }
    }
    cycle result;
    result.isCycle = false;
    return result;
}
 
 

// int main()
// {
//     // Create a graph given in the above diagram
//     Graph g(4); 

//     g.addEdge(0, 3);
//     g.addEdge(0, 1);
//     g.addEdge(1, 2);
//     g.addEdge(2, 0); 
//     cycle c = g.findCyclic();
//     if (c.isCycle) {
//         printf("DID find a cycle ");
//         print(c.edges);  
//     }

//     print(g.get_orderings());

// }