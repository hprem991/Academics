
package genericCheckpointing.src.genericCheckpointing.util;

public class Logger{
	
	
	public static enum DebugLevel { 
		NONE,
		STORE,
		RESULT,
		THREAD,
		CONSTRUCTOR 
	};

	private static DebugLevel debugLevel;

	
	/********************************************************
	 * 
	 * METHOD NAME : setDebugValue
	 * INPUT 	   : integer as a debuglevel
	 * RETURNS	   : void
	 * PURPOSE     : sets the debuglevel
	 *
	 ********************************************************/

	public static void setDebugValue (int levelIn) {
		switch (levelIn) {
		case 0: debugLevel = DebugLevel.NONE; break;
		case 1: debugLevel = DebugLevel.STORE; break;
		case 2: debugLevel = DebugLevel.RESULT; break;
		case 3:	debugLevel = DebugLevel.THREAD; break;  
		case 4: debugLevel = DebugLevel.CONSTRUCTOR; break;
		//default : debugLevel = DebugLevel.NONE; break; 
					// No default being used 
		}
	}

	/********************************************************
	 * 
	 * METHOD NAME : getDebugValue
	 * INPUT 	   : void
	 * RETURNS	   : DebugLevel as a current debuglevel
	 * PURPOSE     : gets the current debuglevel
	 *
	 ********************************************************/
	
	public static DebugLevel getDebugValue () {
		return debugLevel;
	}
	
	
	
	/********************************************************
	 * 
	 * METHOD NAME : writeMessage
	 * INPUT 	   : String as a message and Debug level
	 * RETURNS	   : void
	 * PURPOSE     : Prints the message to the standard output
	 *
	 ********************************************************/
	
	public static void writeMessage (String  message,
									 DebugLevel levelIn ) {
		if (levelIn == debugLevel)
			System.out.println(message);
	}
	
	/********************************************************
	 * 
	 * METHOD NAME : writeOutput
	 * INPUT 	   : TBD
	 * RETURNS	   : void
	 * PURPOSE     : TBD
	 *
	 ********************************************************/
	
	public static void writeOutput(String message){
		// What should I output ?
		// as all stdio is handled using writeMessage
		// I am using this api just to print the value 
		// when input paraments fails.
		System.out.println(message);
		
	}

	/********************************************************
	 * 
	 * METHOD NAME : toString
	 * INPUT 	   : void
	 * RETURNS	   : String
	 * PURPOSE     : Stringify the current class
	 *
	 ********************************************************/
	
	public String toString() {
		return "Debug Level is " + debugLevel;
	}
}
