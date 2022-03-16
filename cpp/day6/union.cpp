#include <iostream>
using namespace std;

union ShareData
{
    unsigned char a;
    unsigned short b;
    unsigned int c;
};

int main(void){
    ShareData var;
    var.c = 0x12345678;

    cout << hex;
    cout << var.a << endl;
    cout << var.b << endl;
    cout << var.c;
    return 0;
}

//공용체 : 모든 면에서 구조체와 같으며, 모든 멤버 변수가 하나의 메모리 공간을 공유한다는 점만이 다르다. / 모든 멤버 변수가 같은 메모리를 공유하기 때문에 공용체는 한번에 하나의 멤버 변수밖에 사용할 수 없음.                   var에 대해 char / short / int 각각으로 표현 가능.