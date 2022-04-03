import Swift

//MARK 함수 선언
//반환값 있는 함수
func sum(a: Int, b: Int) -> Int{
    return a + b
}

// 반환값이 없는 함수
func printMyName(name : String) -> Void {
    print(name)
}

func printYourName(name: String) {
    print(name)
}

// 매개변수가 없는 함수
func maximumIntegerValue() -> Int {
    return Int.max // 변수 선언이 안되어 있음
}


//매개변수와 반환값이 없는 함수
func hello() { print("bye") }


//함수에 기본값이 들어가 있는 상황
func greeting(friend : String, me : String = "kim"){
    print("Hello\(friend)! I'm \(me)")
}

greeting(friend: "hana")// 매개변수 기본값을 가지는 매개변수는 생략 가능

//MARK 전달인자 레이블
func greeting(to friend: String, from me: String){
    print("Hello\(friend)! i'm \(me)")
}

greeting(to: "hana", from: "yagom")


//MARK 가변 매개변수
//전달받을 값의 갯수를 알 수 없을때 사용
//가변 매개변수는 함수당 하나만 가질 수 있음
func sayHelloToFriends(me: String, friends: String...)-> String {
    return "\(friends) and \(me)"
}

print(sayHelloToFriends(me: "Kim", friends: "eric","chris"))

//
//var someFunction: (String, String) -> Void = greeting(to:from:)
//someFunction("eric", "koin")


//MARK for
var integers = [1,2,3]
var people = ["Kim": 10, "eric": 15, "mike": 12]
for integer in integers {// 이때 integer는 임의의 이름임 sj ,ksj 다 가능
    print(integer)
}

for(name, age) in people{
    print("\(name) and \(age)")
}


//MARK while
while integers.count > 1 {
    integers.removeLast()
}

//MARK repeay-while
repeat {
    integers.removeLast()
} while integers.count > 0



//func printName(_ name: String){
//}
//printName(name: "ksj") >>> printName("ksj")
