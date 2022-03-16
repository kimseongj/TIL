#include<iostream>
using namespace std;

void value(int);

void reference(int&);

int main(void) {
    int var = 10;
    cout << var << endl;

    value(var);
    cout << var << endl;

    reference(var);
    cout << var;



}

void value(int a){
    a += 10;
}

void reference(int& b) {
    b +=10;
}

//call by value(값에 의해 전달) : 인수로 전달되는 변수가 가지고 있는 값을 함수 내의 매개변수에 복사하는 방식
//call by reference(참조에 의한 전달) : 전달된 변수의 값을 복사하는 것이 아닌, 원본 데이터를 직접 전달하는 것 (참조자를 사용하여 전달)