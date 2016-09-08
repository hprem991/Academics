import java.lang.*;
import java.util.*;

class Inter{
	public static boolean isInter(String s1, String s2, String s3){
		for(int i=0; i<s3.length() -1 ; i++){
		  System.out.println("Match s1 "+s1.charAt(0)+
				     " s2 "+s2.charAt(0)+" s3 "+s3.charAt(i));
			if(!s2.isEmpty() &&  s3.charAt(i) == s2.charAt(0)){
				s2 = s2.substring(1);
				//s3 = s3.substring(1);
				System.out.println("s2 Matched "+s2+" s3 "+s3);
			} else {
			  if(!s1.isEmpty() && s3.charAt(i) == s1.charAt(0)){
				s1 = s1.substring(1);
				//s3 = s3.substring(1);
				System.out.println("s1 Matched "+s1+" s3 "+s3);
			   } else {
			   System.out.println("s1 "+s1+" s2 "+s2+" s3 "+s3);
			   return false;
				}
			}
		}
	    return true;
	}

	public static void main(String a[]){
		System.out.println(isInter("aabccc","dbbca","aadbbbaccc"));
	}
}
