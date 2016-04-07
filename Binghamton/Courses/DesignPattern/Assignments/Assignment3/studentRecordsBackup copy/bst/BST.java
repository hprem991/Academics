
package studentRecordsBackup.bst;

import studentRecordsBackup.util.BSTBuilder;
import studentRecordsBackup.util.FileProcessor;
import studentRecordsBackup.util.Logger;

/*
import Node;
import ObserverI;
import SubjectI; 
*/

public class BST {
	private Node root;//  backup_1, backup_2; This is a correspondence but maintain at tree level 
	private Filter filterType;
	public BST(Filter filterIn){
		//root = new Node();
		filterType = filterIn;
	}
		
	// Helpers 
	
	private Node insertInternal(Node root, Node node){
		if(null == root) {
			return node;
		} else if(root.getBNumber() < node.getBNumber()){
			if(root.right == null)
				root.right = insertInternal(root.right, node);
			else 
				 insertInternal(root.right, node);
		} else if(root.getBNumber() > node.getBNumber()){
			if(root.left == null) 
				root.left = insertInternal(root.left, node);
			else
				 insertInternal(root.left, node);
		}
		return root;
	}
	
	private Node findNode(Node root, Node node){
		if (null == root){
			return root;
		} else if(root.getBNumber() == node.getBNumber()){
			return root;
		} else if(root.getBNumber() < node.getBNumber()){
			return findNode(root.right, node);
		} else if(root.getBNumber() > node.getBNumber()){
			return  findNode(root.left, node);
		}
		return root;
	}
	
	private Node findMin(Node root){
	    if(root.equals(null)){
	    	return root;
	    } else {
	    	return findMin(root.left);
	    }
	}
	
	private Node inOrderSuccessor(Node node){
		if(!node.left.equals(null)){
			return findMin(node.right);
		} else {
			return findNode(root, node);
		}
	}
	
	private void printInorder(Node node){
		if(null == node)
			return;
		else {
				printInorder(node.left);
				System.out.println(node.getBNumber());
				printInorder(node.right);
		     }
	}
	
	private void updateHelper(Node node, int UPDATE_VALUE){
		if(null == node){
			 return;
		} else {
			 node.update(UPDATE_VALUE);
			 updateHelper(node.left, UPDATE_VALUE);
			 updateHelper(node.right, UPDATE_VALUE);
		}
	}
	
	private int calculateSum(Node node, int sum){
		int total = sum;
		if(null == node)
			return 0;
		else{
			total = calculateSum(node.left, total);
			total += node.getBNumber();
			total = calculateSum(node.right, total);
		    }
		return total;
	}
	
	public void printTree(){
		printInorder(root);
	}
	
	public void getSum(){
		 System.out.println("The sum of all the B-Numbers is: "+ calculateSum(root, 0));
	}
	
	public void insert(Node node){
		if(filterType.filter(node)) 
			root = insertInternal(root, node);
	}
	
	public void update(int UPDATE_VALUE){
		
		// Lets put the functionality later
		updateHelper(root, UPDATE_VALUE);
	}
	
	void deleteNode(Node node){
		Node parent = findNode(root, node);
		if(!parent.equals(null)){
			if((node.left.equals(null) && node.left.equals(null))){ // both children are null
				if(parent.left.equals(node)){
					parent.left = null;
				} else {
					parent.right = null;
				}
			} else if((node.left.equals(null) || node.left.equals(null))){ // either one is null
				if(node.left.equals(null)){
					if(parent.left.equals(node)){
						parent.left = node.right;
					} else {
						parent.right = node.left;
					}
				} else {
					if(parent.left.equals(node)){
						parent.left = node.right;
					} else {
						parent.right = node.left;
					}
				}
			} else { // none of children is null
				Node inOrderSucc = inOrderSuccessor(node);
				node.setBNumber(inOrderSucc.getBNumber());
				deleteNode(inOrderSucc);
			}
		}
		//removeNode(node);
		//notifyObservers();// Controvorsial
		// Lets put the functionality later
	}
}
