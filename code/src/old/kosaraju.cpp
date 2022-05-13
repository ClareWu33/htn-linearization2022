// C++ Implementation of Kosaraju's algorithm to print all SCCs
#include <iostream>
#include <list>
#include <stack>
#include <map>
#include <deque>
#include <vector>

using namespace std;

class Graph
{
	int V; // No. of vertices
	list<int> *adj; // An array of adjacency lists

	// Fills Stack with vertices (in increasing order of finishing
	// times). The top element of stack has the maximum finishing
	// time
	void fillOrder(int v, bool visited[], stack<int> &Stack);

	// A recursive function to print DFS starting from v
	void DFSUtil(int v, bool visited[], std::vector<int> &traversed_path);
public:
	Graph(int V);
	void addEdge(int v, int w);
	std::vector<std::vector<int>> SCCs();
	// The main function that finds and prints strongly connected
	// components
	void printSCCs();

	// Function that returns reverse (or transpose) of this graph
	Graph getTranspose();
};

Graph::Graph(int V)
{
	this->V = V;
	adj = new list<int>[V];
}

// A recursive function to print DFS starting from v
void Graph::DFSUtil(int v, bool visited[], std::vector<int> &traversed_path)
{
	// Mark the current node as visited and print it
	visited[v] = true;
	traversed_path.push_back(v);

	// Recur for all the vertices adjacent to this vertex
	list<int>::iterator i;
	for (i = adj[v].begin(); i != adj[v].end(); ++i)
		if (!visited[*i])
			DFSUtil(*i, visited, traversed_path);
}

Graph Graph::getTranspose()
{
	Graph g(V);
	for (int v = 0; v < V; v++)
	{
		// Recur for all the vertices adjacent to this vertex
		list<int>::iterator i;
		for(i = adj[v].begin(); i != adj[v].end(); ++i)
		{
			g.adj[*i].push_back(v);
		}
	}
	return g;
}

void Graph::addEdge(int v, int w)
{
	adj[v].push_back(w); // Add w to v’s list.
}

void Graph::fillOrder(int v, bool visited[], stack<int> &Stack)
{
	// Mark the current node as visited and print it
	visited[v] = true;

	// Recur for all the vertices adjacent to this vertex
	list<int>::iterator i;
	for(i = adj[v].begin(); i != adj[v].end(); ++i)
		if(!visited[*i])
			fillOrder(*i, visited, Stack);

	// All vertices reachable from v are processed by now, push v
	Stack.push(v);
}

// The main function that finds and prints all strongly connected
// components
std::vector<std::vector<int>> Graph::SCCs()
{
	stack<int> Stack;
	std::vector<std::vector<int>> all_SCCs;
	// Mark all the vertices as not visited (For first DFS)
	bool *visited = new bool[V];
	for (int i = 0; i < V; i++)
		visited[i] = false;

	// Fill vertices in stack according to their finishing times
	for(int i = 0; i < V; i++)
		if(visited[i] == false)
			fillOrder(i, visited, Stack);

	// Create a reversed graph
	Graph gr = getTranspose();

	// Mark all the vertices as not visited (For second DFS)
	for(int i = 0; i < V; i++)
		visited[i] = false;

	// Now process all vertices in order defined by Stack
	while (Stack.empty() == false)
	{
		// Pop a vertex from stack
		int v = Stack.top();
		Stack.pop();

		// Print Strongly connected component of the popped vertex
		if (visited[v] == false)
		{
			std::vector<int> traversed_path;
			gr.DFSUtil(v, visited, traversed_path); // one SCC in traversed_path
			all_SCCs.push_back(traversed_path);  
		}
	}
	return all_SCCs;
}
void  Graph::printSCCs()
{
	stack<int> Stack;

	// Mark all the vertices as not visited (For first DFS)
	bool *visited = new bool[V];
	for(int i = 0; i < V; i++)
		visited[i] = false;

	// Fill vertices in stack according to their finishing times
	for(int i = 0; i < V; i++)
		if(visited[i] == false)
			fillOrder(i, visited, Stack);

	// Create a reversed graph
	Graph gr = getTranspose();

	// Mark all the vertices as not visited (For second DFS)
	for(int i = 0; i < V; i++)
		visited[i] = false;

	// Now process all vertices in order defined by Stack
	while (Stack.empty() == false)
	{
		// Pop a vertex from stack
		int v = Stack.top();
		Stack.pop();

		// Print Strongly connected component of the popped vertex
		if (visited[v] == false)
		{
		        std::vector<int> traversed;
			gr.DFSUtil(v, visited, traversed);
			cout << endl;
		}
	}
}


class Johnson {
	std::set<int> blockedSet;            // Set<Vertex<Integer>> blockedSet;
	std::map<int, set<int>> blockedMap;  //    Map<Vertex<Integer>, Set<Vertex<Integer>>> blockedMap;
	std::deque<int> stack;               //    Deque<Vertex<Integer>> stack;
	std::vector<vector>> allCycles;      //    List<List<Vertex<Integer>>> allCycles;
	
	public:
	vector<vector<int>> simpleCycles(Graph graph) {
	long startIndex = 1;
	vector<vector<int>> result;/
	return result;
	}
};

// Driver program to test above functions
int main()
{
	// Create a graph given in the above diagram
	Graph g(7); //5);
	g.addEdge(1, 0);
	g.addEdge(0, 2);
	g.addEdge(2, 1);
	g.addEdge(0, 3);
	g.addEdge(3, 4);
	
	g.addEdge(4, 5);
	g.addEdge(5, 3);

	cout << "Following are strongly connected components in "
			"given graph \n";
	std::vector<std::vector<int>> results =  g.SCCs();
	printf("SCCs found %lu\n", results.size());
	for (int i=0; i<results.size(); i++) {
		for (int j=0; j<results[i].size(); j++) {
			printf("%i ", results[i][j]);
		}
		printf("\n");
	}
	return 0;
}

