#include <iostream>

using namespace std;

struct Node {
    public :
	int data;
	Node *next;				
};

class LinkList {
  public:
	Node* create(int dataIn){
		Node *n = new Node();
		n->data =  dataIn;
		return n;
	}	

	Node *add(Node *head, Node *next){
		head->next = next;
		return head;	
	}
	
	Node *createNode(Node *head, int dataIn){
	   Node *n = create(dataIn);
	   return add(&head, &n);
	} 	
	
	Node *remove(Node *head, Node *node){
	    while(head){
		   if(head->next->data == node->data){
			head->next = head->next->next;
			break; 	
		    }
		}
	    return head;
	}
	
	void printList(Node *head){
		while(head){
	           cout<<head->data<<endl;
		   head = head->next;
		}
	}
};

int main(){
   LinkList *list = new LinkList();
   Node *head = list->create(5);
   head = list->createNode(&head, 4 );
   head = list->createNode(&head, 2 );
   head = list->createNode(&head, 8 );
   head = list->createNode(&head, 7 );
   list->printList(&head);
   return 0;	 
}
