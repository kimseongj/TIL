import Swift

//Optional : 값이 있을수도, 없을수도 있음
//필요 이유 : nil의 가능성을 명시적으로 표현 / 문서 작성 시간 절약 / 전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않더라도 안심하고 사용 / 예외상황을 최소화 하는 안전한 코딩
//Optional을 사용하지 않고 nil사용 불가

var optionalValue : Int! = 100// optional 표현
switch optionalValue {
case.none:
    print("This Optional variable is nil")
case.some(let value):
    print("Value is \(value)")
}

var optionalValue: Int? = 100
switch optionalValue {
case.none:
    print("This Optional variable is nil")
case.some(let value):
    print("Value is \(value)")
}

//MARK optional unwrapping
/*
 Optional Binding : 옵셔널 바인딩 nil체크 + 안전한 값 추출
 Force Unwrapping : 강제 추출
 */

/*
 func printName(name : String) {
 print(name)
 }
 var myName : String? = nil
 printName(myName) >> 이때 전달되는 값의 타입이 옵셔널이므로 서로 다른 타입임 오류 발생
 */
 
func printName(_ name: String){
    print(name)
}
var myName : String! = nil

if let name : String = myName {
    printName(name)
} else {
    print("myName == nil")
}
//name 상수는 if-let구문 내에서만 사용 가능


//옵셔널값 강제 추출
func printName(_ name: String){
    print(name)
}
var myName: String? ="Kim"
printName(myName!)
myName = nil
//print(myName!) 강제추출시 값이 ㅇ벗으므로 런타임 오류 발생

var yourName: String! = nil

