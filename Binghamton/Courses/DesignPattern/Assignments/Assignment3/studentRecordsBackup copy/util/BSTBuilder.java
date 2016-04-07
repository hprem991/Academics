//import

package studentRecordsBackup.util;
import studentRecordsBackup.bst.BST;
import studentRecordsBackup.bst.Node;

public class BSTBuilder implements BSTWorkshopInterface {

	private FileProcessor proc;
	
	public BSTBuilder(){
		// Default Constructor
	}

	public BSTBuilder(String fileName){
		proc = new FileProcessor(fileName);	
	}
	
	public BSTBuilder(BST mainTree, BST backup_tree_1, BST backup_tree_2, String fileName){
		proc = new FileProcessor(fileName);	
		mainTree = new BST();
		backup_tree_1 = new BST();
		backup_tree_2 = new BST();		
	}

	public void addFilter(BST tree){
		
	}
	
	
	
	public void construct(BST treeIn, BST backup_1, BST backup_2){
		String line = "";
	//	System.out.println(" READING  ");
		while((line = proc.readLineFromFile()) != null) {
			String parse[] = line.split("\\s+");
			int nodeVal = Integer.parseInt(parse[0]);
			Node  mainNode, backupNode_1, backupNode_2;
			//mainNode = backupNode_1 = backupNode_2 = null;
		    
			/*
			if(parse.length > 1 && !parse[1].isEmpty()) {
				mainNode = new Node(nodeVal,parse[1]); // if Description is provided
			    backupNode_1 = new Node(nodeVal,parse[1]);
			    backupNode_2 = new Node(nodeVal,parse[1]);
			} else { 
				mainNode = new Node(nodeVal,"");
				backupNode_1 = new Node(nodeVal,"");
				backupNode_2 = new Node(nodeVal,"");
			} */	
			
			mainNode = new Node(nodeVal);
			backupNode_1 = new Node(nodeVal);
			backupNode_2 = new Node(nodeVal);
			
			mainNode.addObserver(backupNode_1);
			mainNode.addObserver(backupNode_2);
			
			treeIn.insert(mainNode);
			backup_1.insert(backupNode_1);
			backup_2.insert(backupNode_2);
			
			// Observer Configuration
			
			//backupNode_1.addNode();
			//backupNode_2.addNode();
		}
		System.out.println(" READING DONE  ");
	}
}
