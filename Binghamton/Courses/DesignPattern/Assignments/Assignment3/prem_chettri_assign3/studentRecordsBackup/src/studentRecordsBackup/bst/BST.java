
package studentRecordsBackup.bst;

import studentRecordsBackup.util.BSTBuilder;
import studentRecordsBackup.util.FileProcessor;
import studentRecordsBackup.util.Logger;
import studentRecordsBackup.util.Logger.DebugLevel;

public class BST {
	private Node root;
	private String treeType; 

	public BST() {
		// Default Constructor
	}

	public BST(String treeTypeIn){ 
		treeType = treeTypeIn;
	}

	/********************************************************
	 * 
	 * METHOD NAME : getType
	 * INPUT 	   : void
	 * RETURNS	   : Typeof the Tree
	 * PURPOSE     : getter for the name Tree Type
	 *
	 ********************************************************/
	
	public String getType(){
		return treeType;
	}

	/********************************************************
	 * 
	 * METHOD NAME : insertInternal
	 * INPUT 	   : TreeNode root and Internal Node
	 * RETURNS	   : Node
	 * PURPOSE     : Insert a node in a BST
	 *
	 ********************************************************/
	
	private Node insertInternal(Node root, Node node){
		if(null == root) {
			return node;
		} else if(root.getBNumber() < node.getBNumber()) {
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

	/********************************************************
	 * 
	 * METHOD NAME : findNode
	 * INPUT 	   : TreeNode root and Internal Node
	 * RETURNS	   : Node
	 * PURPOSE     : Find a Node in a tree
	 *
	 ********************************************************/
	
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

	/********************************************************
	 * 
	 * METHOD NAME : findMin
	 * INPUT 	   : TreeNode node
	 * RETURNS	   : Node
	 * PURPOSE     : Find the node with minumum value
	 *
	 ********************************************************/
	
	private Node findMin(Node root){
		if(null == root){
			return root;
		} else {
			return findMin(root.left);
		}
	}

	/********************************************************
	 * 
	 * METHOD NAME : findMax
	 * INPUT 	   : TreeNode node
	 * RETURNS	   : Node
	 * PURPOSE     : Find the node with Maximum value
	 *
	 ********************************************************/
	
	private Node findMax(Node root){
		while(null != root.right)
			root = root.right;   
		return root;
	}

	/********************************************************
	 * 
	 * METHOD NAME : inOrderSuccessor
	 * INPUT 	   : TreeNode node
	 * RETURNS	   : Node
	 * PURPOSE     : Find the inOrder successor of a Node
	 *
	 ********************************************************/
	
	private Node inOrderSuccessor(Node node){
		if(!node.left.equals(null)){
			return findMin(node.right);
		} else {
			return findNode(root, node);
		}
	}

	/********************************************************
	 * 
	 * METHOD NAME : printInorder
	 * INPUT 	   : TreeNode Node
	 * RETURNS	   : void
	 * PURPOSE     : Print the BST in inOrder way
	 *
	 ********************************************************/
	
	private void printTree(Node node){
		if(null == node)
			return;
		else {
			printTree(node.left);
			Logger.writeMessage(""+node.getBNumber(),
								DebugLevel.RESULT);
			printTree(node.right);
		}
	}

	/********************************************************
	 * 
	 * METHOD NAME : updateHelper
	 * INPUT 	   : TreeNode node and intter updateValue
	 * RETURNS	   : void
	 * PURPOSE     : To help update the node Value
	 *
	 ********************************************************/
	
	private void updateHelper(Node node, int UPDATE_VALUE){
		if(null == node){
			return;
		} else {
			node.update(UPDATE_VALUE);
			updateHelper(node.left, UPDATE_VALUE);
			updateHelper(node.right, UPDATE_VALUE);
		}
	}


	/********************************************************
	 * 
	 * METHOD NAME : updateMaxNode
	 * INPUT 	   : integer as update value
	 * RETURNS	   : void
	 * PURPOSE     : Update the BST tree B Number
	 *
	 ********************************************************/
	
	private void updateMaxNode(int UPDATE_VALUE){
		Node node = findMax(root);
		node.update(UPDATE_VALUE);
	}

	/********************************************************
	 * 
	 * METHOD NAME : calculateSum
	 * INPUT 	   : TreeNode node
	 * RETURNS	   : integer
	 * PURPOSE     : Calculate the sum of the B-Numbers
	 *
	 ********************************************************/
	
	private int calculateSum(Node node){
		int total, left, right;
		if(null == node)
			return 0;
		else{
			left = calculateSum(node.left);
			right = calculateSum(node.right);
			total = node.getBNumber() + left + right;
			return total;
		}
	}

	/********************************************************
	 * 
	 * METHOD NAME : printTree
	 * INPUT 	   : void
	 * RETURNS	   : void
	 * PURPOSE     : Calls inOrder traversal BST Tree print
	 *
	 ********************************************************/
	
	public void printInorder(){
		printTree(root);
	}

	/********************************************************
	 * 
	 * METHOD NAME : getSum
	 * INPUT 	   : void
	 * RETURNS	   : void
	 * PURPOSE     : Calls helper to calculate the Sum of BNumber
	 *
	 ********************************************************/
	
	public int printBSum(){
	/********************************************************
	 * NOT SURE IF IT MEANT TO BE IN HERE
	 *********************************************************
	 Logger.writeMessage("The sum of all the B-Numbers is "
						 +calculateSum(root),
		 			 	 DebugLevel.RESULT);
	 ********************************************************/
		return calculateSum(root);
	}

	/********************************************************
	 * 
	 * METHOD NAME : insert
	 * INPUT 	   : TreeNode node
	 * RETURNS	   : void
	 * PURPOSE     : Inserts the node to a BST
	 *
	 ********************************************************/
	
	public void insert(Node node){
		/******************************************************
		 *  FOLLOWING CHECK IS UNDER CONFUSION IF WE SHOULD 
		 *  ADD ALL INTEGER OR SEGREGATE USING FILTER
		 ***************************************************
		if((null == node.filterType) || 
			node.filterType.filter(node.getBNumber())) {
		 ********************************************************/
			root = insertInternal(root, node);
		 /**************************************************	
		  * }
		  *********************************/
	}

	/********************************************************
	 * 
	 * METHOD NAME : update
	 * INPUT 	   : integer as the update value
	 * RETURNS	   : void
	 * PURPOSE     : Updates the tree using the input value
	 *
	 ********************************************************/
	
	public void update(int UPDATE_VALUE){
		updateHelper(root, UPDATE_VALUE);
		updateMaxNode(UPDATE_VALUE);
	}

	/********************************************************
	 * 
	 * METHOD NAME : deleteNode
	 * INPUT 	   : TreeNode node
	 * RETURNS	   : void
	 * PURPOSE     : Deletes the node from a given BST
	 *
	 ********************************************************/
	

	public void deleteNode(Node node){
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
	}

	/********************************************************
	 * 
	 * METHOD NAME : toString
	 * INPUT 	   : void
	 * RETURNS	   : String
	 * PURPOSE     : Stringify the data members
	 *
	 ********************************************************/
	
	@Override
	public String toString(){
		return root+","+treeType;
	}
}
