#include <iostream>
using namespace std;

main(){
    int arr[3] = {10,20,30};
    int* ptr_arr = arr;

    cout << arr[0] << "," << arr[1] << "," << arr[2] << endl;
    cout << ptr_arr[0] << "," << ptr_arr[1] << endl;
    cout << sizeof(arr) << endl;
    cout << sizeof(ptr_arr) << endl;

    cout << *(arr+0) << "," << *(arr+1) << "," << (arr+2);
}