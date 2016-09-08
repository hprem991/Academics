
int []P = new int[T.length];
int currentCenter = 0, rightWall = 0;

for(int i = 0 ;i< T.length - 1; i++ ){
   int mirror = 2 * currentCenter - 1;
   if(i < rightWall){
		P[i] = Math.min(rightWall - i, P[mirror]);
	} 
	
   while(T[i + (1 + P[i])] == T[i - (1 + P[i])]){
	P[i]++; // Expanding the palindrome count
   }

  if(i + P[i] > 0){
	currentCenter = i;
	rightWall = i + P[i];
 }

}
