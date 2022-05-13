// Program to find Dijkstra's shortest path using
// priority_queue in STL
// https://www.geeksforgeeks.org/dijkstras-shortest-path-algorithm-using-priority_queue-stl/
// Program to find back edges
//https://www.geeksforgeeks.org/tree-back-edge-and-cross-edges-in-dfs-of-graph/

#include<bits/stdc++.h>
using namespace std;
# define INF 0x3f3f3f3f

// iPair ==> Integer Pair
// distance/priority, node_id
typedef pair<int, int> iPair;

// This class represents a directed graph using
// adjacency list representation
class Graph
{
	int V; // No. of vertices

	// In a weighted graph, we need to store vertex
	// and weight pair for every edge
	list< iPair > *adj;

public:
	int time;
	// map<int, bool> visited;
	Graph(int V); // Constructor

	// function to add an edge to graph
	void addEdge(int u, int v, int w);

	// prints shortest path from s
	int * shortestPath(int s);
	
	// void traverse_dfs(int node, int * visited, int * start_time, int * end_time, std::vector<int> back_edges);
	// void dfs();
	std::vector<iPair> DFS();
	std::vector<iPair> DFS_per_subtree(int v, bool * visited, std::vector<IPair> &back_edges);
};

// Allocates memory for adjacency list
Graph::Graph(int V)
{
	this->V = V;
	adj = new list<iPair> [V];
}

void Graph::addEdge(int u, int v, int w)
{
	adj[u].push_back(make_pair(v, w));
	// adj[v].push_back(make_pair(u, w));
}

// Prints shortest paths from src to all other vertices
int* Graph::shortestPath(int src)
{
	// Create a priority queue to store vertices that
	// are being preprocessed. This is weird syntax in C++.
	// Refer below link for details of this syntax
	// https://www.geeksforgeeks.org/implement-min-heap-using-stl/
	priority_queue< iPair, vector <iPair> , greater<iPair> > pq;

	// Create a vector for distances and initialize all
	// distances as infinite (INF)
	vector<int> dist(V, INF);
	int * prev = (int *)malloc(V * sizeof(int) ); //int prev[V] = {-1};  // previous node, possibly none if no path 
	for (int i=0; i<V; i++) {
	         prev[i] = -1;
	}     
	
	// Insert source itself in priority queue and initialize
	// its distance as 0.
	pq.push(make_pair(0, src));
	dist[src] = 0;
	
	vector<bool> f(V, false);

	/* Looping till priority queue becomes empty (or all
	distances are not finalized) */
	while (!pq.empty())
	{
		// The first vertex in pair is the minimum distance vertex, extract it from priority queue.
		// vertex label is stored in second of pair (to keep the vertices sorted by distance,
		// distance must be first item in pair)
		int u = pq.top().second;  
		pq.pop();
		f[u] = true;

		// 'i' is used to get all adjacent vertices of a vertex
		list< pair<int, int> >::iterator i;
		for (i = adj[u].begin(); i != adj[u].end(); ++i)
		{
			// Get vertex label and weight of current adjacent
			// of u.
			int v = (*i).first;
			int weight = (*i).second;

			// If there is shorted path to v through u.
			if (f[v] == false && dist[v] > dist[u] + weight)
			{
				// record that shortest path to v is from neighbour u
				prev[v] = u;
				// Updating distance of v
				dist[v] = dist[u] + weight;
				pq.push(make_pair(dist[v], v));
			}
		}
	}
	
	// Print shortest distances stored in dist[]
	printf("Vertex Distance from Source\n");
	for (int i = 0; i < V; ++i)
		printf("%d \t\t %d\n", i, dist[i]);
		
	return prev;
}

std::vector<iPair> Graph::DFS_per_subtree(int v, bool* visited, std::vector<iPair> &back_edges)
{
    // Mark the current node as visited and
    // print it
    visited[v] = true;
    cout << v << " ";
 
    // Recur for all the vertices adjacent
    // to this vertex
	list< pair<int, int> >::iterator i;
	for (i = adj[v].begin(); i != adj[v].end(); ++i)
	{
		// Get vertex label and weight of current adjacent of u.
		int u = (*i).first;
		printf("%i ", u);
		int weight = (*i).second;
	
        if (!visited[u]) {
            DFS_per_subtree(u, visited);
		} else {
			back_edges. printf("we have returned %i %i \n", v, u);
		}
	}
}

