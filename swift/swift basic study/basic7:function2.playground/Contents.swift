import Swift

//매개변수 기본값
//기본값을 갖는 매개변수는 매개변수 목록 중에 뒤쪽에 위치하는 것이 좋음

func greeting(friend: String, me:String = "Kim"){//기본값을 갖는 매개변수를 뒤쪽에 위치시킨 모습
    print("Hello\(friend)!I'm\(me)")
}
//매개변수 기본값을 가지는 매개변수는 생략할 수 있음
greeting(friend:"hana")
greeting(friend:"john", me:"eric")


//전달인자 레이블
//함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용
//greeting이라는 함수를 전달인자 레이블 to와 from을 통해 함수 중복 정의
//함수 내부에서는 매개변수를 사용하고 함수 외부에서는 외부인자 레이블을 사용해야 함
func greeting(to friend: String, form me: String){
     print("Hello\(friend)! I'm\(me)")
}

//함수를 호출할 때에는 전달인자 레이블을 사용해야 함
greeting(to: "hana", from: "kim")


//가변 매개변수
//전달 받을 값의 개수를 알기 어려울 때 사용할 수 있음 (((((형태>>>> 매개변수이름 : 매개변수타입...
//가변 매개변수는 함수당 하나만 가질 수 있음

func sayHelloFriends(me: String, friends: String...) -> String{// friends문에 ...을 두어 가변 매개변수 사용
    return "hello\(friends)! I'm\(me)!"
}

print (sayHelloFriends(me: "Kim", friends : "haha", "eric", "chris"))

//데이터 타입으로서의 함수
//스위프트 함수는 일급객체로 변수, 상수 등에 저장이 가능하고 매개변수를 통해 전달할 수도 있음

//함수의 타입 표현
//반환타입을 생략할 수 없음

var someFunction: (String, String) -> Void = greeting(to:from:)//someFuction이라는 변수에 greeting이라는 함수 집어넣음
someFunction("eric","Kim")

someFunction = greeting(friend:me:)
someFunction("eric", " Kim")



//********someFunction = sayHelloFriends(me: friends:) 가변매개변수로 타입이 달라 함수를 할당할 수 없다

func runAnother(function: (String, String) -> Void){
    function("Jenny", "Mike")
}

runAnother(function: greeting(friend:me:))

runAnother(function: someFunction)



