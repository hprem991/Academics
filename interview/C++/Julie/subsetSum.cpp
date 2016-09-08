#include <iostream>
using namespace std;

static int counter  = 0 ;
// Julie's code
void RecSubsets(string soFar, string rest){
 if(rest == ""){
        counter++;
	cout<<soFar<<endl;
  } else {
	RecSubsets(soFar + rest[0], rest.substr(1));
	RecSubsets(soFar, rest.substr(1));
   }
}

int main(){
  RecSubsets("","hello");
  cout<<"Count "<<counter<<endl;
  return 0;
}
