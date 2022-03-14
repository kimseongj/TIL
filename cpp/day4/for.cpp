#include<iostream>
using namespace std;

main(){
    int a = 1;
    int i;
    int sum =0;
    for(i=1;i<10;i++){
    a = a<<1;
    
    sum += a;
    cout << sum << endl;
    }
}