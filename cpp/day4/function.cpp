#include<iostream>
using namespace std;

int func(int,int); // 함수의 원형선언(c언어에서 필요)

main(){
    int result;
    result = func(3,5);
    printf("더 큰수는 %d\n", result);
    result = func(4,3);
    printf("더 큰수는 %d\n", result);
    result = func(10,43);
    printf("더 큰수는 %d\n", result);

}

int func(int num1, int num2){
    if(num1 >= num2)
    {
        return num1;
    }
    else
    {
        return num2;
    }
}
