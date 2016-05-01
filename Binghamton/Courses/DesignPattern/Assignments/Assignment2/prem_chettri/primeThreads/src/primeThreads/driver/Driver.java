
package primeThreads.driver;


//import com.sun.istack.internal.logging.Logger;

import java.io.File;

import primeThreads.util.Logger;
import primeThreads.util.Logger.DebugLevel;
import primeThreads.util.FileProcessor;
import primeThreads.util.IsPrime;
import primeThreads.store.Results;
import primeThreads.threadMgmt.CreateWorkers;

public class Driver{

	public static Logger log = new Logger();


	/********************************************************
	 * 
	 * METHOD NAME : validate
	 * INPUT 	   : String as a fileName, integer as number of threads and
	 * 				 integer as a current debug value
	 * RETURNS	   : boolean
	 * PURPOSE     : To Validate if the input values are compatiable
	 *
	 ********************************************************/

	public static boolean validate(String fileName, int NUM_THREADS, int DEBUG_VALUE){
		File file = new File(fileName);
		boolean validate = true;

		Logger.setDebugValue(DEBUG_VALUE);

		if((DEBUG_VALUE < 0) && (DEBUG_VALUE > 4)){
			validate = false;
			Logger.writeMessage("Out of range Debug Value ", DebugLevel.NONE);
		} // No else part as I am using default switch as enum NONE

		if((NUM_THREADS < 1) && (NUM_THREADS > 5)){
			validate = false;
			Logger.writeMessage("Out of range Number of Threads ", DebugLevel.NONE);
		}

		if(!(file.isFile() && file.exists() && file.canRead())) {
			validate = false;
			Logger.writeMessage("Invalid Input file ", DebugLevel.NONE);
		}		
		return validate;
	}

	public static void main(String args[]) {

		System.out.println("\n The args length is: " + args.length);

		System.out.println("\n The fileName is: " + args[0]);
		System.out.println("\n The NUM_THREADS is: " + args[1]);
		System.out.println("\n The DEBUG_VALUE is: " + args[2]);
		try {
			if(args.length == 3) {		
				String fileName = args[0];
				int NUM_THREADS = Integer.parseInt(args[1]);
				int DEBUG_VALUE = Integer.parseInt(args[2]);

				if(validate(fileName, NUM_THREADS, DEBUG_VALUE)) {

					// Instantiate Objects
					FileProcessor proc = new FileProcessor(args[0]);
					IsPrime isPrime = new IsPrime();
					Results res =  new Results();

					// Threading
					if(proc != null) {
						CreateWorkers workers = new CreateWorkers(proc, res, isPrime);
						workers.startWorkers(NUM_THREADS);
					}
					//output
					res.writeSumToScreen();
				}
			} else {
				Logger.writeMessage("Incorrect Input paramentes !!!", DebugLevel.NONE);	//  Using default log level
			}
		} catch (Exception e){
			//e.printStackTrace();
		} finally {
			// Nothing to release here 
		}
	} // end main(...)
} // end public class Driver
