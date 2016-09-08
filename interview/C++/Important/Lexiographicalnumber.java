public class Solution {
    
    public boolean helper(int n, int cnt, List<Integer> lst){
        if(cnt <= n) {
             // System.out.println("Added "+cnt);
              for(int i=0; i<= 9; i++){
                   String val;
                   if(cnt == 0){
                       if(i == 9) // This check removes duplicate creation
                           break; 
                       val = ""+ (i+1); 
                   }  else {
                       val  = "" + cnt + i;
                   }
                   //System.out.println("New String "+val);
                   int cal = Integer.parseInt(val);
                   lst.add(cal);
              
                   if(!helper(n, cal, lst)) {
                    //   System.out.println("Removing String "+val);
                       lst.remove(new Integer(cal));
                       break;
                   }
               }
        } else {     
            return false;
        }
        return true;    
    }
    
    public List<Integer> lexicalOrder(int n) {
        List<Integer> lst = new ArrayList<Integer>();
        helper(n, 0, lst);
        return lst;
    }
}
