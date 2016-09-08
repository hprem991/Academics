#include <iostream>

using namespace std;

class Interleave {
	private:
		string str1, str2;

	public:
		Interleave(string s1, string s2){
			this->str1 = s1;
			this->str2 = s2; 
		} 

		void process(string s1, string s2, int len1, int len2, string sofar){
			//cout << sofar <<endl;
			if((len1 == s1.length()) && (len2 ==  s2.length())){
				cout << sofar <<endl;
				return;
			} if(len1 < s1.length()){
			//	cout <<"Case 1 "<< sofar + s1[len1] <<endl;
				process(s1, s2, len1 + 1, len2, sofar + s1[len1]);	
			} if(len2 < s2.length()){
			//	cout <<"Case 2"<< sofar + s2[len2]<<endl;
				process(s1, s2, len1, len2 + 1, sofar + s2[len2]);
			}
		}	
};


int main(){
	Interleave interleave("hel", "oo");
	interleave.process("abc", "de", 0, 0, "");
	return 0;
}
