//
//  main.cpp
//  SubSet
//
//  Created by Admin on 7/10/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include <iostream>
#include <vector>

using namespace std;

class SubSet{
    private:
    
    public :
    void subSet(vector<int> sofar, vector<int> rest, int setSize){
        if(sofar.size() == setSize){
            for(int i = 0; i <= setSize; i++ )
            cout<<sofar[i];
            cout<<endl;
        }
        if(rest.size() == 0)
            return;
        for(vector<int>::iterator it = sofar.begin(); it != sofar.end(); it++) {
       //         subSet(sofar.push_back(*it), rest.erase(it), setSize);
        //        subSet(sofar, rest.erase(it), <#int setSize#>);
            }
    }
    
    
    void combintation(string sofar, string rest, int size){
        if("" == rest) {
            if(sofar.length() == size)
                    cout<<sofar<<endl;
        } else {
             combintation(sofar + rest[0], rest.substr(1), size);
             combintation(sofar, rest.substr(1), size);
           }
       }
    
    
    
    void subSetString(string sofar,string rest, int size){
        if("" == rest){
            return; // unsuccessful case
        } else {
        
        if(sofar.length() == size){
            cout<<sofar<<endl;
        }
        
        for(int i=0;i < rest.length() ; i++){
            string next = sofar + rest[i];
            string remainder = rest.substr(0,i) + rest.substr(i+1);
            subSetString(next, remainder, size);
        }
      }
    }
};

int main(int argc, const char * argv[]) {
    // insert code here...
    //std::cout << "Hello, World!\n";
    SubSet s;
    //s.subSetString("", "12345", 3);
    s.combintation("", "12345", 3);
    return 0;
}
