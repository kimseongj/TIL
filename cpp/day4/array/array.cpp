#include<iostream>
using namespace std;

main(){
    int sum = 0;
    int grade[3];
    grade[0] = 85;
    grade[1] = 65;
    grade[2] = 90;
    
    for(int i=0;i<3;i++)
    {
        sum+=grade[i];
    }
    cout << "총 점수 합계"<< sum << "평균" <<(double)sum/3;
}