
package wordCount.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;

import wordCount.util.Logger;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import wordCount.util.Logger.DebugLevel;

public class FileProcessor {

	private BufferedReader br = null;
	private BufferedWriter bw = null;
	
	/********************************************************
	 * 
	 * METHOD NAME : FileProcessor
	 * INPUT 	   : String as a fileName
	 * RETURNS	   : FileProcessor object
	 * PURPOSE     : Creation of FileProcessor object and 
	 * 			     setting its member variables
	 *
	 ********************************************************/

	public FileProcessor(String fileName, String outputName) {
		try {
			br = new BufferedReader(new FileReader(fileName));
			bw = new BufferedWriter(new FileWriter(outputName, true));
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
			readline = br.readLine();
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
	 * METHOD NAME : close
	 * INPUT 	   : void
	 * RETURNS	   : void
	 * PURPOSE     : closes bufferedreader and bufferedwriter
	 *
	 ********************************************************/
	
	public void close(){
		try {
			br.close();
			bw.close();
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
