#include <iostream>
using namespace std;

int recursivesum(int n)
{
    if(n == 1){
        return 1;
    }
    else{
        return n + recursivesum(n-1);

    }
}

main(){
    int var = 10;
    int total;

 total = recursivesum(var);
 cout << total;
}
//재귀함수란 함수 내부에서 함수가 자기 자신을 또 다시 호출하는 것을 뜻함