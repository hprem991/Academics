package wordCount.visitors;

import wordCount.treesForStrings.BST;
import wordCount.util.FileProcessor;
import wordCount.treesForStrings.Node;

public class grepVisitor implements TreeProcessingVisitorI {

	String word;
	int count = 0;
	Node node = null;
	FileProcessor fp;
	
	public grepVisitor(String inWord, FileProcessor inFileProcessor){
		word = inWord;
		fp = inFileProcessor;
	}
	
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
}