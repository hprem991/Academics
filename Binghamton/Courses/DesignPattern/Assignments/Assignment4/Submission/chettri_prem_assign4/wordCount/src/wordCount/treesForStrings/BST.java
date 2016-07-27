
package wordCount.treesForStrings;

import wordCount.util.Logger;
import wordCount.util.Logger.DebugLevel;
import wordCount.visitors.TreeProcessingVisitorI;

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
	 * METHOD NAME : insertInternal
	 * INPUT 	   : TreeNode root and Internal Node
	 * RETURNS	   : Node
	 * PURPOSE     : Insert a node in a BST
	 *
	 ********************************************************/
	
	private Node insertNode(Node root, Node node){
		if(null == root) {
				node.setCurrentWordCount(1);
				return node;
		   }
		
		Node temp = root;
		
		while(null != temp){
			int diff = temp.getCurrentWord().compareTo(node.getCurrentWord());
			if(0 == diff){
				temp.setCurrentWordCount(temp.getCurrentWordCount() + 1);
				temp = null;
			} else if (diff > 0){
				if(null == temp.left){
					temp.left = node;
				} else {
					temp =  temp.left;
				}
			} else {
				if(null == temp.right){
					temp.right = node;
				} else {
					temp = temp.right;
				}
			}
		}
		return root;
	}

	/********************************************************
	 * 
	 * METHOD NAME : search
	 * INPUT 	   : TreeNode node
	 * RETURNS	   : Node	
	 * PURPOSE     : Find the node with minimum value
	 *
	 ********************************************************/
	
	public Node Search(String word){
		if(null == root){
			return null;
		}
		Node temp = root;
		while(null != temp) {
			int diff = temp.getCurrentWord().compareTo(word);
			if(0 == diff){
				return temp;
			} else if (diff > 0) {
				if(null == temp.left)
					return null;
				else 
					temp = temp.left;
			} else {
				if(null == temp.right)
					return null;
				else 
					temp = temp.right;
				}
			}
		 return temp;
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
			Logger.writeMessage(""+node.getCurrentWord() +" "+node.getCurrentWordCount(),
								DebugLevel.RESULT);
			printTree(node.right);
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
	 * METHOD NAME : insert
	 * INPUT 	   : TreeNode node
	 * RETURNS	   : void
	 * PURPOSE     : Inserts the node to a BST
	 *
	 ********************************************************/

	public void insert(Node node){
			root = insertNode(root, node);
	}

	/********************************************************
	 * 
	 * METHOD NAME : accept
	 * INPUT       : Visitor
	 * RETURNS     : void
	 * PURPOSE     : Allows the the visitor to make changes to this object
	 * 
	 ********************************************************/
	
	public void accept(TreeProcessingVisitorI visitor){
		visitor.visit(this);
	}

	/********************************************************
	 * 
	 * METHOD NAME : getRoot
	 * INPUT       : void
	 * RETURNS     : Node root
	 * PURPOSE     : Retrieve the root node
	 * 
	 ********************************************************/
	public Node getRoot(){
		return root;
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
