import Swift

//스위프트 상속은 클래스, 프로토콜에서 사용 가능
// 열거형, 구조체는 상속이 불가능함
//스위프트는 다중상속을 지원하지 않음

//MARK: - 클래스의 상속과 재정의
/*
 class 이름: 상속받을 클래스 이름 {
    구현부
 }
 */

class Person {
    var name: String = ""
    func selfIntroduce() {
        print("\(name)")
    }
    //final을 사용하여 재정의 방지
    final func sayHello(){
        print("hello")
    }
    //타입 메서드는 재정의가 불가능
    static func typeMethod() {
        print("type method - static")
   
    //클래스 메서드는 재정의 가능
        class func classMethod() {
            print("type method - class")
    
    //재정의 가능한 class 메서드라도 final 키워드를 사용하면 재정의라고 할 수 없음
    // static과  final class는 동일 역할
            final class func finalClassMethod() {
                print("type method - final class")
            }
        }
        class Student: Person {
            //var name: String = "". >> name은 상속을 받았기 때문에 다시 정의하면 오류 발생
            var major: String = ""
            override func selfIntroduce() { //부모 클래스 메소드에 덮어 씌운것
                print("\(name) and \(major)")
            }
            //super.selfIntroduce() 부모 클래스의 메소드를 가져온 것
            
            override class func classMethod() {
                print("overriden type method - class") //재정의 가능
            
            //override staatic func typeMethod() {}
            //static 메서드는 재정의 불가
                override func sayHello() {}
                override class func finalClassMethod() {}
            //final키워드를 사용한 것 또한 재정의 불가
            }
            let yagom: Person = Person()
            let hana: Student = Student()
            
            yagom.name = "yagom"
            hana.name = "hana"
            hana.major = "swift"
            
            yagom.selfIntroduce()
            //저는 yagom입니다
            
            hana.selfIntroduce()
            //저는 hana이고, 전공은 swift입니다
            
    }
}