std::vector<iPair> Graph::DFS() 
{
    // Mark all the vertices as not visited
    bool *visited = new bool[V]; 
    for (int i = 0; i < V; i++)
    {
        visited[i] = false; 
    }

    // Call the recursive helper function to detect cycle in different
    // DFS trees
	std::vector<iPair> back_edges;
    for (int i = 0; i < V; i++) {
        if (!visited[i]) {
			DFS_per_subtree(i, visited);
		}
	}
}



// void Graph::dfs()
// {
// 	time = 0;
// 	int visited[V] = {false};
//         int start_time[V] = {0};
//         int end_time[V] = {0};
//         std::vector<int> back_edges;
 
//         for (int node=0; node<V; node++) {
//         	if (!visited[node]) {
//         		traverse_dfs(node, visited, start_time, end_time, back_edges); 
//         		}        
//         } 
//         // printf("\n DFS Traversal: ")
//         // print(self.traversal_array)
//  }
 
// void Graph::traverse_dfs(int node, int * visited, int * start_time, int * end_time, std::vector<int> back_edges) {
//         // mark the node visited
//         visited[node] = true;
//         // add the node to traversal
//         //// self.traversal_array.append(node)
//         // get the starting time
//         start_time[node] = time;       
//         time++;
//         // traverse through the neighbours, using iterator i
//         list< pair<int, int> >::iterator i;
// 	for (i = adj[node].begin(); i != adj[node].end(); ++i)
// 	{
// 	    // Get vertex label of current adjacent of node.
// 	    int neighbour = (*i).first;
// 	    printf("%i --> %i\n", node, neighbour);
// 	    // if a node is not visited
//             if (!visited[neighbour]) {
//                 // marks the edge as tree edge
//                 printf("Tree Edge:', %i-->%i\n", node, neighbour);
//                 // dfs from that node
//                 traverse_dfs(neighbour, visited, start_time, end_time, back_edges);
//             } else {
//                 // when the parent node is traversed after the neighbour node
//                 if (start_time[node] > start_time[neighbour] && end_time[node] < end_time[neighbour])
//                     printf("Back Edge:', %i --> %i\n", node, neighbour);
//                     back_edges.push_back(node);
//                     back_edges.push_back(neighbour);
// //                // when the neighbour node is a descendant but not a part of tree
// //               elif self.start_time[node] < self.start_time[neighbour] and self.end_time[node] > self.end_time[neighbour]:
// //                    print('Forward Edge:', str(node)+'-->'+str(neighbour))
// //                // when parent and neighbour node do not have any ancestor and a descendant relationship between them
// //                elif self.start_time[node] > self.start_time[neighbour] and self.end_time[node] > self.end_time[neighbour]:
// //                    print('Cross Edge:', str(node)+'-->'+str(neighbour))
//             }
//             end_time[node] = time;
//             time++;
// 	}
// }
            

std::vector<int> find_path(int * prev, int src, int dest, std::vector<int> path) {
     int neighbour = dest;
     path.push_back(dest);  
          // at least one path
     while (neighbour != src) {
               path.push_back(neighbour);
               printf("%i ", neighbour);  
               neighbour = prev[neighbour]; 
             if (neighbour == -1) {                
                 return path;
             }                                               
     }
     path.push_back(src);
     printf("%i \n", src); 
     return path;        
}

// Driver program to test methods of graph class
int main()
{
	// create the graph given in above fugure
	int V = 12;
	Graph g(V);

	// making above shown graph
	g.addEdge(0, 1, 4);
	g.addEdge(0, 7, 8);
	g.addEdge(1, 2, 8);
	g.addEdge(1, 7, 11);
	g.addEdge(2, 3, 7);
	g.addEdge(2, 8, 2);
	g.addEdge(2, 5, 4);
	g.addEdge(3, 4, 9);
	g.addEdge(3, 5, 14);
	g.addEdge(4, 5, 10);
	g.addEdge(5, 6, 2);
	g.addEdge(6, 7, 1);
	g.addEdge(6, 8, 6);
	g.addEdge(7, 8, 7);

	g.addEdge(9, 10, 0);
	g.addEdge(10, 11, 0);
	g.addEdge(11, 9, 0);

	g.shortestPath();            
int* Graph::shortestPath(int src)
std::vector<int> find_path(int * prev, int src, int dest, std::vector<int> path) {

	// <node, priority> backedges = DFS
	// delete all back edges, to find other path between them
	// for og graph = if back edge priority ok, delete back edge
	//                 else delete another edge ok edge from path found


	return 0;
}
