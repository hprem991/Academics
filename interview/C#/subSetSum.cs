/******************************************************************
***     THE FOLLOWING CODE IS PROGRAMMED USING ONLINE IDE
***     HENCE, PLEASE TEST IT AS ACCORIDNG TO YOUR OWN ENVIRONMENT	
***     AND FILE EXTENSION, I DIDN'T HAS IDE FOR C#, HENCE TOOK
***     IDEONE.COM HELP FOR CODING AND RESTRUCTURING
********************************************************************/ 

using System.IO;
using System.Collections;
using System;
using System.Collections.Generic;

public class Program
{
   static void PrintElem(List<int> currentList){
 		for(int i=0;i<currentList.Count;i++)
 			Console.Write(currentList[i]);
 		Console.WriteLine("\n");
     }
    

	static void isSubsetSum(List<int> list, int index, int limit, int sum, List<int> currentList)
	{

	   // Base Cases
	   if (sum == limit) {
		   PrintElem(currentList);
		   return;
	   } if (index == -1) {
	       return;
	   }
		
	   // If last element is greater than sum, then ignore it
	   if ((sum + list[index]) > limit)
	      isSubsetSum(list, index-1, limit, sum, currentList);
	 
	   /* else, check if sum can be obtained by any of the following
	      (a) including the last element
	      (b) excluding the last element   */
	   
	    List<int> next = new List<int>(currentList);
		List<int> remaining = new List<int>(list); 
	    next.Add(index);
	    remaining.Remove(index);
	    
	    isSubsetSum(remaining, index-1, limit, (sum + list[index]) , next);
	    isSubsetSum(list, index-1, limit, sum, currentList);
	}
	
     static void PrintSumCombinations(List<int> numbers, int n){
	   List<int> currentList = new List<int>();
	   if(numbers.Count< 0){
		    return;
	   } else {
		   for(int count = 0; count < numbers.Count ;count++){
			   if(numbers[count] > 0) {
				   currentList.Add(numbers[count]);
			   }
		   }
		   isSubsetSum(currentList, (currentList.Count - 1), n, 0, new List<int>());
	    }	  
	 }
	 
    public static void Main()
    {
        List<int> l = new List<int>();
		l.Add(1);l.Add(1);l.Add(2);l.Add(2);l.Add(4);
		PrintSumCombinations(l,4);
    }
}



