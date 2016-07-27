
package wordCount.treesForStrings;

public class Node {
	private int wordCount;
	//private String maxOccurancesWord;
	private String  currentWord;
	private int maxOccurances;
	private int height;
	
	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public Node left, right;
	
	
	public void Node(){
		wordCount =  maxOccurances = 0;
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
