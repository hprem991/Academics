import java.io.*;
import java.util.*;
import java.lang.*;

class Scheduler{

	public void writeToFile(String filename, String str) throws IOException{
		FileWriter fileWriter = new FileWriter(filename);
		fileWriter.write(str);
		fileWriter.close();
	}

	public static void main(String args[]){
		Scheduler schedule = new Scheduler();
		BufferedReader br = null;
		String fileStr = "", outputStr = "", oldAddress = "";
		int count = 0, counter = 0;
		
		try {
			br = new BufferedReader(new FileReader(args[0]));
			while ((fileStr = br.readLine()) != null) {
				String column = fileStr.substring(6, 9).toUpperCase(); // 3 length Column Address
				String row = fileStr.substring(1, 6).toUpperCase(); // 5 length Row Address
				
				if(fileStr.charAt(0) == 'L'){
					if(!oldAddress.isEmpty()){
						if(oldAddress.equals(row)) {
							outputStr += "\nR"+column;
							count++;
						} else {
							oldAddress = row;
							outputStr += "\nI"+(30 - count)+"\nP\nI19"+"\nA"+row+"\nI11"+"\nR"+column;
							count = 13;
						}					
					} else {						
						oldAddress = row;
						outputStr += "A"+row+"\nI11"+"\nR"+column;
						count = 13;
					}
				} else if(fileStr.charAt(0) == 'S'){
					if(!oldAddress.isEmpty()){
						if(oldAddress.equals(row)) {
							outputStr += "\nW"+column;
							count++;
						} else {
							oldAddress = row;
							outputStr += "\nI"+(30 - count)+"\nP\nI19"+"\nA"+row+"\nI11"+"\nW"+column;
							count = 13;
						}
					} else {
						outputStr += "A"+row+"\nI11"+"\nW"+column;
						oldAddress = row;
						count = 13;
					}	
				}
			}
			if(!args[1].isEmpty())
				schedule.writeToFile(args[1],outputStr);
			else
				schedule.writeToFile("Tournament.txt",outputStr);
			System.out.println(outputStr);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Exception Occoured "+e.getMessage());
		} 
	}
}
