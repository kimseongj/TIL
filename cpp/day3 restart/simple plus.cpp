#include <iostream>// include define은 선행처리기에 의해 선행 처리됨
#define TEXT "Welcome to C++ Programming!"

int main() // c++ 프로그램에서 main()함수를 찾고 그곳에서 부터 실행을 시작
{
    std::cout << TEXT; // 명령문으로 (;)을 이용하여 문장을 끝냄
    return 0; // 함수의 종료를 의미함. main()함수가 반환되면 프로그램 전체가 종료됨
}
// namespace 이름이 기억되는 영역을 뜻함 클래스, 함수, 변수 등은 std라는 이름 공간에 저장됨 >> (using namespace std)를 사용하여 네임스페이스 이름을 붙이지 않아도 사용할 수 있음
 