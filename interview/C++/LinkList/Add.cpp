#include<iostream>

using namespace std;

struct Node{
	int val;
	Node *next;
};

class LinkList{
   private :
	    Node *head;
   public:
	   LinkList(){
		head = null;	
	   }

	   void addNode(int in){
		Node *node = new Node();
	        node->val = in;
		Node *temp = head;
		while(temp){
			temp = temp->next;
		}
		temp->next = node;
	   }
	
	   void	remove(int in){
		Node *temp = head;
		while(temp){
		  if(temp->val == in){
			
		   }
		}
	   }  

}
