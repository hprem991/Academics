package studentRecordsBackup.util;

import studentRecordsBackup.util.Logger.DebugLevel;
import studentRecordsBackup.bst.BST;
import studentRecordsBackup.bst.Node;
import studentRecordsBackup.bst.FilterI;
import studentRecordsBackup.bst.EvenFilter;
import studentRecordsBackup.bst.OddFilter;
import studentRecordsBackup.bst.SubjectI;
import studentRecordsBackup.bst.ObserverI;


public class BSTBuilder implements BSTWorkshopInterface {

	private FileProcessor proc;

	public BSTBuilder(){
		// Default Constructor
	}

	public BSTBuilder(String fileName){
		proc = new FileProcessor(fileName);	
	}

	/********************************************************
	 * 
	 * METHOD NAME : construct
	 * INPUT 	   : BST mainTree, BST backUpTree 1 and 
	 * 				 BST backUpTree 2 
	 * RETURNS	   : void
	 * PURPOSE     : Read the file Content and Construct BST trees
	 *
	 ********************************************************/
	
	public void construct(BST treeIn, BST backup_1, BST backup_2){
		try {
			String line = "";
			while((line = proc.readLineFromFile()) != null) {
				String parse[] = line.split("\\s+");
				int nodeVal = Integer.parseInt(parse[0]);
				
				Node  mainNode, backupNode_1, backupNode_2;

				mainNode = new Node(nodeVal, null);
				backupNode_1 = new Node(nodeVal, new EvenFilter());
				backupNode_2 = new Node(nodeVal, new OddFilter());

				mainNode.addObserver(backupNode_1);
				mainNode.addObserver(backupNode_2);

				treeIn.insert(mainNode);
				backup_1.insert(backupNode_1);
				backup_2.insert(backupNode_2);			
			}
		} catch(Exception e){
			Logger.writeMessage("Exception builder construct "+e.getMessage(),
								 DebugLevel.RESULT);
		} finally{
			// Nothing to Free here
		}
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
		return proc.toString();
	}
}
