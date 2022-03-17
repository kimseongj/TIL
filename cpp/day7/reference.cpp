#include <iostream>
using namespace std;

struct Book
{
    string title;
    string author;
    int price;
};

void Display(const Book&);

int main(void){
    Book web_book = {"HTML CSS","Hong", 28000};
    Display(web_book);
    return 0;
}

void Display(const Book& bk){
    cout << bk.title << endl;
    cout << bk.author << endl;
    cout << bk.price;
}

//참조자 C++에서 특정 변수의 실제 이름 대신 사용할 수 있는 참조자라는 새로운 기능이 추가됨. 이러한 참조자는 크기가 큰 구조체와 같은 데이터를 함수의 인수로 전달해야 할 경우에 사용할 수 있음 / 참조자는 주로 구조체와 같은 사용자 정의 타입을 다룰 때 유용하게 사용됨 