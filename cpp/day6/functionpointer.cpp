#include <iostream>
using namespace std;

double Add(double, double);
double Sub(double, double);
double Mul(double, double);
double Div(double, double);
double Calculator(double, double, double (*func)(double, double));

int main(){
    double(*calc)(double, double) = NULL;
}




//함수 포인터 : 프로그램에서 정의된 함수는 프로그램이 실행될 때 모두 메인 메모리에 올라감, 이때 함수의 이름은 메모리에 올라간 함수의 시작 주소를 가리키는 포인터 상수가 된다.