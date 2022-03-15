#include<iostream>
using namespace std;

main(){
   int x =7;
   int *ptr = &x;
   int **pptr = &ptr; // x에 7대입,, ptr에 pptr 대입,, 

    int num1 = 1234;
    double num2 = 3.14;

    int* ptr_num1 = &num1;
    double* ptr_num2 = &num2;

    cout << sizeof(ptr_num1)<<endl;
    cout << ptr_num1 << endl; // 주소값
    cout << *ptr_num1 << endl; // 주소가 가리키는 값
    cout << ptr_num2 << endl;
    cout << *ptr_num2;
}