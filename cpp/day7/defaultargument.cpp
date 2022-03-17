#include<iostream>
using namespace std;

void Display(int x, int y, char ch ='a', int z= 10);


int main(void){
Display(1,2);
Display(3,5,'b');
Display(5,6,'c',9);
//Display(7,8, , 9); 오류


}


//디폴트 인수 : 기본값이 미리 정의되어 있는 인수를 의미 / 함수를 호출할 때 인수를 전달하지 않으면, 함수는 자동으로 미리 정의되어 있는 디폴트 인수값을 사용하게 됨 / 물론 인수를 전달하여 함수를 호출하면, 디폴트 인수값이 아닌 전달된 인수를 가지고 함수를 호출하게 됨 /오른쪽에서 왼쪽으로 지정 가능