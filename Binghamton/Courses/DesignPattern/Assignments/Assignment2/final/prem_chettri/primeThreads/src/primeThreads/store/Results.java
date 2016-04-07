
package primeThreads.store;

import java.util.Vector;
import java.io.File;
import java.util.concurrent.ConcurrentHashMap;

import primeThreads.util.Logger.DebugLevel;
import primeThreads.util.Logger;


public class Results implements StdoutDisplayInterface
			/*, Need to use Another Interface if Req */ 
   {
	// appropriate data structure as private data member
	private Vector<Integer> primes = new Vector<Integer>(); 
	//private ConcurrentHashMap primes = new ConcurrentHashMap(); 
	// Couldnt fit its need though concurrent hashMap is faster

	
	/********************************************************
	 * 
	 * METHOD NAME : Results
	 * INPUT 	   : void
	 * RETURNS	   : Results object
	 * PURPOSE     : Creation of Results object
	 *
	 ********************************************************/
	
	public Results(){
		Logger.writeMessage(" Results Instance Created ", 
						     DebugLevel.CONSTRUCTOR);
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
		Logger.writeMessage(" Number is being added as " +number, 
							  DebugLevel.RESULT);
	}

	/********************************************************
	 * 
	 * METHOD NAME : showContent
	 * INPUT 	   : void
	 * RETURNS	   : void
	 * PURPOSE     : Prints the valueof the vector to standard output
	 *
	 ********************************************************/
	
	public void showContent(){
		for(int index = 0; index < primes.size(); index++){
			Logger.writeMessage(" Index " +index+ 
								" Value " +primes.get(index), 
					  			DebugLevel.STORE);
		}
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
	  Logger.writeMessage("The sum of all the prime numbers is: "+sum, 
				             DebugLevel.NONE);
	  if(Logger.getDebugValue() == DebugLevel.STORE)
		  showContent();
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
		return primes.toString();
	}
} 


