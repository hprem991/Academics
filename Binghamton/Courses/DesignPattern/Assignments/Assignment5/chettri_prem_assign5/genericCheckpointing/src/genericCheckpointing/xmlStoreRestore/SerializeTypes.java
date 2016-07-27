package genericCheckpointing.src.genericCheckpointing.xmlStoreRestore;

import genericCheckpointing.src.genericCheckpointing.util.Logger;
import genericCheckpointing.src.genericCheckpointing.util.Logger.DebugLevel;

public class SerializeTypes {

	String serializeClass(String value){
		return "<complexType xsi:type=\"genericCheckpointing.util."+value+"\">";
	}

	public String stringify(String fieldType, Object value){
		String result = "";
		if(fieldType.equals("myInt")){
			result = serializeInt(value);
		} else if(fieldType.equals("myLong")){
			result = serializeLong(value);
		} else if(fieldType.equals("myString")){
			result = serializeString(value);
		} else if(fieldType.equals("myBool")){
			result = serializeBool(value);
		} else if(fieldType.equals("myDoubleT")){
			result = serializeDouble(value);
		} else if(fieldType.equals("myFloatT")){
			result = serializeFloat(value);
		} else if(fieldType.equals("myShortT")){
			result = serializeShort(value);
		} else if(fieldType.equals("myCharT")){
			result = serializeChar(value);
		} else {
			Logger.writeMessage("ERROR: UNKNOWN TYPE " , DebugLevel.RESULT);
		}	
		return result;
	}

	String serializeInt(Object value){
		return "<myInt xsi:type=\"xsd:int\">"+(int)value+"</myInt>";
	}

	String serializeLong(Object value){
		return "<myLong xsi:type=\"xsd:long\">"+(Long)value+"</myLong>";
	}

	String serializeString(Object value){
		return "<myString xsi:type=\"xsd:string\">"+(String)value+"</myString>";
	}

	String serializeBool(Object value){
		return "<myBool xsi:type=\"xsd:boolean\">"+(Boolean)value+"</myBool>";
	}

	String serializeDouble(Object value){
		return "<myDoubleT xsi:type=\"xsd:double\">"+(double)value+"</myDoubleT>";
	}

	String serializeFloat(Object value){
		return "<myFloatT xsi:type=\"xsd:float\">"+(float)value+"</myFloatT>";
	}

	String serializeShort(Object value){
		return "<myShortT xsi:type=\"xsd:short\">"+value+"</myShortT>";
	}

	String serializeChar(Object value){
		return "<myCharT xsi:type=\"xsd:char\">"+value+"</myCharT>";
	}	

}
