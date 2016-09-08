	// Returns true if there is a subset of set[] with sun equal to given sum
	static void isSubsetSum(ArrayList<Integer> list, int index, int limit, int sum, ArrayList<Integer> currentList)
	{
	   // Base Cases
	   if (sum == limit) {
		   PrintElem(currentList);
		   return;
	   } if (index == -1 && sum != limit)
	         return;
	 
	   // If last element is greater than sum, then ignore it
	   if ((sum + list.get(index)) > limit)
	      isSubsetSum(list, index-1, limit, sum, currentList);
	 
	   /* else, check if sum can be obtained by any of the following
	      (a) including the last element
	      (b) excluding the last element   */
	   
	    ArrayList<Integer> next = (ArrayList<Integer>)currentList.clone();
	    ArrayList<Integer> remaining = (ArrayList<Integer>)list.clone();
	    next.add(index);
	    remaining.remove(index);
	    
	    isSubsetSum(remaining, index-1, limit, (sum + list.get(index)) , next);
	    isSubsetSum(list, index-1, limit, sum, currentList);
	}
	
