#include<iostream>
using namespace std;

main()
{
    int a=22;
    int b=10;

    if(a<=10){
        a+=a;
    }
    else if(10<a && 20>=a){
        a = a+2;
    }
    else {
    a = b;
    }
    cout << a;

}