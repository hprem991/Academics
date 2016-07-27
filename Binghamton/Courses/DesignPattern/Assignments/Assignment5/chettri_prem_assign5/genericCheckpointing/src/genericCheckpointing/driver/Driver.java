package genericCheckpointing.src.genericCheckpointing.driver;

import java.lang.Object;
import java.util.Vector;
import java.io.File;

import genericCheckpointing.src.genericCheckpointing.util.*;
import genericCheckpointing.src.genericCheckpointing.xmlStoreRestore.*;
import genericCheckpointing.src.genericCheckpointing.server.*;
import genericCheckpointing.src.genericCheckpointing.util.Logger;
import genericCheckpointing.src.genericCheckpointing.util.Logger.DebugLevel;
import genericCheckpointing.src.genericCheckpointing.util.MyAllTypesFirst;
import genericCheckpointing.src.genericCheckpointing.util.SerializableObject;


public class Driver {


	/********************************************************
	 * 
	 * METHOD NAME : validate
	 * INPUT 	   : String as a fileName, 
	 * RETURNS	   : boolean
	 * PURPOSE     : To Validate if the input values are compatible
	 * @throws IOException 
	 *
	 ********************************************************/

	public static boolean validate(String mode, String fileName) 
	{
		File file = new File(fileName);
		boolean validateFlag = true;
		if(mode.equals("deser")){
			if(!(file.isFile() && file.exists() && file.canRead())) {
				validateFlag = false;
				Logger.writeOutput("Invalid Input file ");
			}
		} else if(mode.equals("serdeser")){
			file.delete();
		} else {
			validateFlag = false;
			Logger.writeMessage("Invalid Mode", DebugLevel.RESULT);
		}
		return validateFlag;		
	}

	/********************************************************
	 * 
	 * METHOD NAME : verifyMatch
	 * INPUT 	   : Two vectors of SerializedObject type, 
	 * RETURNS	   : void
	 * PURPOSE     : To verify if the object match each other
	 *
	 ********************************************************/

	public static void verifyMatch(Vector<SerializableObject> before, Vector<SerializableObject> after){
		int mismatchCounter = 0; 
		int vectorLength = (before.size() == after.size() ? before.size() : 
						(before.size() > after.size() ? after.size() : before.size()));
		if(before.size() != after.size()){
			mismatchCounter += Math.abs(before.size() - after.size());
		}
		for(int i=0 ; i < vectorLength; i++){
			if(!before.get(i).equals(after.get(i))){
				mismatchCounter++;
			}
		}
		Logger.writeMessage("Number of Mismatch is  "+mismatchCounter, DebugLevel.RESULT);
	}

	public static void main(String[] args) {

		Logger.setDebugValue(2);
		FileProcessor processor = null;

		try {		
			if(3 == args.length) {		

				String mode = args[0];

				int NUM_OF_OBJECTS_OF_ONE_KIND = Integer.parseInt(args[1]);


				String fileName = args[2];

				if(validate(mode, fileName)) {
		
					processor = new FileProcessor(fileName);

					ProxyCreator pc = new ProxyCreator();

					StoreRestoreHandler handler =  new StoreRestoreHandler(processor);

					// create a proxy
					StoreRestoreI cpointRef = (StoreRestoreI) pc.createProxy(
							new Class[] {
									StoreI.class, RestoreI.class
							}, 
							handler
							);

					MyAllTypesFirst myFirst;
					MyAllTypesSecond  mySecond;

			
					Vector<SerializableObject> before = new Vector<SerializableObject>();

					if(mode.equals("serdeser")) {
						for (int i=0; i < NUM_OF_OBJECTS_OF_ONE_KIND; i++) {
							myFirst = new MyAllTypesFirst( i);

							mySecond = new MyAllTypesSecond(i);

							((StoreI) cpointRef).writeObj(myFirst, "XML");
							((StoreI) cpointRef).writeObj(mySecond, "XML");

							before.add(myFirst);
							before.add(mySecond);
						}
						processor.closeWriter();
					}
					
					
					Vector<SerializableObject> after = new Vector<SerializableObject>();
					processor.setFileName(fileName);
					for (int j=0; j< 2 * NUM_OF_OBJECTS_OF_ONE_KIND; j++) {		
						SerializableObject objectReceived =  ((RestoreI) cpointRef).readObj("XML");
						if(null == objectReceived) {
							break;
						}
						after.add(objectReceived);
					}
					if(mode.equals("serdeser")) {
						verifyMatch(before, after);
					} else if(mode.equals("deser")) {
						for(SerializableObject obj: after){
							Logger.writeMessage(obj.toString(), DebugLevel.RESULT);
						}
					} else {
						Logger.writeMessage(" ERROR : INVALID MODE ", DebugLevel.RESULT);
					}
					processor.closeReader();
				}
			}
		} catch (Exception e){
			Logger.writeOutput("Invalid Argument "+e.getMessage());
			e.printStackTrace();
		} finally {
			//processor.closeReader(); // Creating exception
			//processor.closeWriter(); // Creating exception
		}
	}
}

