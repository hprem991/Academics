#include <iostream>
#include <list>
using namespace std;

class DFS {
	private :
		int count;
		list<int> *adj; //adjacency list
		void DFS_Util(int val, bool visited[]); 
	public :
		DFS(int count);
		void fill(int src, int dst);
		void DFS_Call(int count);	
};

