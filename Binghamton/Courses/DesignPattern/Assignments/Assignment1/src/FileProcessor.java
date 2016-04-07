import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStreamReader;

public class FileProcessor {

	private BufferedReader br = null;

	FileProcessor(String fileName){
		try {
			br = new BufferedReader(new FileReader(fileName));
		} catch (Exception e) {
			System.out.println("Exception Occoured  "+e.getMessage());
			e.printStackTrace();
		}
	}
	
	FileProcessor(FileInputStream fileName){
		try {
			br = new BufferedReader(new InputStreamReader(fileName));
		} catch (Exception e) {
			System.out.println("Exception Occoured  "+e.getMessage());
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

	String  readLineFromFile(){
		String readline = null; 
		try{
			readline = br.readLine();
		} catch (Exception e){
			System.out.println("Exception Occoured in readLine  "+e.getMessage());
			e.printStackTrace();
		}
		return readline;
	}
}
