package genericCheckpointing.src.genericCheckpointing.server;

import genericCheckpointing.src.genericCheckpointing.util.MyAllTypesFirst;
import genericCheckpointing.src.genericCheckpointing.util.MyAllTypesSecond;

public interface StoreI extends StoreRestoreI {
	
	 void writeObj(MyAllTypesFirst aRecord, String wireFormat);
     void writeObj(MyAllTypesSecond aRecord, String wireFormat);

}
