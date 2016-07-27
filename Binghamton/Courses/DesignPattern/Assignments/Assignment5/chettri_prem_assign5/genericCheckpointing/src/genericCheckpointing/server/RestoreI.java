package genericCheckpointing.src.genericCheckpointing.server;

import genericCheckpointing.src.genericCheckpointing.util.MyAllTypesFirst;
import genericCheckpointing.src.genericCheckpointing.util.MyAllTypesSecond;
import genericCheckpointing.src.genericCheckpointing.util.SerializableObject;

public interface RestoreI extends StoreRestoreI {
	SerializableObject readObj(String string);	
}
