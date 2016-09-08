#include <iostream>

using namespace std;

int main(){
        int M=256, N=19; //out = 256 + 12 + 64 = 332 
	int i = 2,j = 6;
	int mask, left, right;
	int allOnes = ~0;
        left = allOnes<<j; right = allOnes>>i;
	mask = left | right;
	int align = N << i;
	int cleared = M & mask;;
	int inserted = M | align;
	cout<<"Masking "<<inserted<<endl;
	return 0; 
}
