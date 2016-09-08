

void moveTower(int n, char src, char dst, char tmp){
   if(n > 0){
	moveTower(n-1,src, tmp, dst);
	MoveSingle(src,dst);
	moveTower(n-1,tmp, dst, src);
   }
}
