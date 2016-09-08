#include <iostream>

using namespace std;

template<typename T>
class Test{
	private:
		T myVal;
	public :
		Test(){
	 	  //Default Constructor	
		} 

		Test(T ValIn){
		   myVal = ValIn;
		}
		
		T getVal(){
			return myVal;
		}
		
		void setVal(T valIn){
		  myVal = valIn;	
		}
};


int main(){
   Test<int> t(5.0);
   Test<double> d(5.1);
   cout<<t.getVal()<<endl;
   cout<<d.getVal()<<endl;
   return 0;
}
