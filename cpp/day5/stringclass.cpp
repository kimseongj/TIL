#include<iostream>
using namespace std;

main() {
   string str1 = "C++ Programming";
   string str2 = "is nice";
   cout << str1.length() << endl; // 문자열 길이
   cout << str1 << endl;
   cout << str2 << endl;
   str1 += str2;
   cout << str1;
}
