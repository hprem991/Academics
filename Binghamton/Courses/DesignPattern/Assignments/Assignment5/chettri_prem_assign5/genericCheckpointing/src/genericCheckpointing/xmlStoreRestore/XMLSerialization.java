package genericCheckpointing.src.genericCheckpointing.xmlStoreRestore;

import java.lang.reflect.Field;

import genericCheckpointing.src.genericCheckpointing.server.SerStrategy;
import genericCheckpointing.src.genericCheckpointing.util.FileProcessor;
import genericCheckpointing.src.genericCheckpointing.util.Logger;
import genericCheckpointing.src.genericCheckpointing.util.Logger.DebugLevel;

public class XMLSerialization implements SerStrategy {
	
	private FileProcessor processor;
	SerializeTypes serialize = null;
	
	public XMLSerialization(FileProcessor fp){
		processor = fp;
		serialize =  new SerializeTypes();
	}

	@Override
	public void processInput(Object currentObj) throws IllegalArgumentException, IllegalAccessException {
		Class className = currentObj.getClass();
		processor.writeLineToFile("<DPSerialization>");
		processor.writeLineToFile(serialize.serializeClass(className.getSimpleName()));
		Field[] fields = className.getDeclaredFields();
		for(int i = 0; i < fields.length; i++){
			String type =fields[i].getName();
			fields[i].setAccessible(true);
			Object value = fields[i].get(currentObj);
			processor.writeLineToFile(serialize.stringify(type, value));
		}				
		processor.writeLineToFile("</complexType>");
		processor.writeLineToFile("</DPSerialization>");
	}
}
