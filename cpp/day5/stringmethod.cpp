#include<iostream>
using namespace std;

main() {
    string str1 = "Hello";
    string str2 = "World";
    cout << str1.length() << endl; //문자열의 길이
    cout << str1.size() <<endl; //객체가 메모리에서 실제로 사용하고 있는 크기
    
    str1.append("zzzzaaa", 3,7); // 문자열 4번째부터 7까지 추가
    cout << str1 << endl; 
    str2.append(4,'x'); //x를 4번 추가
    cout << str2 << endl;    

    cout << str1.find("He") << endl;

}