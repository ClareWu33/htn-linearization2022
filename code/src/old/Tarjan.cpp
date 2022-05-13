// A C++ Program to detect cycle in a graph (from https://www.geeksforgeeks.org/detect-cycle-in-a-graph/) 
//#include "minheap.cpp"
#include<bits/stdc++.h>

using namespace std;

// iPair ==> Integer Pair
// distance/priority, node_id
typedef pair<int, int> iPair;

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
    void addEdge(int v, int w);
    void addEdge(int v, int w, int p);  // to add an edge to graph from v to w,  with priority
    void addEdge(edge e);
    std::set<edge> * get_orderings_with_priority();
    std::set<edge>  get_orderings();
    bool isCyclic();    // returns true if there is a cycle in this graph        
    std::vector<edge> findCyclic();  // returns cycle  if there is a cycle in this graph
    int* shortestPath(int src);
    std::vector<edge> find_path(int * prev, int src, int dest, std::vector<edge> path);
    
    // a Topological Sort of
    // the complete graph
    stack<int> topologicalSort();
};
    
/***********************************************************************/
// .CPP
/**********************************************************************/
edge::edge(int s, int e)
{
    start = s;
    end = e;
    weight = 0;
}

edge::edge(int s, int e, int w)
{
    start = s;
    end = e;
    weight = w;
}

bool edge::operator<(const edge &rhs) const
{
    if (start < rhs.start || (start == rhs.start && end < rhs.end))
    {
        return true;
    }
    return false;
}

bool edge::operator==(const edge &rhs) const
{
    if (start == rhs.start && end == rhs.end)
    {
        return true;
    }
    return false;
}

bool edge::operator>(const edge &rhs) const
{
    return !(operator<(rhs)) && !(operator==(rhs));
}

void edge::print()
{
    printf("(%i, %i)", start, end);
}

void print(set<edge> s)
{
    for (auto elem : s)
    {
        elem.print();
    }
    printf("\n");
}

void print(std::vector<edge> s)
{
    for (auto elem : s)
    {
        elem.print();
    }
    printf("\n");
}

bool adj_edge::operator==(const adj_edge &rhs) const
{
    if (end == rhs.end && weight == rhs.weight)
    {
        return true;
    }
    return false;
}

adj_edge::adj_edge(int v, int p)
{
    end = v;
    weight = p;
}

Graph::Graph(int V, int p_lev)
{
    this->V = V;
    adj = new list<adj_edge>[V];
    p_levels = p_lev;
}

Graph::Graph(int V)
{
    this->V = V;
    adj = new list<adj_edge>[V];
    p_levels = 1;
}

void Graph::addEdge(int v, int w, int p)
{
    adj_edge edge(w, p);
    adj[v].push_back(edge); // Add w to v’s list.
}
void Graph::addEdge(int v, int w)
{
    adj_edge edge(w, 0);
    adj[v].push_back(edge); // Add w to v’s list.
}

void Graph::addEdge(edge e)
{
    adj_edge edge(e.end, e.weight);
    adj[e.start].push_back(edge); // Add w to v’s list.
}

// void Graph::eraseEdge(int u, int v) {
// 	list<adj_edge>::iterator i;
//         for (i = adj[u].begin(); i != adj[u].end(); ++i) {
// 	    if ((*i).end == v) {
// 	         //Node n((*i).end , (*i).priority)
// 	         // adj[u].erase(i);
// 	         adj[u].remove(*i);
// 	    }
// 	}
// 	// adj[u].remove(v);
// }

std::set<edge> *Graph::get_orderings_with_priority()
{
    std::set<edge> *result = new std::set<edge>[p_levels];
    for (int v = 0; v < V; v++)
    {
        for (adj_edge n : adj[v])
        {
            edge e = edge(v, n.end);
            result[n.weight].insert(e);
        }
    }
    return result;
}

std::set<edge> Graph::get_orderings()
{
    std::set<edge> result;
    for (int v = 0; v < V; v++)
    {
        for (adj_edge n : adj[v])
        {
            edge e = edge(v, n.end);
            result.insert(e);
        }
    }
    return result;
}

// This function is a variation of DFSUtil() in https://www.geeksforgeeks.org/archives/18212
// finds 1 or 0 edges
std::vector<edge> Graph::findCyclicUtil(int v, bool visited[], bool *recStack)
{
    if (visited[v] == false)
    {
        // Mark the current node as visited and part of recursion stack
        visited[v] = true;
        recStack[v] = true;

        // Recur for all the vertices adjacent to this vertex
        list<adj_edge>::iterator i;
        for (i = adj[v].begin(); i != adj[v].end(); ++i)
        {
            if (!visited[(*i).end])
            {
                std::vector<edge> result = findCyclicUtil((*i).end, visited, recStack);
                if (result.size() > 0)
                {
                    return result;
                }
            }
            else if (recStack[(*i).end])
            {
                // printf("recStack, cycle found at %i %i, has weight %i \n", v, (*i).end, (*i).weight);
                std::vector<edge> back_edges;
                edge e(v, (*i).end, (*i).weight);
                back_edges.push_back(e);
                return back_edges;
            }
        }
    }
    recStack[v] = false; // remove the vertex from recursion stack

    std::vector<edge> back_edges;
    return back_edges;
}

