


package studentRecordsBackup.driver;

import java.io.File;
import studentRecordsBackup.bst.BST;
import studentRecordsBackup.bst.Node;
import studentRecordsBackup.util.BSTBuilder;
import studentRecordsBackup.util.FileProcessor;
import studentRecordsBackup.util.Logger;
//import studentRecordsBackup.util.;

public class Driver {


	public static boolean validate(String fileName, 
								    int NUM_THREADS, 
								    int DEBUG_VALUE) 
	{
		File file = new File(fileName);
		boolean validateFlag = true;

		Logger.setDebugValue(DEBUG_VALUE);

		if((DEBUG_VALUE < 0) && (DEBUG_VALUE > 4)){
			validateFlag = false;
			Logger.writeOutput("Out of range Debug Value ");
		} // No else part, using writeOutput for failures messages

		if((NUM_THREADS < 1) && (NUM_THREADS > 5)){
			validateFlag = false;
			Logger.writeOutput("Out of range Number of Threads ");
		}

		if(!(file.isFile() && file.exists() && file.canRead())) {
			validateFlag = false;
			Logger.writeOutput("Invalid Input file ");
		}		
		return validateFlag;
	}


	public static void main(String args[]){
		System.out.println("\n The args length is: " + args.length);

		System.out.println("\n The fileName is: " + args[0]);
		System.out.println("\n The NUM_THREADS is: " + args[1]);
		System.out.println("\n The DEBUG_VALUE is: " + args[2]);

		try {
			System.out.println("Inside Try "+args.length);
			if(args.length >= 0) { // Discuss this check		
				String fileName = args[0];
				int UPDATE_VALUE = Integer.parseInt(args[1]);
				//int DEBUG_VALUE = Integer.parseInt(args[2]);
				System.out.println("Inside Args Passed");
				
				if(validate(fileName, 2, 3)) { // TBchanged
					System.out.println("Validation Passed");
					BST mainTree = new BST();
					BST backup_1 = new BST();
					BST backup_2 = new BST();
					
					// Instantiate Objects
					//FileProcessor proc = new FileProcessor(args[0]);
					// BST mainTree = new BST();
					// BST backUp_1 = new BST();
					// BST backUp_2 = new BST();

					System.out.println("builder Before ");
					
					BSTBuilder builder = new BSTBuilder(fileName);
					builder.construct();
					BSTBuilder builder = new BSTBuilder(mainTree, backup_1, backup_2, fileName);
					/* mainTree = builder.create();
					   backup_1 = builder.create();
					   backup_2 = builder.create();*/
					//BSTBuilder builder = new BSTBuilder(mainTree, backup_1, backup_2, fileName);

					System.out.println("builder Before Read ");
					builder.construct(mainTree, backup_1, backup_2);
					System.out.println("Printing Main Tree");
					mainTree.printTree();
					System.out.println("Printing BackUp 1 Tree");
					backup_1.printTree();
					System.out.println("Printing BackUp 2 Tree");
					backup_2.printTree();

					// Sum

					mainTree.getSum();
					backup_1.getSum();
					backup_2.getSum();
					
					System.out.println("Updating Node");
					
					mainTree.update(UPDATE_VALUE);
					//backup_1.update(UPDATE_VALUE); This update has to be taken place using observer
					//backup_2.update(UPDATE_VALUE); This update has to be taken place using observer
					
					
					
					mainTree.getSum();
					backup_1.getSum();
					backup_2.getSum();
					
	

					//mainTree.update(UPDATE_VALUE);



				}
			} else {
				System.out.println("Validation Failed");
				//Logger.writeOutput("Incorrect Input paramentes !!!");	
			}
		} catch (Exception e){
			//Logger.writeOutput("Invalid Argument "+e.getMessage());
		} finally {
			// Nothing to release here 
		}
	}
}
