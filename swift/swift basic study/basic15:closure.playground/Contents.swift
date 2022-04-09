import Swift
import os
//클로저는 실행가능한 코드 블럭이다
//함수와 다르게 이름정의는 필요하지는 않지만, 매개변수 전달과 반환 값이 존재 할 수 있다는 점이 동일함
//함수는 이름이 있는 클로저임
//일급객체로 전달인자

//클로저는 중괄호 {}로 감싸져있음
//괄호를 이용해 파라미터를 정의
//->을 이용해 반환 타입을 명시함
//in 키워드를 이용해 실행 코드와 분리함
/*
 {(매개변수 목록) -> 반환타입 in
   실행코드
}
*/

func sumFunction(a: Int, b: Int) -> Int {
    return a+b
}

var sumResult: Int = sumFunction(a: 1, b: 2)
print(sumResult)

//MARK 클로저
var sum: (Int, Int) -> Int = {(a: Int, b: Int)-> Int in
    return a+b
    
}

sumResult = sum(1,2)
print(sumResult)

sum = sumFunction(a:b:)

sumResult = sum(1,2)
print(sumResult) //3


//MARK 함수의 전달인자로서의 클로저
let add: (Int, Int) -> Int
add = { (a: Int, b: Int)-> Int in
    return a+b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) -> Int in
    return a-b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) -> Int in
    return a/b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {  // 클로저,,, 형태가 왜이러죠
    return method(a,b)
}

var calculated: Int
calculated = calculate(a: 50, b: 10, method: add)
print(calculated)

calculated = calculate(a: 50, b: 10, method : substract)
print(calculated)

calculated = calculate(a: 50, b: 10, method: divide)
print(calculated)
