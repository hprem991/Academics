package wordCount.visitors;

import wordCount.treesForStrings.BST;
import wordCount.util.FileProcessor;
import wordCount.treesForStrings.Node;

public class grepVisitor implements TreeProcessingVisitorI {

	private String word;
	private int count = 0;
	private Node node = null;
	private FileProcessor fp;
	
	/********************************************************
	 * 
	 * METHOD NAME : grepVisitor
	 * INPUT 	   : String as a word and  a fileProcessor
	 * RETURNS	   : grepVisitor Object
	 * PURPOSE     : Stringify the data members
	 *
	 ********************************************************/
	
	public grepVisitor(String inWord, FileProcessor inFileProcessor){
		word = inWord;
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
		node = bst.Search(word);
		StringBuilder sb = new StringBuilder();
		if(node == null){
			sb.append("The word " + word + " does not exist");
		}
		else{
			count = node.getCurrentWordCount();
			sb.append("The word " + word + " occurs the following times: " + count);
		}
		fp.writeLineToFile(sb.toString());
	}
	
	@Override
	public void traverse(Node node) {
			
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
		return word + count;
	}
}