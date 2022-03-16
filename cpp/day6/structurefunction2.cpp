#include<iostream>
using namespace std;

struct Prop
{
    int savings;
    int loan;
};

int CalcProperty(Prop*);

int main(void){
    int hong_prop;
    Prop hong = {1000000, 400000};

    hong_prop = CalcProperty(&hong);


    cout << hong_prop;

}

int CalcProperty(Prop*money)
{
    money -> savings = 100;
    return (money ->savings - money ->loan);
}

//구조체의 주소를 함수의 인수로 전달함