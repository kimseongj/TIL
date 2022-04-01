import SwiftUI

let someInteger = 100

//if - else

if someInteger < 100 {// 조건문 소괄호 생략 가능 해도 되고 안해도 되고 대괄호는 생략 절대 불가
    print("100 미만")
}else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
}
//스위프트의 조건에는 항상 bool 타입이 들어와야 함
//some Integer는  Bool타입이 아닌 Int 타입이기 때문에 컴파일 오류 발생
//if someInteger. >>> 오류 발생


//MARK - switch
//범위연산자라고 스위프트에 있는 개념 1..<100 >> 1~99
switch someInteger {
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
}

//정수 외의 대부분의 기본 타입을 사용할 수 있음
//swift의 명확히 case를 명시해야 하며 명시되지 않은 값은 default로 확실히 명시해야 됨 그렇지 않을 경우 오류 발생
//swift switch문의 경우 break가 이미 적용되어 있음. 그래도 사용하고 싶으면 사용 가능 

switch "Kim" {
case "jake":
    print("jake")
    fallthrough//break가 걸리지 않고 그대로 다음 문장 실행
case "mina":
    print("mina")
case "Kim":
    print("Kim")
default:
    print("unknown")
}

