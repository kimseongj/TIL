#include<iostream>
using namespace std;

inline int Sub(int x, int y) {return x-y;}

int main(void)
{
    int num1 = 5, num2 = 3;
    int result;

    result = Sub(num1, num2);
    cout << result;
    return 0;
}
//인라인 함수 : 함수가 호출될 때 일반적인 함수의 호출 과정을 거치지 않고, 함수의 모든 코드를 호출된 자리에 바로 삽입하는 방식의 함수이다.