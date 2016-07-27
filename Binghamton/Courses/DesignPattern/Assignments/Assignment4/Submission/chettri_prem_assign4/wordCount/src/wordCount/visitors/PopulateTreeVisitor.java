package wordCount.visitors;

import java.util.regex.Pattern;

import wordCount.treesForStrings.BST;
import wordCount.treesForStrings.Node;
import wordCount.util.FileProcessor;

public class PopulateTreeVisitor implements TreeProcessingVisitorI {
	
	private FileProcessor fp = null;
	
	public PopulateTreeVisitor(FileProcessor fileP){
		fp = fileP;
	}

	/********************************************************
	 * 
	 * METHOD NAME : visit
	 * INPUT 	   : BST tree
	 * RETURNS	   : void
	 * PURPOSE     : Visit the tree
	 *
	 ********************************************************/
	
	public void visit(BST bst) {
		String line;
		line = fp.readLineFromFile();
		Pattern pattern = Pattern.compile("\\s+");
		while(line != null){
			for(String word: pattern.split(line, 0)){
				if(word.length() > 0){
					Node node = new Node(word);
					bst.insert(node);
				}
			}
			line = fp.readLineFromFile();
		}
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
		return fp.toString();
	}
}
