#include <iostream>
#include <string>
#include <vector>
#include <stdexcept>
#include <climits> 

using namespace std;

// The node-type that makes up the binary tree
// we sort based on distance 
class Node {
    public:
        float distance; // total distance from source to Node (=key/priority)
        
        int id;
        float weight; 
        Node(int node_id, float w);
};

Node::Node(int node_id, float w) {
	distance = 0;
	id = node_id;
	weight = w;
}

class MinHeap {
    public:
        vector<Node> heap;

        // Returns the parent position of A[i]
        int parent(int i) { return (i-1)/2; }

        // Returns the left child position of A[i]
        int left(int i) { return (2*i)+1; }
        
        // Returns the right child position of A[i]
        int right(int i) { return (2*i)+2; }

        // finds position of element (based on ID) in an array
        int find(int ID) {
            for (int i=0; i<heap.size(); i++) {
                if (heap[i].id == ID) {
                   return i;
                }
            }
            return -1;
        }

        // DOWN
        // performs heapify operation on the ith node
        // "heapify" = swap node with smallest child until it hits bottom of heap
        void heapify(int i) {
        	int l = left(i);
        	int r = right(i);
        	int smallest;
        	if (l < heap.size() and heap[l].distance < heap[i].distance) {
        		smallest = l;
        	} else {
        		smallest = i;
        	}
        	if (r < heap.size() and heap[r].distance < heap[smallest].distance) {
        	    smallest = r;
        	}
        	if (smallest != i) {
        	    swap(heap[i], heap[smallest]);
        	    heapify(smallest);
        	}
        }

        void BuildHeap() {
        	for (int i=heap.size()/2; i>=0; i--) {
        		heapify(i);
        	}
        }

        // UP
        // takes the node at position i, changes the key value to destinations
        // shuffles it to new position in heap
        void decreaseKey(int i, float key) {
         	if (key > heap[i].distance) {
        		throw std::invalid_argument("New key larger than current key - cannot move element up without violating heap property" );
        	}
        	heap[i].distance = key;
		    // if parent is greater than current, thats wrong, swap them
		    while (i > 0 and heap[parent(i)].distance > heap[i].distance) {
		        swap(heap[parent(i)], heap[i]);
      			i = parent(i); // new position it swapped to
      		    }
      	}

      	void insert(Node data) {
      		heap.push_back(data);
      		decreaseKey(heap.size()-1, data.distance);
      	}

       // This function deletes key at index i. It first reduces value to negative (distance should not be negative)
       // then calls extractMin() 
       void deleteNode(int i) 
        { 
              decreaseKey(i, INT_MIN); 
              ExtractMin(); 
        } 
        
      	// extracts the root, returns the value, and heapifies tree
      	// = swap the last node into the root position, delete last position;
      	Node ExtractMin() {
      		if (heap.size() > 0) {
      			Node min = heap[0];
      			heap[0] = heap[heap.size()-1];
      			heap.pop_back();
      			heapify(0);
      			return min;
      		}
      		throw std::invalid_argument( "Cannot extract minimum - heap has no elements" );
      	}

      	// returns the value of the top element
      	Node ReadMin() {
      		if (heap.size() > 0) {
      			return heap[0];
      		}
      		throw std::invalid_argument( "Cannot read minimum - heap has no elements" );
      	}

      	void printMinHeap() {
           for (int i=0; i<heap.size(); i++) {
               std::cout << "(" << to_string(heap[i].distance) << ", " << to_string(heap[i].id) << "),  ";
           }
           cout << "" << endl;
        }


        bool propSat() {
            bool answer = true;
            for (int i=1; i<heap.size(); i++) {
                if (heap[i].distance < heap[parent(i)].distance) {
                   answer = false;
                }
            }
            return answer;
        }

        string heapPropertySatisfied() {
            bool answer = propSat();

            if (answer) {
                return "true";
            } else {
                return "false";
            }
        }
};





// exclude rooms that can't be entered without violating social distancing
MinHeap BuildGraph(vector<int> nodes) {

    MinHeap graph;
    
    for (int i=0; i<nodes.size(); i++) {
        int r = nodes[i]; 
        Node v = Node(r)
        v.distance = INT_MAX;
        graph.insert(v);           // = Q.add_with_Priority(v, dist[v])   
    }
    return graph;    
} 


//
//
// int main(int argc,char** argv) {
//   MinHeap minheap;
//   Node n;
//
//   n.distance = 8;  n.id = 8; minheap.insert(n);
//   n.distance = 9;  n.id = 9; minheap.insert(n);
//   n.distance = 10; n.id = 10; minheap.insert(n);
//   n.distance = 1; n.id = 1; minheap.insert(n);
//   n.distance = 4; n.id = 4; minheap.insert(n);
//   n.distance = 5; n.id = 5; minheap.insert(n);
//   n.distance = 3; n.id = 3; minheap.insert(n);
//   n.distance = 2; n.id = 2; minheap.insert(n);
//   n.distance = 6; n.id = 6; minheap.insert(n);
//   n.distance = 7; n.id = 7; minheap.insert(n);
//   n.distance = 11; n.id = 11; minheap.insert(n);
//
//   minheap.printMinHeap();
//   minheap.decreaseKey(8, 3.2);
//   minheap.printMinHeap();
//   minheap.printMinHeap();
//   cout << "insert successful " <<  minheap.heapPropertySatisfied() << endl;
//
//   minheap.ExtractMin();
//   minheap.printMinHeap();
//   cout << "extract min successful " << minheap.heapPropertySatisfied() << endl;
//
//   minheap.ExtractMin();
//   minheap.printMinHeap();
//   cout << "extract min successful " << minheap.heapPropertySatisfied() << endl;
//
//   minheap.ExtractMin();
//   minheap.printMinHeap();
//   cout << "extract min successful " << minheap.heapPropertySatisfied() << endl;
//
//   minheap.heapify(0);
//      minheap.printMinHeap();
//      cout << "heapify successful " << minheap.heapPropertySatisfied() << endl;
//
// }
