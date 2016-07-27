package wordCount.visitors;

import java.util.Vector;
import java.util.Stack;

import wordCount.treesForStrings.BST;
import wordCount.treesForStrings.Node;
import wordCount.util.FileProcessor;

public class WordCountVisitor implements TreeProcessingVisitorI {

	private int totalWords = 0;
	private Vector<Node> frequentList = new Vector<Node>();
	private String frequentWord;
	private int frequentCount = 0;
	private int charCount = 0;
	private FileProcessor fp = null;
	
	public WordCountVisitor(FileProcessor inFileProcessor){
		fp = inFileProcessor;
	}

	/********************************************************
	 * 
	 * METHOD NAME : visit
	 * INPUT 	   : BST tree
	 * RETURNS	   : void
	 * PURPOSE     : Visit the tree
	 *
	 ********************************************************/
	
	@Override
	public void visit(BST bst) {
		StringBuilder sb = new StringBuilder();
		Node root = bst.getRoot();
		if(null == root){
			sb.append("The total number of words is: " + totalWords + System.getProperty("line.separator") +"The most frequently used word is: NONE");
			sb.append(System.getProperty("line.separator") + "The frequency of the most frequently used word is: " + frequentCount + System.getProperty("line.separator") + "The number of characters (without whitespaces) is: " + charCount);
		} else {
			frequentList.addElement(root);
			frequentCount = root.getCurrentWordCount();
			traverse(root);
			sb.append("The total number of words is: " + totalWords + System.getProperty("line.separator") +"The most frequently used word is: ");
			for(Node n: frequentList){
				sb.append(n.getCurrentWord() + " ");
			}
			sb.append(System.getProperty("line.separator") + "The frequency of the most frequently used word is: " + frequentCount + System.getProperty("line.separator") + "The number of characters (without whitespaces) is: " + charCount);
		}
		fp.writeLineToFile(sb.toString());
	}

	/********************************************************
	 * 
	 * METHOD NAME : traverse
	 * INPUT 	   : Node node
	 * RETURNS	   : void
	 * PURPOSE     : traverse the tree
	 *
	 ********************************************************/
	@Override
	public void traverse(Node node) {
		if(node.left != null){
			traverse(node.left);
		}
		totalWords += 1*node.getCurrentWordCount();
		charCount += node.getCurrentWord().length()*node.getCurrentWordCount();
		if(frequentCount == node.getCurrentWordCount()){
			if(!frequentList.contains(node)){
				frequentList.addElement(node);
			}
		}
		else if(frequentCount < node.getCurrentWordCount()){
			frequentCount = node.getCurrentWordCount();
			frequentList.removeAllElements();
			frequentList.addElement(node);
		}
		if(node.right != null){
			traverse(node.right);
		}
	}
	/********************************************************
	 * 
	 * METHOD NAME : toString
	 * INPUT 	   : void
	 * RETURNS	   : String
	 * PURPOSE     : Stringify the data members
	 *
	 ********************************************************/

	public String toString(){
		return frequentWord + totalWords;
	}
}
