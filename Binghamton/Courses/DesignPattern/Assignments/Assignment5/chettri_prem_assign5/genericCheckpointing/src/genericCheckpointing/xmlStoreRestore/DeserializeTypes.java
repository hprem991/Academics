package genericCheckpointing.src.genericCheckpointing.xmlStoreRestore;

import java.lang.reflect.Method;
import java.util.regex.Pattern;

import genericCheckpointing.src.genericCheckpointing.util.FileProcessor;
import genericCheckpointing.src.genericCheckpointing.util.Logger;
import genericCheckpointing.src.genericCheckpointing.util.Logger.DebugLevel;
import genericCheckpointing.src.genericCheckpointing.util.MyAllTypesFirst;
import genericCheckpointing.src.genericCheckpointing.util.MyAllTypesSecond;
import genericCheckpointing.src.genericCheckpointing.util.SerializableObject;

public class DeserializeTypes {

	private FileProcessor processor = null;

	private String extract(String line){
		String val = "";
		boolean record = false;
		for(int i = 0; i < (line.length() - 1); i++){
			char  c =  line.charAt(i);
			if(line.charAt(i) == '>' && !record){
				record = true;
				continue;
			} 
			if(line.charAt(i) == '<' && record){
				record = false;
				break;
			}			
			if(record){
				val += c;
			}
		}
		return val;
	}

	public DeserializeTypes(FileProcessor fp){
		processor = fp;
	}
	
	private String getXsiType(String val){
			String []s = val.split("=");
			String res = s[1].replace("\"","");
			return res.replace(">", "");
	}

	public SerializableObject createObject(){
		String line = "";
		boolean updateClass = false;
		Class<?> cls = null;
		Method meth = null;
		SerializableObject obj = null;

		while((line = processor.readLineFromFile()) != null){
			if(line.equals("<DPSerialization>") && !updateClass){
				updateClass = true;
				continue;
			} 

			if(line.equals("</DPSerialization>") && updateClass){
				updateClass = false;
				break;
			} 

			if(updateClass){
				try {
					if(line.contains("complexType") && !line.contains("/")){
						String classType = "genericCheckpointing.src."+getXsiType(line);
						cls = Class.forName(classType);
						obj = (SerializableObject) cls.newInstance();
					} else if(line.contains("myInt")){
						meth = cls.getDeclaredMethod("setMyInt", int.class);
						meth.invoke(obj, Integer.parseInt(extract(line)));
					} else if(line.contains("myLong")){
						meth = cls.getDeclaredMethod("setMyLong", long.class);
						meth.invoke(obj, Long.parseLong(extract(line)));
					} else if(line.contains("myString")){
						meth = cls.getDeclaredMethod("setMyString", String.class);
						meth.invoke(obj, extract(line));
					} else if(line.contains("myBool")){
						meth = cls.getDeclaredMethod("setMyBool", boolean.class);
						meth.invoke(obj, Boolean.parseBoolean(extract(line)));
					} else if(line.contains("myDoubleT")){
						meth = cls.getDeclaredMethod("setMyDoubleT", double.class);
						meth.invoke(obj, Double.parseDouble(extract(line)));
					} else if(line.contains("myFloatT")){
						meth = cls.getDeclaredMethod("setMyFloatT", float.class);
						meth.invoke(obj, Float.parseFloat(extract(line)));
					} else if(line.contains("myShortT")){
						meth = cls.getDeclaredMethod("setMyShortT", short.class);
						meth.invoke(obj, Short.parseShort(extract(line)));
					} else if(line.contains("myCharT")){
						meth = cls.getDeclaredMethod("setMyCharT", char.class);
						meth.invoke(obj, (extract(line)).charAt(0));
					} 				
				}catch(Exception e){
					Logger.writeMessage("Deser Error "+e.getMessage(), DebugLevel.RESULT);
				}
			}
		}	
		return obj;
	}

}
