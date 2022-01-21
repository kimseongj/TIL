#include <iostream> //입출력을 위한 헤더 파일(라이브러리)
using namespace std;
//include문과 define문은 모두 선행처리기에 의해 처리되는 선행처리문
#define TEXT "Welcome to C++ Programming"
int main() // main 함수 발견 못하면 컴파일러는 오류를 발생 시킴
{
    cout << TEXT;//네임스페이스란 이름이 기억되는 영역을 뜻함
    
    return 0; //반환문은 함수의 종료를 의미 main 함수가 반환되면 프로그램 전체 종료
}