#include "DFS_Implementation.h"


DFS::DFS(int countIn){
   this->count = countIn;
   adj = new list<int>[countIn];
}

void  DFS::fill(int src, int dst){
	adj[src].push_back(dst);
}


void DFS::DFS_Call(int val){
      bool *visited = new bool[this->count];
      for(int i = 0 ;i < this->count ; i++){
		visited[i] = false;
      }
	
      DFS_Util(val, visited);	
}

void DFS::DFS_Util(int node, bool visited[]){
	visited[node] = true;
	cout<<" Visited "<<node<<endl;
	
	list<int>::iterator iter;
	for(iter = adj[node].begin();iter != adj[node].end();iter++){
		if(!visited[*iter]){
			DFS_Util(*iter, visited);
		}
	}
}


