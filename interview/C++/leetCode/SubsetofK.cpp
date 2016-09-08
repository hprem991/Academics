#include <iostream>
#include <vector>
using namespace std;

class Subset{
	private:
	
	public:
		void subset(vector<int> sofar, vector<int> rest, int setSize){
			if(sofar.size() == setSize){ // successful case
				for(int i = 0 ; i < setSize; i++  )
					cout<<sofar.at(i);
			} 
			
			if(rest.size() == 0){
				 return; // Unsuccessful case 
				}
			//vector<int>::iterator it = sofar.begin();
			for(vector<int>::iterator it = sofar.begin(); it != sofar.end(); it++){
				subset(sofar.push_back(it), rest.erase(it), setSize);
				subset(sofar, rest.erase(it), setSize)
			}
		}	 
};

int main(){
    Subset s;
    vector<int> vec;// = new vector<int>();
    vec.push_back(1);
    vec.push_back(2);
    vec.push_back(3);
    vec.push_back(4);
    vec.push_back(5);
    s.subset(vec, "", 2);
    return 0;
}
