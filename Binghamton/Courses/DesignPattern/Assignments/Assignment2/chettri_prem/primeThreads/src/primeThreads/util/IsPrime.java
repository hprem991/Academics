
package primeThreads.util;
import primeThreads.util.Logger.DebugLevel;

public class IsPrime {
	
	public IsPrime(){
		Logger.writeMessage(" Is Prime Class Constructed ",
							  DebugLevel.CONSTRUCTOR);
	}
	
	/********************************************************
	 * 
	 * METHOD NAME : verify
	 * INPUT 	   : Integer as a number
	 * RETURNS	   : boolean
	 * PURPOSE     : test if an integer is a prime (cs542 sense)
	 *
	 ********************************************************/
	public boolean verify(int number){
		return (number % 2 !=0 );
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
		//.. No Data members to stringify 
		return "";
	}
}
