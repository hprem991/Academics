package wordCount.driver;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintStream;

import wordCount.treesForStrings.BST;
import wordCount.util.FileProcessor;
import wordCount.util.Logger;
import wordCount.util.Logger.DebugLevel;
import wordCount.visitors.PopulateTreeVisitor;
import wordCount.visitors.TreeProcessingVisitorI;
import wordCount.visitors.WordCountVisitor;
import wordCount.visitors.grepVisitor;

public class Driver {
	
	/********************************************************
	 * 
	 * METHOD NAME : validate
	 * INPUT 	   : String as a fileName, 
	 * RETURNS	   : boolean
	 * PURPOSE     : To Validate if the input values are compatible
	 * @throws IOException 
	 *
	 ********************************************************/

	public static boolean validate(String fileName, String outFileName) throws IOException 
	{
		File file = new File(fileName);
		File oFile = new File(outFileName);
		oFile.createNewFile();
		boolean validateFlag = true;

		if(!(file.isFile() && file.exists() && file.canRead())) {
			validateFlag = false;
			Logger.writeOutput("Invalid Input file ");
		}
		
		if(!(oFile.isFile() && oFile.exists() && oFile.canWrite())){
			validateFlag = false;
			Logger.writeOutput("Invalid Output file ");
		}
		oFile.delete();
		return validateFlag;		
	}


	public static void main(String args[]){
		
		Logger.setDebugValue(2);
		FileProcessor fp = null;
				
		try {
			System.out.println("Here "+args.length);
			if(4 == args.length) {		
				//Input file name
				String fileName = args[0];
												
				//Output file name
				String outFile = args[1];
				
				//Number of Iterations
				int numIterations = Integer.parseInt(args[2]);
								
				//Word to be searched
				String searchString = args[3];
								
				if(validate(fileName, outFile)) {
					fp = new FileProcessor(fileName, outFile);
					
					long startTime = System.currentTimeMillis();
					
					BST tree = new BST("MAIN");
					for(int i=0; i < 1; i++){
						
						//BST tree = new BST("MAIN");
						TreeProcessingVisitorI v1 = new PopulateTreeVisitor(fp);
						TreeProcessingVisitorI v2 = new WordCountVisitor(fp);
						TreeProcessingVisitorI v3 = new grepVisitor(searchString, fp);
						tree.accept(v1);
						tree.accept(v2);
						tree.accept(v3);
						fp.reset();
					}
					
					tree.printInorder();
					long finishTime = System.currentTimeMillis();
					System.out.println((finishTime - startTime)/numIterations);
					fp.close();
					//Logger.writeMessage("The search value is  "+tree.Search("Check").getCurrentWordCount(),
			 			// 			     DebugLevel.RESULT);
				}
			} else {
			Logger.writeOutput("Validation Failed, Incorrect Input params!!");	
			}
		} catch (Exception e){
			Logger.writeOutput("Invalid Argument "+e.getMessage());
			e.printStackTrace();
		} finally {
		 fp.close();	
		}
	}
}
