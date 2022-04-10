// A C++ Program to detect cycle in a graph (from https://www.geeksforgeeks.org/detect-cycle-in-a-graph/)
#include "directed_graph.h"
//#include "minheap.cpp"

using namespace std;

// iPair ==> Integer Pair
// distance/priority, node_id
typedef pair<int, int> iPair;

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
    printf("(%i, %i)%i ", start, end, weight);
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

void set_to_vector()
{
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
                std::vector<edge> back_edge;
                edge e(v, (*i).end, (*i).weight);
                back_edge.push_back(e);
                return back_edge;
            }
        }
    }
    recStack[v] = false; // remove the vertex from recursion stack

    std::vector<edge> back_edge;
    return back_edge;
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
            std::vector<edge> back_edge = findCyclicUtil(i, visited, recStack);
            if (back_edge.size() > 0)
            {
                return back_edge; // all_back_edges.push_back(back_edges[0]);
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
}

// Prints shortest paths from src to all other vertices
int *Graph::shortestPath(int src)
{
    // Create a priority queue to store vertices that
    // are being preprocessed. This is weird syntax in C++.
    // Refer below link for details of this syntax
    // https://www.geeksforgeeks.org/implement-min-heap-using-stl/
    priority_queue<iPair, vector<iPair>, greater<iPair>> pq;

    // Create a vector for distances and initialize all
    // distances as infinite (INF)
    // int INF = 9999999999;
    vector<int> dist(V, 99999);
    int *prev = (int *)malloc(V * sizeof(int)); // int prev[V] = {-1};  // previous node, possibly none if no path
    for (int i = 0; i < V; i++)
    {
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
        list<adj_edge>::iterator i;
        for (i = adj[u].begin(); i != adj[u].end(); ++i)
        {
            // Get vertex label and weight of current adjacent of u.
            int v = (*i).end;
            int weight = (*i).weight;

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
    //	printf("Vertex Distance from Source\n");
    //	for (int i = 0; i < V; ++i)
    //		printf("%d \t\t %d\n", i, dist[i]);

    return prev;
}

std::set<edge> Graph::find_path(int *prev, int src, int dest, std::set<edge> edges)
{
    int neighbour = dest;
std:
    vector<int> path;
    // at least one path
    while (neighbour != src)
    {
        path.push_back(neighbour);
        neighbour = prev[neighbour];
        if (neighbour == -1)
        {
            std::set<edge> no_path;
            return no_path;
        }
    }
    path.push_back(src); // path from dest to src

    // edges connecting src to dest
    for (int i = path.size()-2; i >= 0; i--)
    {
        int start = path[i + 1];
        int end = path[i];
        // TODO: find priority of edge
        for (adj_edge e1 : adj[start])
        {
            if (e1.end = end)
            {
                edge e(start, end, e1.weight);
                edges.insert(e);
            }
        }
    }
    return edges;
}

std::set<edge> delete_edge(std::set<edge> edges, edge e)
{
    std::set<edge>::iterator place_to_delete;
    for (std::set<edge>::iterator iter = edges.begin(); iter != edges.end(); ++iter)
    {
        if (*iter == e)
        {
            place_to_delete = iter;
        }
    }
    edges.erase(place_to_delete);
    return edges;
}

// V is number of nodes
// REQUIRES A WELL-FORMED SET OF EDGES, (E.G., NO REPEATS WITH DIFFERING PRIORITY)
std::set<edge> break_cycle(std::set<edge> edges, int V)
{
    // for each back edge
    // 1) delete back edge between the 2 nodes OR
    // 2) delete other path between the 2 nodes
    // repeat until no more cycles can be found
    std::vector<edge> is_cycle = {edge(-1, -1, -1)};
    do
    {
        // make (or re-make) graph out of remaining edges
        Graph gr(V);
        for (edge e : edges)
            gr.addEdge(e);
        // printf("edges in graph: ");
        // print(edges);

        // finds a back edge that leads back to a previously seen node ( if it exists)
        is_cycle = gr.findCyclic();
        if (is_cycle.size() > 0)
        {
            edge back_edge = is_cycle[0];
            // printf("back edge found: (%i, %i) weight %i\n", back_edge.start, back_edge.end, back_edge.weight);
            // deletes back_edge from edges (if edge is not required)
            if (back_edge.weight != 0)
            {
                edges = delete_edge(edges, back_edge);
            }
            // else find the rest of the cycle, and delete one of their edges
            else
            {
                // find other edges of the cycle
                int *prev = gr.shortestPath(back_edge.end);
                std::set<edge> other_edges;
                other_edges = gr.find_path(prev, back_edge.end, back_edge.start, other_edges);
                // select a non-required edge from the cycle and delete it
                if (other_edges.size() > 0)
                {
                    // printf("other edges in this cycle");
                    // for (edge e1 : other_edges)
                    // {
                    //     printf("(%i, %i)%i ", e1.start, e1.end, e1.weight);
                    // }
                    // printf("\n");

                    // find all the non-required edges
                    std::vector<edge> non_req_edges;
                    for (std::set<edge>::iterator iter = other_edges.begin(); iter != other_edges.end(); ++iter)
                    {
                        if ((*iter).weight != 0)
                        {
                            non_req_edges.push_back(*iter);
                        }
                    }
                    
                    if (non_req_edges.size() > 0)
                    {
                        // pick a random non-required edge
                        int rand_idx = std::rand() % non_req_edges.size();
                        std::vector<edge> non_req_edges_vec = std::vector<edge>(non_req_edges.begin(), non_req_edges.end());
                        edge rand_edge = non_req_edges_vec[rand_idx];
                        //printf("rand_edge = (%i %i) %i", rand_edge.start, rand_edge.end, rand_edge.weight);
                        // and delete it
                        edges = delete_edge(edges, rand_edge); 
                    }
                    else
                    {
                        printf("The required edges form a cycle - it is impossible to linearize this method effectively");
                    }
                }
                // printf("random edge deleted (%i, %i)\n", rand_edge.start, rand_edge.end);
            }
        }
    } while (is_cycle.size() > 0);
    // printf("no more cycles could be found.  ");
    return edges;
}


int main_()
{
    for (int ii = 0; ii < 2; ii++)
    {
        if (ii == 0)
        {
            // intialize graph edges
            std::set<edge> test_edges_1;
            test_edges_1.insert(edge(0, 1, 0)); // perma
            test_edges_1.insert(edge(1, 0, 1)); // perma
            test_edges_1.insert(edge(0, 1, 1)); // not added

            // test_edges_1.insert(edge(0, 1, 1));
            // test_edges_1.insert(edge(1, 2, 0));
            // test_edges_1.insert(edge(2, 3, 1));
            // test_edges_1.insert(edge(3, 4, 1));
            // test_edges_1.insert(edge(4, 5, 1));
            // test_edges_1.insert(edge(5, 0, 1));
            // test_edges_1.insert(edge(4, 1, 1)); //<--- another one
            std::set<edge> new_edges = break_cycle(test_edges_1, 6);
            printf("edges in new graph: ");
            print(new_edges);
        }
        else
        {
            // intialize graph edges
            std::set<edge> test_edges_1;
            test_edges_1.insert(edge(1, 0, 0));
            test_edges_1.insert(edge(0, 1, 1));
            test_edges_1.insert(edge(1, 0, 1)); // not added

            // test_edges_1.insert(edge(0, 1, 1));
            // test_edges_1.insert(edge(1, 2, 0));
            // test_edges_1.insert(edge(2, 3, 1));
            // test_edges_1.insert(edge(3, 4, 1));
            // test_edges_1.insert(edge(4, 5, 1));
            // test_edges_1.insert(edge(5, 0, 1));
            // test_edges_1.insert(edge(4, 1, 1)); //<--- another one
            std::set<edge> new_edges = break_cycle(test_edges_1, 6);
            printf("edges in new graph: part 2 ");
            print(new_edges);
        }
    }

    return 0;
}
