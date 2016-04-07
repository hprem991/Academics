
package primeThreads.util;
import primeThreads.util.Logger.DebugLevel;

public class IsPrime {
	
	public IsPrime(){
		Logger.writeMessage(" Is Prime Class Constructed ", DebugLevel.CONSTRUCTOR);
	}
	
	public boolean verify(int number){
		return (number % 2 !=0 );
	}
		
	public String toString(){
		//.. No Data members to stringify 
		return "";
	}
}
