package wordCount.visitors;

import wordCount.treesForStrings.BST;
import wordCount.treesForStrings.Node;

public interface TreeProcessingVisitorI {
	public void visit(BST bst);
	public void traverse(Node node);	
}
