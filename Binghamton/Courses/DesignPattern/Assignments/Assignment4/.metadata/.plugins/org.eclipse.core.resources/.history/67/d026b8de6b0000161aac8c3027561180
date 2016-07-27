
package studentRecordsBackup.util;

import studentRecordsBackup.bst.BST;
import studentRecordsBackup.bst.Node;


import java.io.BufferedReader;

import studentRecordsBackup.util.Logger;

import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStreamReader;

import studentRecordsBackup.util.Logger.DebugLevel;

public class FileProcessor {

	private BufferedReader br = null;
	
	/********************************************************
	 * 
	 * METHOD NAME : FileProcessor
	 * INPUT 	   : String as a fileName
	 * RETURNS	   : FileProcessor object
	 * PURPOSE     : Creation of FileProcessor object and 
	 * 			     setting its member variables
	 *
	 ********************************************************/

	public FileProcessor(String fileName) {
		try {
			br = new BufferedReader(new FileReader(fileName));
			Logger.writeMessage(" File Processor Constructor Called ", 
								DebugLevel.CONSTRUCTOR);
		} catch (Exception e) {
			Logger.writeMessage("Processor Exception  "+e.getMessage(), 
								DebugLevel.CONSTRUCTOR);
			e.printStackTrace();
		}
	}

	/********************************************************
	 * 
	 * METHOD NAME : readLineFromFile
	 * INPUT 	   : void
	 * RETURNS	   : String
	 * PURPOSE     : one line of the file as a String at a time
	 *
	 ********************************************************/

	public String readLineFromFile(){
		String readline = null; 
		try{
			synchronized(this){
				readline = br.readLine();
			}
		} catch (Exception e){
			Logger.writeMessage("Exception readLine  "+e.getMessage(),
								 DebugLevel.NONE);
			e.printStackTrace();
		} finally {
			try {
				// br.close(); This is creating a socket close error 
							 //hence commented 
			} catch(Exception e){
				//... This is igonored anyways
			}
		}
		return readline;
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
		return br.toString();
	}
}
