
package primeThreads.threadMgmt;

import primeThreads.util.Logger.DebugLevel;
import primeThreads.util.FileProcessor;
import primeThreads.util.IsPrime;
import primeThreads.store.Results;
import primeThreads.util.Logger;

public class WorkerThread implements Runnable  {

	private FileProcessor proc; 
	private Results res;
	private IsPrime prime;

	/********************************************************
	 * 
	 * METHOD NAME : WorkerThread
	 * INPUT 	   : FileProcessor object, Results Object  and IsPrime Object
	 * RETURNS	   : CreateWorkers object
	 * PURPOSE     : Creation of WorkerThread object and setting its member variables
	 *
	 ********************************************************/
	
	public WorkerThread(FileProcessor procIn, Results resIn, IsPrime primeIn){
		proc = procIn;
		res = resIn;
		prime = primeIn;
		Logger.writeMessage(" Worker Thread Created ", DebugLevel.CONSTRUCTOR);
	}
	
	/********************************************************
	 * 
	 * METHOD NAME : run
	 * INPUT 	   : void
	 * RETURNS	   : void
	 * PURPOSE     : executes the thread and which performs task
	 *
	 ********************************************************/

	public void run() {
		Logger.writeMessage(" Method run is invoked ", DebugLevel.THREAD);
		String line = null;
		try {
			while((line = proc.readLineFromFile())!= null) {
				int number = Integer.parseInt(line);
				if(prime.verify(number)){
					res.saveNumber(number);
				}
			}
		} catch (Exception e){
			Logger.writeMessage(" Exception in worker " +e.getMessage() +" Val "+line, DebugLevel.NONE);
		} finally {
			// No resources to be release 
		}
	}
}