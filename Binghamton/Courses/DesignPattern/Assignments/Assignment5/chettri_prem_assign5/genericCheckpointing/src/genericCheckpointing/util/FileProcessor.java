
package genericCheckpointing.src.genericCheckpointing.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;

import genericCheckpointing.src.genericCheckpointing.util.Logger;
import genericCheckpointing.src.genericCheckpointing.util.Logger.DebugLevel;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;



public class FileProcessor {

	private BufferedReader br = null;
	private BufferedWriter bw = null;
	
	/********************************************************
	 * 
	 * METHOD NAME : FileProcessor
	 * INPUT 	   : void
	 * RETURNS	   : FileProcessor object
	 * PURPOSE     : Creation of FileProcessor object 
	 *               setting its member variables
	 *
	 ********************************************************/

	public FileProcessor() {
		// Default Constructor
	}
	
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
			bw = new BufferedWriter(new FileWriter(fileName, true)); // To be Checked
			br = new BufferedReader(new FileReader(fileName));
				
			Logger.writeMessage(" File Processor Constructor Called ", 
								DebugLevel.CONSTRUCTOR);
		} catch (Exception e) {
			Logger.writeMessage("Processor Exception  "+e.getMessage(), 
								DebugLevel.CONSTRUCTOR);
			e.printStackTrace();
		}
	}

	
	public void setFileName(String fileName){
		try {
			bw = new BufferedWriter(new FileWriter(fileName, true)); // To be Checked
			br = new BufferedReader(new FileReader(fileName));
				
		} catch (Exception e) {
			Logger.writeMessage("Processor Exception  "+e.getMessage(), 
								DebugLevel.RESULT);
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
				//... This is ignored anyways
			}
		}
		return readline;
	}
	
	/********************************************************
	 * 
	 * METHOD NAME : writeLineToFile
	 * INPUT 	   : String
	 * RETURNS	   : void
	 * PURPOSE     : writes one line to the file
	 *
	 ********************************************************/
	
	public void writeLineToFile(String line){
		try{
			bw.write(line);
			bw.newLine();
		} catch(Exception e){
			Logger.writeMessage("Exception writeLine  "+e.getMessage(),
					 DebugLevel.NONE);
			e.printStackTrace();
		}
	}
	
	/********************************************************
	 * 
	 * METHOD NAME : closeWriter
	 * INPUT 	   : void
	 * RETURNS	   : void
	 * PURPOSE     : closes bufferedreader and bufferedwriter
	 *
	 ********************************************************/
	
	public void closeWriter(){
		try {
			bw.close();
		} catch (IOException e) {
			Logger.writeOutput("Could not close input/output stream " + e.getMessage());
		}
	}
	
	/********************************************************
	 * 
	 * METHOD NAME : closeReader
	 * INPUT 	   : void
	 * RETURNS	   : void
	 * PURPOSE     : closes bufferedreader and bufferedwriter
	 *
	 ********************************************************/
	
	public void closeReader(){
		try {
			br.close();
		} catch (IOException e) {
			Logger.writeOutput("Could not close input/output stream " + e.getMessage());
		}
	}
	
	/********************************************************
	 * 
	 * METHOD NAME : reset
	 * INPUT 	   : void
	 * RETURNS	   : void
	 * PURPOSE     : resets the bufferedreader
	 *
	 ********************************************************/
	
	public void reset(){
		try {
			br.reset();
		} catch (IOException e) {
			Logger.writeOutput("Could not reset bufferedreader " + e.getMessage());
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
	
	public String toString(){
		return br.toString() + bw.toString();
	}
}
