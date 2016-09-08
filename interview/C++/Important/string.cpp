#include <iostream>

using namespace std;

int GetStringLength(char *firstChar){
  int *counter = new int(0); // I dont know why we have this, may be to check if candidate can handle memory leak ?
  int count;
  while(*firstChar != '\0'){
 	firstChar++;
        (*counter)++;
  }
 count = *counter;
 free(counter);
 return count;
}

int main(){
  int counted = GetStringLength((char *)"value");
  cout<<counted<<endl;
}
