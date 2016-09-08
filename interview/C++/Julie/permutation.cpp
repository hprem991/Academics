#include <iostream>
using namespace std;

static int counter = 0;
// Julie's Code
void RecPermute(string soFar, string rest){
  if(rest == "") {
	cout<<soFar<<endl;
        counter++;
  } else {
	for(int i = 0 ; i< rest.length();i++){
	   string next = soFar + rest[i];
	   string remaining =  rest.substr(0,i)
			     + rest.substr(i+1);
	   RecPermute(next,remaining);	
	}
   }
}
 


int main(){
   RecPermute("","Hello");
   cout<<" Counter "<< counter<<endl;
   return 0;    
 }
