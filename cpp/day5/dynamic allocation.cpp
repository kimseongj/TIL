 #include <iostream>
 using namespace std;

 main(){
     int * ptr_int = new int;
     *ptr_int = 100;

     double* ptr_double = new double;
     *ptr_double = 100.123;

     cout << *ptr_int << endl;
     cout << ptr_int << endl;
     cout << *ptr_double << endl;
     cout << ptr_double << endl;
     
     delete ptr_int;
     delete ptr_double; // new 연산자로 생성된 메모리 변수만 해제 가능
 }

 /* 메모리 동적 할당
 데이터 영역과 스택 영역에 할당되는 메모리의 크기는 컴파일 타임에 미리 결정 
 힙 영역의 크기는 프로그램이 실행되는 도중인 런타임에 사용자가 직접 결정 (동적할당)
 포인터의 가장 큰 목적은 런 타임에 이름 없는 메모리를 할당받아 포인터에 할당받아 포인터에 할당하여, 할당받은 메모리에 접근하는 것이다.
 */ 
