// A C++ Program to detect cycle in a graph (from https://www.geeksforgeeks.org/detect-cycle-in-a-graph/)
#include "directed_graph.h"
//#include "minheap.cpp"

using namespace std;

edge::edge(int s, int e)
{
    start = s;
    end = e;
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
    // if (start > rhs.start)
    // {
    //        return true;
    // }
    // if (start == rhs.start && end > rhs.end) {
    //        return true;
    // }
    // return false;
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

bool priority_node::operator==(const priority_node &rhs) const
{
    if (value == rhs.value && priority == rhs.priority)
    {
        return true;
    }
    return false;
}

priority_node::priority_node(int v, int p)
{
    value = v;
    priority = p;
}

Graph::Graph(int V, int p_lev)
{
    this->V = V;
    adj = new list<priority_node>[V];
    p_levels = p_lev;
}

Graph::Graph(int V)
{
    this->V = V;
    adj = new list<priority_node>[V];
    p_levels = 1;
}

void Graph::addEdge(int v, int w, int p)
{
    priority_node node(w, p);
    adj[v].push_back(node); // Add w to v’s list.
}
void Graph::addEdge(int v, int w)
{
    priority_node node(w, 0);
    adj[v].push_back(node); // Add w to v’s list.
}

std::set<edge> *Graph::get_orderings_with_priority()
{
    std::set<edge> *result = new std::set<edge>[p_levels];
    for (int v = 0; v < V; v++)
    {
        for (priority_node n : adj[v])
        {
            edge e = edge(v, n.value);
            result[n.priority].insert(e);
        }
    }
    return result;
}

std::set<edge> Graph::get_orderings()
{
    std::set<edge> result;
    for (int v = 0; v < V; v++)
    {
        for (priority_node n : adj[v])
        {
            edge e = edge(v, n.value);
            result.insert(e);
        }
    }
    return result;
}

// This function is a variation of DFSUtil() in https://www.geeksforgeeks.org/archives/18212
bool Graph::isCyclicUtil(int v, bool visited[], bool *recStack)
{
    if (visited[v] == false)
    {
        // Mark the current node as visited and part of recursion stack
        visited[v] = true;
        recStack[v] = true;

        // Recur for all the vertices adjacent to this vertex
        list<priority_node>::iterator i;
        for (i = adj[v].begin(); i != adj[v].end(); ++i)
        {
            if (!visited[(*i).value] && isCyclicUtil((*i).value, visited, recStack))
                return true;
            else if (recStack[(*i).value])
                return true;
        }
    }
    recStack[v] = false; // remove the vertex from recursion stack
    return false;
}

bool Graph::isCyclic()
{
    // Mark all the vertices as not visited and not part of recursion stack
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
        if (!visited[i] && isCyclicUtil(i, visited, recStack))
            return true;

    return false;
}

// This function is a variation of DFSUtil() in https://www.geeksforgeeks.org/archives/18212
cycle Graph::findCyclicUtil(int v, bool visited[], bool *recStack)
{
    if (visited[v] == false)
    {
        // Mark the current node as visited and part of recursion stack
        visited[v] = true;
        recStack[v] = true;

        // Recur for all the vertices adjacent to this vertex
        list<priority_node>::iterator i;
        for (i = adj[v].begin(); i != adj[v].end(); ++i)
        {
            if (!visited[(*i).value])
            {
                cycle result = findCyclicUtil((*i).value, visited, recStack);
                if (result.isCycle)
                {
                    printf("visited,  cycle found at %i %i,  has priority %i   \n", v, (*i).value, (*i).priority);
                    // edge e = edge(v, (*i).value);
                    // result.edges[(*i).priority].insert(e);  // an edge that can be explored from this node is part of a cycle (inaccurate way to find cycle edges)
                    return result;
                }
            }
            else if (recStack[(*i).value])
            {
                printf("recStack, cycle found at %i %i, has priority %i \n", v, (*i).value, (*i).priority);
                cycle c;
                c.isCycle = true;
                c.edges = new std::set<edge>[p_levels];
                edge e = edge(v, (*i).value);
                c.edges[(*i).priority].insert(e);
                return c;
            }
        }
    }
    recStack[v] = false; // remove the vertex from recursion stack

    cycle result;
    result.isCycle = false;
    return result;
}

// Returns the cycle if the graph contains a cycle,
// This function is a variation of DFS() in https://www.geeksforgeeks.org/archives/18212
std::vector<cycle> Graph::findCyclic()
{
    std::vector<cycle> all_cycles;
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
            cycle c = findCyclicUtil(i, visited, recStack);
            if (c.isCycle)
            {
                all_cycles.push_back(c);
            }
        }
    }
    return all_cycles;
}

