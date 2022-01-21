#include <iostream>
using namespace std;
// << : 삽입연산자 >> : 추출연산자
int main ()
{
    int age;
    cout << "여러분의 나이를 입력해 주세요";
    cin >> age;

    cout << "여러분의 나이는" << age << "살 입니다" << endl;

    return 0;
}