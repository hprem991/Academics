package wordCount.visitors;

import java.util.Vector;

import wordCount.treesForStrings.BST;
import wordCount.treesForStrings.Node;
import wordCount.util.FileProcessor;

public class WordCountVisitor implements TreeProcessingVisitorI {
	
	int totalWords = 0;
	Vector<Node> frequentList = new Vector<Node>();
	String frequentWord;
	int frequentCount = 0;
	int charCount = 0;
	FileProcessor fp = null;
	Node frequentNode;

	public WordCountVisitor(FileProcessor inFileProcessor){
		fp = inFileProcessor;
	}
	
	@Override
	public void visit(BST bst) {
		StringBuilder sb = new StringBuilder();
		Node root = bst.getRoot();
		frequentList.addElement(root);
		frequentCount = root.getCurrentWordCount();
		traverse(root);
		sb.append("The total number of words is: " + totalWords + System.getProperty("line.separator") +"The most frequently used word is: ");
		for(Node n: frequentList){
			sb.append(n.getCurrentWord() + " ");
		}
		sb.append(System.getProperty("line.separator") + "The frequency of the most frequently used word is: " + frequentCount + System.getProperty("line.separator") + "The number of characters (without whitespaces) is: " + charCount);
		fp.writeLineToFile(sb.toString());
	}

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
}