// A recursive function used by topologicalSort
void Graph::topologicalSortUtil(int v, bool visited[],
                                stack<int> &Stack)
{
    // Mark the current node as visited.
    visited[v] = true;

    // Recur for all the vertices
    // adjacent to this vertex
    list<priority_node>::iterator i;
    for (i = adj[v].begin(); i != adj[v].end(); ++i)
        if (!visited[(*i).value])
            topologicalSortUtil((*i).value, visited, Stack);

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

// // Function that implements Dijkstra's single source shortest path algorithm
// // for a graph represented using adjacency matrix representation
// int *Dijkstra(MinHeap Q, int source)
// {

//     // lookup-table for all rooms
//     int prev[V];   // prev[v.id] = id of 'next-hop' node on shortest route from this to source
//     float dist[V]; // dist[v.id] = distance of v to source
//     for (int i = 0; i < V; i++)
//     {
//         dist[i] = INT_MAX;
//         prev[i] = -1;
//     }
//     dist[source] = 0.0;
//     prev[source] = s.id;

//     // insert source with top priority
//     Node s = Node(source);
//     s.distance = 0.0;
//     Q.insert(s);

//     // check each reachable node
//     while (Q.heap.size() > 0)
//     {

//         Node u = Q.ExtractMin();

//         for (priority_node node_v: adj[u.id])
//         {
//             int v_id = node_v.value;
//             int v_pos = Q.find(v_id);
//             if (v_pos != -1)
//             {
//                 Node v = Q.heap[v_pos]; // neighbour v of u  - only if v still in Q
//                 float alt = dist[u.id] + 1;
//                 if (alt < dist[v.id])
//                 {
//                     prev[v.id] = u.id; // shortest path to v runs through u
//                     dist[v.id] = alt;
//                     Q.decreaseKey(v_pos, alt); // decrease_priority of v to alt
//                 }
//             }
//         }
//     }
//     return prev;
// };

// std::vector<int> find_path(int *prev, int src, int dest, std::vector<int> path)
// {
//     int neighbour = dest;
//     path.push_back(dest);
//     // at least one path
//     while (neighbour != src)
//     {
//         path.push_back(neighbour);
//         printf("%i ", neighbour);
//         neighbour = prev[neighbour];
//         if (neighbour == -1)
//         {
//             return path;
//         }
//     }
//     path.push_back(src);
//     printf("%i \n", src);
//     return path;
// }

int main_()
{
    // Create a graph given in the above diagram
    Graph gr(8);

    gr.addEdge(0, 1, 0);
    gr.addEdge(1, 2, 0);
    gr.addEdge(2, 0, 0);

    gr.addEdge(4, 2, 0);
    gr.addEdge(4, 5, 0);
    gr.addEdge(5, 6, 0);
    gr.addEdge(6, 7, 0);
    gr.addEdge(7, 4, 0);

    std::vector<cycle> cycles = gr.findCyclic();
    for (cycle c : cycles)
    {
        if (c.isCycle)
        {
            print(c.edges[0]);
        }
    }

    // // find the in the other direction
    // for (cycle c : cycles)
    // {
    //     if (c.isCycle)
    //     {
    //         for (edge e : c.edges[0])
    //         {
    //             int * path = gr.Dijkstra(e.end, e.start);

    //             std::vector<int> rest_of_path;
    //             find_path(int *prev, e.end, e.start, rest_of_path);
    //             print(res_of_path);                                                   
    //             if (rest_of_cycle.size() > 0)
    //             {
    //                 // pick a random edge, delete it
    //             }
    //         }
    //     }
    // }

    // // get sort  = 6 7 5 4 2 3 1 0
    // Graph g(8);
    // g.addEdge(5, 2);
    // g.addEdge(5, 0);
    // g.addEdge(4, 0);
    // g.addEdge(4, 1);
    // g.addEdge(2, 3);
    // g.addEdge(3, 1);

    // g.addEdge(6, 7);

    // cout << "Following is a Topological Sort of the given "
    //         "graph \n";

    // // Function Call
    // stack<int> Stack = g.topologicalSort();

    // printf("\n");
    // int first = Stack.top();
    // Stack.pop();
    // while (Stack.empty() == false) {
    //     int second = Stack.top();
    //     cout << first << " " << second << "\n";
    //     first = second;
    //     Stack.pop();
    // }

    return 0;
}