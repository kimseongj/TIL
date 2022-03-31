import Swift

//함수의 선언

/*func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입...) ->반환타입 {
함수 구현부
 return 반환값
 } */

func sum(a: Int, b: Int) -> Int{
    return a + b
}

func printMyName(name: String) -> Void {
    print(name)
}

func printYourName(name : String) {// 생략 상관 없음
    print(name)
}


//매개변수가 없는 함수
func maximumIntegerValue() -> Int {
    return Int.max
}

func hello(){ print("hello")}
//함수 호출
sum(a:3, b:5)
printMyName(name:"KIm")
printYourName(name:"Seo")
maximumIntegerValue()
hello()
