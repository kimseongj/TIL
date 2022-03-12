#include<iostream>
using namespace std;
main()
{
// 자동 타입 변환
    int num1 = 3.1415;
    int num2 = 8.3E12;
    double num3 = 5;

    cout << num1 << endl;
    cout << num2 << endl;
    cout << num3 << endl;

// 강제 타입 변환
    int num4 = 1;
    int num5 = 4;

    double result1 = num4/num5;
    double result2 = (double)num4/num5;
    double result3 = double(num4)/num5;

    cout << result1 << endl;
    cout << result2 << endl;
    cout << result3;
    /* 
    result1 : int형으로 계산하였으므로 정수로 나옴
    result2 : double형으로 num4를 형변환하여 실수로 나옴(하나만 바꿔도 실수로 변경됨)
    result3 : C++에서만 사용 가능한 타입변환 스타일
    */
}

/* 타입 변환 
1. 다른 타입끼리의 대입, 산술 연산 시
2. 함수에 인수를 전달할 때
종류
1. 자동 타입 변환(묵시적 타입 변환)
: 컴파일러가 자동으로 타입 변환
2. 강제 타입 변환(명시적 타입 변환)
: 사용자가 타입 캐스트 연산자를 사용하여 강제적으로 수행하는 타입 변환을 가리키는 것 

*/