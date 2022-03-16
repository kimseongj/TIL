#include<iostream>
using namespace std;

enum Weather {sunny = 0, cloud = 10, rain = 20, snow = 30};

int main(void){
    int input;
    Weather wt;

    cout << "sunny = 0, cloud =10, rain =20, snow = 30" << endl;
    cin >> input;
    wt = (Weather)input;

    switch (wt)
    {
        case sunny:
            cout << "GOOD";
            break;
        case cloud:
            cout << "SOSO";
            break;
        case rain:
            cout << "BAD";
            break;
        case snow:
            cout << "SO BAD";   
            break;
        default :
            cout << "TRY AGAIN";                         
    }
}
//열거체 : 새로운 타입을 선언하면서 동시에 그 타입이 가질 수 있는 정수형 상숫값도 같이 명시한다.