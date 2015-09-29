import java.lang.*;
import java.io.*;

import org.w3c.dom.*;

import java.util.*;

class Tokenize {
	FileWriter fileWriter;
	private String filename;
	private int noOfOpeningTags;
	List <String> tokens;

	Tokenize(String file) throws IOException{
		filename = file;
		noOfOpeningTags = 0;
		tokens = new ArrayList<String>();
	}

	public void tokens(){
		BufferedReader br = null;
		String fileStr = null;

		try {
			br = new BufferedReader(new FileReader(filename));
			while ((fileStr = br.readLine()) != null) {
				String str[] = fileStr.split("-|\\s+");
				for(int index = 0 ; index < str.length; index++){
					if(avoidToken(str[index])) 
						continue;
					tokens.add(postProcessing(str[index].toLowerCase()));
				}
				Collections.sort(tokens);
				System.out.println(fileStr);
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Exception Occoured "+e.getMessage());
		} 
	}

	private boolean avoidToken(String str){
		return (str.contains("<")||str.contains(">")||
				str.equals("a")||str.equals("and")||
				str.equals("in")||str.equals("by")||
				str.equals("from")||str.equals("of")||
				str.equals("the")||str.equals("with")||
				str.equals("an")|| (str.length() == 1)
				);
	}
	
	private String postProcessing(String str){
		if(needProcessing(str)){
			String temp = null;
		  	if(startCheck(str)){
		  		temp = str.substring(1, str.length());
		  	} else if(endCheck(str)){
		  		temp = str.substring(0, str.length()-1);
		  	} else if(endCharSpaceCheck(str)){
		  		temp = str.trim().substring(0, (str.trim().length()-1));
		  	} else if(containsCheck(str)){
		  		temp = str.replace("'", "");
		  	}
		  	return postProcessing(temp);
		}	
		return str;
	}
	
	private boolean startCheck(String str){
		return (str.toString().startsWith("(") ||
				str.toString().startsWith("[") ||
				str.toString().startsWith("\"") ||
				str.toString().startsWith("\'"));
	}
	
	private boolean endCheck(String str){
		return (str.toString().endsWith(")") ||
				str.toString().endsWith("]") ||
				str.toString().endsWith("\"") ||
				str.toString().endsWith("\'"));
	}
	
	private boolean endCharSpaceCheck(String str){
		return (str.toString().endsWith("?") ||
				str.toString().endsWith("!") ||
				str.toString().endsWith(",") ||
				str.toString().endsWith(".") ||
				str.toString().endsWith(";") ||
				str.toString().endsWith(":"));
	}
	
	private boolean containsCheck(String str){
		return (str.contains("'"));
	}
	
	private boolean needProcessing(String str){
		return startCheck(str) || endCheck(str) || endCharSpaceCheck(str) || containsCheck(str);
	}
	
	private void Stem(){
		for(int index = 0; index < tokens.size(); index++){
			String token = tokens.get(index);
			if(token.endsWith("ies") && (!token.endsWith("aies")) && (!token.endsWith("eies"))){
				String temp = token.substring(0, token.length() - 3);
				tokens.remove(index);
				tokens.add(temp+"y");
			} else if(token.endsWith("es") && (!token.endsWith("aes")) && (!token.endsWith("ees")) && (!token.endsWith("oes"))){
				String temp = token.substring(0, token.length() - 2);
				tokens.remove(index);
				tokens.add(temp+"e");
			} else if(token.endsWith("s") && (!token.endsWith("us")) && (!token.endsWith("ss"))){
				String temp = token.substring(0, token.length() - 1);
				tokens.remove(index);
				tokens.add(temp);
			}
		}
		Collections.sort(tokens);
	}
	
	private boolean depricatedProcessingCheck(String str){
		return str.toString().startsWith("(") || 
		str.toString().startsWith("{") ||
		str.toString().startsWith("[") ||
		str.toString().startsWith("\"") ||
		str.toString().startsWith("'") ||
		str.toString().endsWith(")") || 
		str.toString().endsWith("}") ||
		str.toString().endsWith("]") ||
		str.toString().endsWith("\"") ||
		str.toString().endsWith("'") ||
		//(str.length() == 1) ||  NEED INFO
		(str.contains("? ")) ||
		(str.contains(", ")) ||
		(str.contains("! ")) ||
		(str.contains("; ")) ||
		(str.contains(": ")) ||
		(str.contains(". "));
	}
	
	public void readToken(){
		System.out.println("****************READING TOKENS **************");
		for(int index = 0; index < tokens.size(); index++){
			System.out.println(tokens.get(index));
		}
	}

	public void writeToFile(String fileName) throws IOException{
		fileWriter = new FileWriter(fileName);
		for(int index = 0; index < tokens.size(); index++){
			fileWriter.write(tokens.get(index));
			fileWriter.write("\n");
		}
		fileWriter.close();
	}

	public static void main(String arguments[]){
//		String a, s= "Hello.    ";
//		a = s.trim();
//		System.out.println("String Length "+s.length()+"Contains "+s.contains(". ")+"First Char"+a.charAt(a.length()-1));
//		System.out.println("New String"+a.substring(0, a.length()-1)+"Length"+a.length());
//		System.out.println("New Check String"+s.trim().substring(0, s.trim().length()-1)+"Length"+s.trim().length());
//		System.out.println("Check if ' works "+"car's".replace("'", ""));
		try{
			Tokenize token = new Tokenize(arguments[0]);
			System.out.println("Check if white works "+token.postProcessing("car's"));
			token.tokens();
			token.readToken();
			token.Stem();
			token.writeToFile("output.txt");
		} catch (Exception e){
			System.out.println("Exception Occoured "+e.getMessage());
		}


	}
}