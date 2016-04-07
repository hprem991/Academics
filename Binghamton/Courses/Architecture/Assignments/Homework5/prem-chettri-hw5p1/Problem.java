import java.io.*;
import java.util.*;

class Predictor {

	int localCounter;
	int globalCounter;
	int selectorCounter;
	String selector, globalRegister;

	Map<String, Integer> globalMap= new HashMap<String, Integer>();
	Map<String, Integer> localMap= new HashMap<String, Integer>();
	Map<String, Integer> selectorMap= new HashMap<String, Integer>();

	Predictor(){
		localCounter = globalCounter = selectorCounter = 0;
		selector = "";
		for(int i = 0; i < 10; i++)
			selectorMap.put(Integer.toString(i),0);
	}

	public int getLocalCounter(String add){
		if(localMap.containsKey(add)) {
			return localMap.get(add);
		} else {
			localMap.put(add, 0);
			return 0;
		}
	}

	public void UpdateLocalCounter(String add, char c){
		if(localMap.containsKey(add)) {
			int currentCount = localMap.get(add);
			if((currentCount > 0) && (c == 'n')){
				currentCount--;
				localMap.put(add, currentCount);
			}
			else if((currentCount < 3) && (c == 't')) {
				currentCount++;
				localMap.put(add, currentCount);
			} 
		} else {
			localMap.put(add, 0);
		}
	}

	public int getGlobalCounter(String globalRegister){
		if(globalMap.containsKey(globalRegister)) {
			return globalMap.get(globalRegister);
		} else {
			globalMap.put(globalRegister, 0);
			return 0;
		}
	}

	public void UpdateGlobalCounter(String globalRegister, char c){
		if(globalMap.containsKey(globalRegister)) {
			int currentCount = globalMap.get(globalRegister);
			if((currentCount > 0) && (c == 'n')){
				currentCount--;
				globalMap.put(globalRegister, currentCount);
			}
			else if((currentCount < 3) && (c == 't')) {
				currentCount++;
				globalMap.put(globalRegister, currentCount);
			} 
		} else {
			if(c == 't')
				globalMap.put(globalRegister, 1);
			else
				globalMap.put(globalRegister, 0);
		}
	}


	public void UpdateSelector(String globalAddress, String add, char c){
		if((selectorMap.get(add) > 0) && (localPrediction(add).equals(Character.toString(c))) 
				&& (!globalPrediction(globalAddress).equals(Character.toString(c)))){
			if(selectorMap.containsKey(add)){
				int count = selectorMap.get(add);
				selectorMap.put(add, --count);
			} else {
				selectorMap.put(add, 0);
			}
		}
		else if((selectorMap.get(add) < 3) && (!localPrediction(add).equals(Character.toString(c))) 
				&& (globalPrediction(globalAddress).equals(Character.toString(c))))
			if(selectorMap.containsKey(add)){
				int count = selectorMap.get(add);
				selectorMap.put(add, ++count);
			} else {
				selectorMap.put(add, 0);
			}
	}

	public String localPrediction(String add){
		if(getLocalCounter(add)>1)
			return "t";
		return "n";			
	}

	public String globalPrediction(String globalAddress){
		if(getGlobalCounter(globalAddress) > 1)
			return "t";
		return "n";	
	}

	public String finalPrediction(String globalAddress, String c){
		if(selectorMap.get(c) > 1)
			return globalPrediction(globalAddress);
		else 
			return localPrediction(c);
	}

	public String selector(String c){
		if(selectorMap.get(c) > 1)
			return "g";
		else 
			return "l";
	}

	public String tournamentSelector(String c){
		return  selector(c);		
	}

	public void printGlobal(){
		for(Map.Entry<String, Integer> entry : globalMap.entrySet()){
			System.out.println("Key :->  "+entry.getKey()+"  Val  "+entry.getValue());
		}
	}

	public void writeToFile(String filename, String str) throws IOException{
		FileWriter fileWriter = new FileWriter(filename);
		fileWriter.write(str);
		fileWriter.close();
	}

	public static void main(String args[]){
		Predictor pred = new Predictor();
		BufferedReader br = null;
		String fileStr = null, globalRegister = "nnnnnn", outputStr = "";
		int cnt = 0;
		try {
			br = new BufferedReader(new FileReader(args[0]));
			while ((fileStr = br.readLine()) != null) {
				outputStr += fileStr.charAt(0)+pred.localPrediction(Character.toString(fileStr.charAt(0)))+
						pred.globalPrediction(globalRegister)+
						pred.selector(Character.toString(fileStr.charAt(0)))+
						pred.finalPrediction(globalRegister,Character.toString(fileStr.charAt(0)))+
						fileStr.charAt(1)+"\n";
				pred.UpdateSelector(globalRegister, Character.toString(fileStr.charAt(0)), fileStr.charAt(1)); 
				pred.UpdateLocalCounter(Character.toString(fileStr.charAt(0)), fileStr.charAt(1));
				pred.UpdateGlobalCounter(globalRegister, fileStr.charAt(1));
				globalRegister = globalRegister.substring(1, 6);
				globalRegister = globalRegister + fileStr.charAt(1);

			}
			System.out.println(outputStr);
			if(!args[1].isEmpty())
				pred.writeToFile(args[1],outputStr);
			else
				pred.writeToFile("Tournament.txt",outputStr);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Exception Occoured "+e.getMessage());
		} 
	}
}
