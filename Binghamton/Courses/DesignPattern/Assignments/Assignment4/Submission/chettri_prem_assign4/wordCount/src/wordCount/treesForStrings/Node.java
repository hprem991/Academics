
package wordCount.treesForStrings;

public class Node {
	private int wordCount;
	private String  currentWord;

	public Node left, right;
	
	
	public void Node(){
		wordCount =  0;
		currentWord = "";
	}

	public Node(String word){
		currentWord = word;
	}
	
	public int getCurrentWordCount(){
		return wordCount;
	}
	
	public String getCurrentWord(){
		return currentWord;
	}
	
	public void setCurrentWord(String word){
		 currentWord = word;
	}
	
	public void setCurrentWordCount(int count){
		wordCount = count;
	}
}
