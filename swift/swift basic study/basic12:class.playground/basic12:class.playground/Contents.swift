import Swift

//MARK class

class Sample {
    var mutableProperty: Int = 100  //가변 프로퍼티
    let immutableProperty: Int = 100 //불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    //인스턴스 메서드
    func instanceMethod() {
        print("hi")
    }
    //타입 메서드( 재정의 불가 타입 메서드 )
    static func typeMethod() {
        print("bye")
    }
    //재정의 가능 타입 메서드
    class func classMethod() {
        print("goodbye")
    }
}

//MARK 클래스 사용
var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200
//mutableReference.immutableProperty = 200

let immutableReference: Sample = Sample()// 인스턴스 할당 시 var 또는 let을 사용해도 클래스에서 선언된 var형 프로퍼티는 변경 가능

mutableReference.mutableProperty = 200
//immutableReference.immutableProperty = 200


//example
class Student {
    var name : String = "unknown"
    var clas : String = "Swift"
    
    class func selfIntroduce() {
        print("학생타입입니다")
    }
    func selfIntroduce() {
        print("저는 \(self.clas)반 \(name)입니다")
    }
}

Student.selfIntroduce()

var kim: Student = Student()
kim.name = "kim"
kim.clas = "스위프트"
kim.selfIntroduce()
