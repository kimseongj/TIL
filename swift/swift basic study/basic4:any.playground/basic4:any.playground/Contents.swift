import UIKit

let integer : Int = 100
let floatingPoint : Float = 12.34
let apple : Character = "A"


/*
 Any - swift의 모든 타입을 지칭하는 키워드
 AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
 nil - 없음을 의미하는 키워드 null가 비슷
 */

var someAny : Any = 100


someAny = "어떤 타입도 수용 가능합니다"
someAny = 123.12
print(someAny)
//let someDouble : Double = someAny    any타입을 double타입에 대입 불가


//AnyObject : 클래스의 인스턴스만 쥐고 있을 수 있다.
class SomeClass {}
var someAnyObject : AnyObject = SomeClass()
//someAnyObject = 123.12 인스턴스 값을 넣어야 함

//nil : null과 같은 용도이며 someAny / someAnyObject에 사용 불가

