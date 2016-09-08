#include <iostream>
#include <typeinfo>
using namespace std;

class base{
public:
	int a;
	base():a(0)
	{}
	int getA(){return a;}
       // int getB() {return -7;} 
};
class der:public base
{
public:
	int b;
	der():b(1)
	{}
	int getB(){return b;}
};
void display(base *obj, int ele)
{
	for(int i = 0; i < ele; i++)
	{
        cout << (obj+i)->getA() <<endl;
	}
}


void displayB(base *obj, int ele)
{
	for(int i = 0; i < ele; i++)
	{
       // cout << (obj+i)->getA() <<"  "<<(obj+i)->getB()<<endl;
	}
}

int main()
{

    int i = 3;
    int j = 3;
    base arrb[5];
    display(arrb, 5);
    der arrd[5];
    display(arrd, 5);
    return 0;
}
