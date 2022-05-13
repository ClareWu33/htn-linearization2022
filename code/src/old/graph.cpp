// C++ program to print all the cycles
// in an undirected graph
// https://www.geeksforgeeks.org/print-all-the-cycles-in-an-undirected-graph/
#include <bits/stdc++.h>
#include <algorithm>    // std::sort
using namespace std;
const int N = 100000;
 
// variables to be used
// in both functions
struct p_node {
    int value;
    int priority;
    p_node(int v, int p) {
        value = v;
        priority = p;
    }
}; 

struct edge {
    int start;
    int end;
    edge(int s, int e) {
        start = s;
        end = e;
    }
}; 

vector<p_node> graph[N];
vector<int> cycles[N];
 
// Function to mark the vertex with
// different colors for different cycles
void dfs_cycle(int u, int p, int color[],
               int mark[], int par[], int& cyclenumber)
{
 
    // already (completely) visited vertex.
    if (color[u] == 2) {
        return;
    }
 
    // seen vertex, but was not completely visited -> cycle detected.
    // backtrack based on parents to find the complete cycle.
    if (color[u] == 1) {
 
        cyclenumber++;
        int cur = p;
        mark[cur] = cyclenumber;
 
        // backtrack the vertex which are
        // in the current cycle thats found
        while (cur != u) {
            cur = par[cur];
            mark[cur] = cyclenumber;
        }
        return;
    }
    par[u] = p;
 
    // partially visited.
    color[u] = 1;
 
    // simple dfs on graph
    for (p_node v : graph[u]) {
 
        // if it has not been visited previously
        if (v.value == par[u]) {
            continue;
        }
        dfs_cycle(v.value, u, color, mark, par, cyclenumber);
    }
 
    // completely visited.
    color[u] = 2;
}
 
// add the edges to the graph
void addEdge(int u, int v, int p)
{
    p_node node(v, p);    
    graph[u].push_back(node);
    //p_node node2(u, p);    
    //graph[v].push_back(node2);
}
 
void addEdge(int u, int v)
{
    p_node node(v, 0);    
    graph[u].push_back(node);
    p_node node2(u, 0);    
    graph[v].push_back(node2);
}

// Function to print the cycles
void printCycles(int edges, int mark[], int& cyclenumber)
{
 
    // push the edges that into the
    // cycle adjacency list
    for (int i = 1; i <= edges; i++) {
        if (mark[i] != 0)
            cycles[mark[i]].push_back(i);
    }
 
    // print all the vertex with same cycle
    for (int i = 1; i <= cyclenumber; i++) {
        // Print the i-th cycle
        cout << "Cycle Number " << i << ": ";
        for (int x : cycles[i])
            cout << x << " ";
        cout << endl;
    }
}




bool nodecompare (p_node i, p_node j) { return (i.value < j.value); }
//vector<p_node> graph[N];
//vector<int> cycles[N];
std::vector<edge> intersection(int node, vector<p_node> vec1, vector<int> vec2, std::vector<edge> &intersect) {

    std::sort(vec1.begin(), vec1.end(),  nodecompare);
    std::sort(vec2.begin(), vec2.end());

    // iterate over both
    int i=0;
    int j=0;
    while(i<vec1.size() && j<vec2.size()) {
        if (vec1[i].value == vec2[j]) {
            edge e(node, vec1[i].value);
            intersect.push_back( e );
            i++;
            j++;
        }
        if (vec1[i].value > vec2[j]) {
            j++;
        }
        if (vec1[i].value < vec2[j]) {
            i++;
        }
    }
    return intersect;
}
 
 std::vector<edge> * cycleEdges(int& cyclenumber, std::vector<edge> * cycle_edges)  {
    cycle_edges = new std::vector<edge>[cyclenumber + 1];
    // for each cycle
    for (int i = 1; i <= cyclenumber; i++) {
        // get the edges involved with two members of the cycle
        for (int node : cycles[i])        
            intersection(node, graph[node], cycles[i], cycle_edges[i]); 
    }  
    return cycle_edges;
}

// Driver Code
int main()
{ 
    // add edges
    addEdge(1, 2);
    addEdge(2, 3);
    addEdge(3, 4);
    addEdge(4, 6);
    addEdge(4, 7);
    addEdge(5, 6);
    addEdge(3, 5);
    addEdge(7, 8);
    addEdge(6, 10);
    addEdge(5, 9);
    addEdge(10, 11);
    addEdge(11, 12);
    addEdge(11, 13);
    addEdge(12, 13);
 
    // arrays required to color the
    // graph, store the parent of node
    int color[N];
    int par[N];
 
    // mark with unique numbers
    int mark[N];
 
    // store the numbers of cycle
    int cyclenumber = 0;
    int edges = 13;
 
    // call DFS to mark the cycles
    dfs_cycle(1, 0, color, mark, par, cyclenumber);
 
    // function to print the cycles
    printCycles(edges, mark, cyclenumber);

    std::vector<edge> * cycle_edges = new std::vector<edge>[cyclenumber + 1];
    cycle_edges = cycleEdges(cyclenumber, cycle_edges);
    
    intersection(5, graph[1], cycles[1], cycle_edges[1]);

    printf("size for cycle 1 =%lu\n ", cycle_edges[1].size());

    for (int i=1; i<cyclenumber+1; i++) {
        printf("new cycle ");
        for (int j=0; j<cycle_edges[i].size(); j++) {
            printf("(%i %i)", (cycle_edges[i][j]).start,(cycle_edges[i][j]).end);
        }
        printf("\n");
    }


}