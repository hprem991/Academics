#include "DFS_Implementation.h"

int main()
{
    // Create a graph given in the above diagram
    DFS g(4);
    g.fill(0, 1);
    g.fill(0, 2);
    g.fill(1, 2);
    g.fill(2, 0);
    g.fill(2, 3);
    g.fill(3, 3);
 
    cout << "Following is Depth First Traversal (starting from vertex 2) \n";
    g.DFS_Call(2);
 
    return 0;
}