// Returns the cycle if the graph contains a cycle,
// This function is a variation of DFS() in https://www.geeksforgeeks.org/archives/18212
std::vector<edge> Graph::findCyclic()
{
    std::vector<edge> all_back_edges;
    // Mark all the vertices as not visited and not part of recursion
    // stack
    bool *visited = new bool[V];
    bool *recStack = new bool[V];

    for (int i = 0; i < V; i++)
    {
        visited[i] = false;
        recStack[i] = false;
    }

    // Call the recursive helper function to detect cycle in different
    // DFS trees
    for (int i = 0; i < V; i++)
    {
        if (!visited[i])
        {
            std::vector<edge> back_edges = findCyclicUtil(i, visited, recStack);
            if (back_edges.size() > 0)
            {
                all_back_edges.push_back(back_edges[0]);
            }
        }
    }
    return all_back_edges;
}

// A recursive function used by topologicalSort
void Graph::topologicalSortUtil(int v, bool visited[],
                                stack<int> &Stack)
{
    // Mark the current node as visited.
    visited[v] = true;

    // Recur for all the vertices
    // adjacent to this vertex
    list<adj_edge>::iterator i;
    for (i = adj[v].begin(); i != adj[v].end(); ++i)
        if (!visited[(*i).end])
            topologicalSortUtil((*i).end, visited, Stack);

    // Push current vertex to stack
    // which stores result
    Stack.push(v);
}

// The function to do Topological Sort.
// It uses recursive topologicalSortUtil()
stack<int> Graph::topologicalSort()
{
    stack<int> Stack;

    // Mark all the vertices as not visited
    bool *visited = new bool[V];
    for (int i = 0; i < V; i++)
        visited[i] = false;

    // Call the recursive helper function
    // to store Topological
    // Sort starting from all
    // vertices one by one
    for (int i = 0; i < V; i++)
        if (visited[i] == false)
            topologicalSortUtil(i, visited, Stack);
    return Stack;
};

class TarjanSCC {
	std::map<int, int> visitedTime;  // node, time
	std::map<int, int> lowTime; // node, time
	std::set<int> onStack;   // node
	std::deque<int> stack;   // node
	std::set<int> visited;        // node
	std::list<std::set<int>> result; // node
	int time;
	
	public:
	// method 1
	std::list<std::set<int>>  scc(Graph graph) {
	     time = 0;
	     for (int vertex=0; vertex<graph.V; vertex++) {
	     	if (visited.find(vertex) != visited.end()) {  // if visited contains vertex
	     		continue;  // TODO: is it out of the loop??????????
	     	} 
	     	sccUtil(vertex,  graph);
	     }
	     return result;
	}
	
	// method 2
	void sccUtil(int vertex, Graph graph) {
		visited.insert(vertex);
		visitedTime[vertex] = time;
		lowTime[vertex] = time;
		time ++;
		stack.push_front(vertex); // add at front of stack
		onStack.insert(vertex);
		
		for (adj_edge e: graph.adj[vertex]) {
			int child = e.end;
			//if child is not visited then visit it and see if it has link back to vertex's ancestor. In that case update low time to ancestor's visit time
            		if (visited.find(vertex) == visited.end()) {
            			sccUtil(child, graph);
            			lowTime[vertex] = min(lowTime[vertex], lowTime[child]);
			} else if (onStack.find(child) != onStack.end()) {
				lowTime[vertex] = min(lowTime[vertex], visitedTime[child]);
			}
		}
		
		// //if vertex low time is same as visited time then this is start vertex for strongly connected component.
        //keep popping vertices out of stack still you find current vertex. They are all part of one strongly
        //connected component.
        	if(visitedTime[vertex] == lowTime[vertex]) {
        		std::set<int> stronglyConnectedComponent;
        		int v; // node
        		do {
        			v = stack.front();
        			stack.pop_front();
        			
        			onStack.erase(v);
        			stronglyConnectedComponent.insert(v);
        		} while (vertex != v);
        		result.push_back(stronglyConnectedComponent);
        	}
	}
};


int main() {
    std::vector<edge> test_edges_1;
    test_edges_1.push_back(edge(0, 1, 0));
    test_edges_1.push_back(edge(1, 2, 0));
    test_edges_1.push_back(edge(2, 0, 0));
//    test_edges_1.push_back(edge(3, 4, 0));
//    test_edges_1.push_back(edge(4, 5, 1));
//    test_edges_1.push_back(edge(5, 0, 0));
//    test_edges_1.push_back(edge(4, 1, 0)); //<--- another one
    
    Graph gr(3);
    for (edge e : test_edges_1)
          gr.addEdge(e);
          
    TarjanSCC * t = new TarjanSCC();
    std::list<std::set<int>>  result = t->scc(gr);
    
    printf("number of scc %lu\n", result.size()); //uh
    
    for (std::set<int> scc : result) {
       for(int elem : scc) {
       	printf("%i ", elem);
       }
       printf("\n");
    }
}
