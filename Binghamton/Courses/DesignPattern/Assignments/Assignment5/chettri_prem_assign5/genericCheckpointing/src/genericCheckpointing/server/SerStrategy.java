package genericCheckpointing.src.genericCheckpointing.server;

import genericCheckpointing.src.genericCheckpointing.util.SerializableObject;

public interface SerStrategy {
	void processInput(Object sObject) throws IllegalArgumentException, IllegalAccessException;
}
