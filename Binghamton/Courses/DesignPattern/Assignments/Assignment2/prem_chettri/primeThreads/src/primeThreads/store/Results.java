
package primeThreads.store;

import java.util.Vector;
import java.io.File;
import java.util.concurrent.ConcurrentHashMap;

import primeThreads.util.Logger.DebugLevel;
import primeThreads.util.Logger;


public class Results implements StdoutDisplayInterface/*, Need to use Another Interface if Req */ {
	// appropriate data structure as private data member
	private Vector primes = new Vector(); 
	//private ConcurrentHashMap primes = new ConcurrentHashMap(); // Couldnt find need though concurrent hashMap is faster

	
	/********************************************************
	 * 
	 * METHOD NAME : Results
	 * INPUT 	   : void
	 * RETURNS	   : Results object
	 * PURPOSE     : Creation of Results object
	 *
	 ********************************************************/
	
	public Results(){
		Logger.writeMessage(" Results Instance Created ", DebugLevel.CONSTRUCTOR);
	}
	
	// appropriate method to save prime number to the data structure
	
	/********************************************************
	 * 
	 * METHOD NAME : saveNumber
	 * INPUT 	   : integer as a number
	 * RETURNS	   : void
	 * PURPOSE     : Saves a number in a data structure
	 *
	 ********************************************************/
	
	public void saveNumber(int number){
		primes.add(number);
		Logger.writeMessage(" Number is being added as " +number, DebugLevel.RESULT);
	}

	/********************************************************
	 * 
	 * METHOD NAME : writeSumToScreen
	 * INPUT 	   : void
	 * RETURNS	   : void
	 * PURPOSE     : Prints the result value to the standard output
	 *
	 ********************************************************/
	
	public void writeSumToScreen() {
		int sum = 0;
		for(int index = 0; index < primes.size(); index++){
			sum += (int)primes.get(index);;
		}
		Logger.writeMessage("The sum of all the prime numbers is: " +sum, DebugLevel.NONE); 
	}
	
	public String toString(){
		return primes.toString();
	}
} 


