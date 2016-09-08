#include<iostream>

using namespace std;

template<typename a, typename b>
int sum(a aIn, b bIn){
  return (aIn + bIn);
}

int main(){
   cout<<sum(1,2)<<endl;	
   return 0;
}
