import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;


public class StringOperations {

	private TreeMap<String, Integer> counter = new TreeMap<String, Integer>();
	StringOperations(){
	}

	/********************************************************
	 * 
	 * METHOD NAME :  processing
	 * INPUT 	   :  String as an input file content
	 * RETURNS	   :  void
	 * PURPOSE     :  To process the file content and find the element count
	 *
	 ********************************************************/

	void processing(String readLine){
		String []lineArray = readLine.split("\\s+");
		if(lineArray[0].contains("element") && readLine.contains("name")){			
			for(int i=0; i< lineArray.length;i++){
				if(lineArray[i].contains("name")){
					String []element = lineArray[i].split("=");
					if(counter.containsKey(element[1])){
						Integer count = counter.get(element[1].toString());
						counter.put(element[1], ++count);
					} else {
						counter.put(element[1], 1);
					}
				}
			}
		}
	}



	/********************************************************
	 * 
	 * METHOD NAME : getMax
	 * INPUT 	   : void
	 * RETURNS	   : void
	 * PURPOSE     : To find an element that has occurred most frequent and display its count 
	 *
	 ********************************************************/

	void getMax(){
		int max = 0;
		String element = null;
		for (Entry<String, Integer> entry : counter.entrySet()) {
			if(entry.getValue() > max){
				max = entry.getValue();
				element = entry.getKey();	
			}
		}
		System.out.println("The most frequently occurring element is "+element.replace("\"", "")+" . It appears "+max+" times.");
	}

	/********************************************************
	 * 
	 * METHOD NAME : finddif
	 * INPUT 	   : void
	 * RETURNS	   : void
	 * PURPOSE     : TEST CODE to find an element that has occurrences
	 *
	 ********************************************************/


	void finddiff(String readLine){
		int cnt = 0;
		if(readLine.contains("element")) {
			String name = null;
			boolean flag = false;
			String []lineArray = readLine.split("\\s+");
			for(int i=0; i< lineArray.length;i++){
				if(lineArray[i].contains("name")){
					String []element = lineArray[i].split("=");
					name = element[1];
				}
			}
			for (Entry<String, Integer> entry : counter.entrySet()) {
				if(name == null) {
					flag = true;
					break;					
				} else if(name.equals(entry.getKey())) {
					flag = true;
				}
			}
			if(!flag) {
				System.out.println("Diff" +name+" Count " +cnt++);
			}
		}
	}
}
