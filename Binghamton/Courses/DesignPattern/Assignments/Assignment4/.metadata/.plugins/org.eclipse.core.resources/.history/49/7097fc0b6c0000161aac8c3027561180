package studentRecordsBackup.driver;

import java.io.File;
import studentRecordsBackup.bst.BST;
import studentRecordsBackup.bst.Node;
import studentRecordsBackup.util.BSTBuilder;
import studentRecordsBackup.util.FileProcessor;
import studentRecordsBackup.util.Logger;
import studentRecordsBackup.util.Logger.DebugLevel;
import studentRecordsBackup.util.BSTWorkshopInterface;

public class Driver {
	
	/********************************************************
	 * 
	 * METHOD NAME : validate
	 * INPUT 	   : String as a fileName, 
	 * RETURNS	   : boolean
	 * PURPOSE     : To Validate if the input values are compatiable
	 *
	 ********************************************************/

	public static boolean validate(String fileName) 
	{
		File file = new File(fileName);
		boolean validateFlag = true;

		if(!(file.isFile() && file.exists() && file.canRead())) {
			validateFlag = false;
			Logger.writeOutput("Invalid Input file ");
		}		
		return validateFlag;
	}


	public static void main(String args[]){
		
		Logger.setDebugValue(2); 
		
		try {
			if(2 == args.length) {		
				String fileName = args[0];
				int UPDATE_VALUE = Integer.parseInt(args[1]);
				
				if(validate(fileName)) {
					BST mainTree = new BST("MAIN");
					BST backup_1 = new BST("BACKUP");
					BST backup_2 = new BST("BACKUP");
					
					BSTWorkshopInterface builder = new BSTBuilder(fileName);
					builder.construct(mainTree, backup_1, backup_2);
					
					Logger.writeMessage("Printing Main Tree",
										 DebugLevel.RESULT);
					mainTree.printInorder();
					
					Logger.writeMessage("Printing BackUp 1 Tree",
										 DebugLevel.RESULT);

					backup_1.printInorder();
					
					Logger.writeMessage("Printing BackUp 2 Tree",
							 DebugLevel.RESULT);

					backup_2.printInorder();

					/*****************************************************
					 * NOT SURE SUM IS CUMILATIVE OR INDIVIDUAL
					 * SO DEMOSTRATING BOTH AND PRINTING CUMILATIVE VALUE
					 *****************************************************/
					int total = mainTree.printBSum() +
								backup_1.printBSum() +
								backup_2.printBSum();
					
				    Logger.writeMessage("The sum of all the B-Numbers is "
						  				+total,
				 			 			 DebugLevel.RESULT);
					
					Logger.writeMessage("Updating Node",
	 			 			 			 DebugLevel.RESULT);
					
					mainTree.update(UPDATE_VALUE);
					total = mainTree.printBSum() +
							backup_1.printBSum() +
							backup_2.printBSum();
				
					Logger.writeMessage("The sum of all the B-Numbers is "
						  			   +total,
			 			 			    DebugLevel.RESULT);

				}
			} else {
			Logger.writeOutput("Validation Failed, Incorrect Input params!!");	
			}
		} catch (Exception e){
			Logger.writeOutput("Invalid Argument "+e.getMessage());
		} finally {
			// Nothing to release here 
		}
	}
}
