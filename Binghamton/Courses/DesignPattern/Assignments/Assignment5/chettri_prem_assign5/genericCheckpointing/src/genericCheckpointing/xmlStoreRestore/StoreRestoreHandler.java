package genericCheckpointing.src.genericCheckpointing.xmlStoreRestore;

import genericCheckpointing.src.genericCheckpointing.server.SerStrategy;
import genericCheckpointing.src.genericCheckpointing.util.FileProcessor;
import genericCheckpointing.src.genericCheckpointing.util.Logger;
import genericCheckpointing.src.genericCheckpointing.util.Logger.DebugLevel;
import genericCheckpointing.src.genericCheckpointing.util.MyAllTypesFirst;
import genericCheckpointing.src.genericCheckpointing.util.MyAllTypesSecond;
import genericCheckpointing.src.genericCheckpointing.util.SerializableObject;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Field;

public class StoreRestoreHandler implements InvocationHandler {
	
	FileProcessor processor = null;

	DeserializeTypes deserialize = null;
	
	public StoreRestoreHandler(FileProcessor fp) {
		processor = fp;	
		deserialize = new DeserializeTypes(fp);
	}

	public void serializeData(Object sObject, SerStrategy sStrategy) {
		 try{
	          sStrategy.processInput(sObject);
		 } catch (Exception e){
			 Logger.writeMessage("Exception Occoured: -> Serialization XML ", DebugLevel.RESULT);
		 }
	  }
	   
	@Override
	public Object invoke(Object proxy, Method method, Object[] args)
			throws Throwable {
		Object obj = null;
		if(method.getName().equals("writeObj")){
			if(args[1].equals("XML")){
				serializeData(args[0], new XMLSerialization(processor));
			}			
		} else if(method.getName().equals("readObj")) {
		    obj = deserialize.createObject();;
		}
		return obj;
	}
}
