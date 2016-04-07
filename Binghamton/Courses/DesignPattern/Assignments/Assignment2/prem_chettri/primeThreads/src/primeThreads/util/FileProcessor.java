
package primeThreads.util;

import java.io.BufferedReader;
import primeThreads.util.Logger;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStreamReader;
import primeThreads.util.Logger.DebugLevel;

public class FileProcessor {

	private BufferedReader br = null;
	
	/********************************************************
	 * 
	 * METHOD NAME : FileProcessor
	 * INPUT 	   : String as a fileName
	 * RETURNS	   : FileProcessor object
	 * PURPOSE     : Creation of FileProcessor object and setting its member variables
	 *
	 ********************************************************/

	public FileProcessor(String fileName){
		try {
			br = new BufferedReader(new FileReader(fileName));
			Logger.writeMessage(" File Processor Constructor Called ", DebugLevel.CONSTRUCTOR);
		} catch (Exception e) {
			Logger.writeMessage(" File Processor Exception Occourd  "+e.getMessage(), DebugLevel.CONSTRUCTOR);
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
			Logger.writeMessage("Exception Occoured in readLine  "+e.getMessage(), DebugLevel.NONE);
			e.printStackTrace();
		} finally {
			try {
				// br.close(); This is creating a socket close error
			} catch(Exception e){
				//... This is igonored anyways
			}
		}
		return readline;
	}
}
