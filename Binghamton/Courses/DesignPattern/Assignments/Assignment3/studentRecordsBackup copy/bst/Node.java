
package studentRecordsBackup.bst;

import studentRecordsBackup.util.FileProcessor;
import studentRecordsBackup.util.Logger;
import studentRecordsBackup.bst.SubjectI;
import studentRecordsBackup.bst.ObserverI;

import java.util.ArrayList;


public class Node implements SubjectI, ObserverI {
	
	//private String description; --> depricated member
	private int B_number;
	Node left;
	Node right;
	
	ArrayList<Node> observerNodes;  // Using as a data structure
	
	public Node(){
		// Default Constructor 
		observerNodes = new ArrayList<Node>();
	}

	public Node(int B_numberIn){
		B_number = B_numberIn;
	}
		
	// Implementing Interface
	
	public void addObserver(Node node){
		System.out.println("Adding Observer Node "+node.getBNumber());
		if(null == observerNodes)
			observerNodes =  new ArrayList<Node>();
		observerNodes.add(node);
	}
	
    public void removeObserver(Node node){
    	observerNodes.remove(node);
	}
    
    public void notifyObservers(int UPDATE_VALUE){
		for(int i = 0; i < observerNodes.size();i++){
			observerNodes.get(i).listen(UPDATE_VALUE);
			System.out.println(" After Notify "+observerNodes.get(i).getBNumber());
		}
	}
    
    public void listen(int UPDATE_VALUE){
    	System.out.println(" Listen Invoked "+this.getBNumber()+" Update Val "+UPDATE_VALUE);
    	this.setBNumber(this.getBNumber() + UPDATE_VALUE);
    	System.out.println(" Listen Invoked "+this.getBNumber());
    }
    
    public void update(int UPDATE_VALUE){
    	System.out.println(" Update Invoked ");
    	this.setBNumber(this.getBNumber() + UPDATE_VALUE);
    	notifyObservers(UPDATE_VALUE);
    }
    
	public void setBNumber(int B_numberIn){
		B_number = B_numberIn;
	}
	
	public void setFields(int B_numberIN){
		setBNumber(B_numberIN);
	}
	
	public int getBNumber(){
		 return B_number;
	}
	
	public String toString(){
		return Integer.toString(B_number);
	}
}
