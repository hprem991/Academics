
package studentRecordsBackup.bst;

import studentRecordsBackup.util.FileProcessor;
import studentRecordsBackup.util.Logger;
import studentRecordsBackup.bst.SubjectI;
import studentRecordsBackup.bst.ObserverI;
import studentRecordsBackup.bst.FilterI;

import java.util.ArrayList;


public class Node implements SubjectI, ObserverI {
	
	private int B_number;
	
	Node left;
	Node right;
	FilterI filterType;
	
	
	ArrayList<Node> observerNodes;  // ArrayList as DataStructure
	
	public Node(){ 
		// Default Constructor 
	}

	public Node(int B_numberIn){
		B_number = B_numberIn;
	}
		
	public Node(int B_numberIn, FilterI filterTypeIn){
		B_number = B_numberIn;
		filterType = filterTypeIn;
	}
	
	/********************************************************
	 * 
	 * METHOD NAME : setBNumber
	 * INPUT 	   : integer 
	 * RETURNS	   : void
	 * PURPOSE     : sets the current B Number value
	 *
	 ********************************************************/
	
	public void setBNumber(int B_numberIn){
		B_number = B_numberIn;
	}
	
	/********************************************************
	 * 
	 * METHOD NAME : getBNumber
	 * INPUT 	   : void
	 * RETURNS	   : integer 
	 * PURPOSE     : returns the BNumber of the current Object Node
	 *
	 ********************************************************/
	
	public int getBNumber(){
		 return B_number;
	}
	
	/********************************************************
	 * 
	 * METHOD NAME : addObserver
	 * INPUT 	   : TreeNode as a Node
	 * RETURNS	   : void
	 * PURPOSE     : Adds the observers in the Observers List
	 *
	 ********************************************************/
	
	public void addObserver(Node node){
		if(null == observerNodes)
			observerNodes =  new ArrayList<Node>();
		observerNodes.add(node);
	}

	/********************************************************
	 * 
	 * METHOD NAME : removeObserver
	 * INPUT 	   : TreeNode as a Node
	 * RETURNS	   : void
	 * PURPOSE     : removes the Observer from the Observers list
	 *
	 ********************************************************/
	
    public void removeObserver(Node node){
    	observerNodes.remove(node);
	}
    
	/********************************************************
	 * 
	 * METHOD NAME : notifyObservers
	 * INPUT 	   : integer as an Update Value
	 * RETURNS	   : void
	 * PURPOSE     : Notifies all the Observes with matching filter
	 *
	 ********************************************************/
    
    public void notifyObservers(int UPDATE_VALUE){
		for(int i = 0; i < observerNodes.size();i++){
			Node currentNode = observerNodes.get(i);
			if(currentNode.filterType.filter(UPDATE_VALUE)) {
					currentNode.listen(UPDATE_VALUE);
		    }
		}
	}
    
	/********************************************************
	 * 
	 * METHOD NAME : listen
	 * INPUT 	   : integer as an Update Value
	 * RETURNS	   : void
	 * PURPOSE     : It's an Observer update, which it has received 
	 * 				 from corresponding subject
	 *
	 ********************************************************/
    
    public void listen(int UPDATE_VALUE){
    	if(this.filterType.filter(UPDATE_VALUE)) {
    		this.setBNumber(this.getBNumber() + UPDATE_VALUE);
    	}
    }
    
	/********************************************************
	 * 
	 * METHOD NAME : update
	 * INPUT 	   : integer as an Update Value
	 * RETURNS	   : void
	 * PURPOSE     : This is an Subject's update which increment 
	 * 				 the current BNumber by update value
	 * 				 and notifies it corresoding observers
	 *
	 ********************************************************/
    
    public void update(int UPDATE_VALUE){
    	this.setBNumber(this.getBNumber() + UPDATE_VALUE);
    	notifyObservers(UPDATE_VALUE);
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
		return B_number+","+left+","+right+","+filterType;
	}
}
