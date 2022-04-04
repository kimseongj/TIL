import Swift

//구조체
//swift 구조체는 타입을 정의하는 것이기 때문에 uppercase camel 사용
//메소드 : 특정 타입의 클래스, 구조체, 열거형과 관련된 함수를 지칭
//MARK - 프로퍼티 및 메서드
struct Sample {
    var mutableProperty: Int = 100 //가변 프로퍼티
    let immutableProperty: Int = 100 //불변 프로퍼티
    static var typeProperty: Int = 100 //타입 프로퍼티
   
    //인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    //타입 메서드 :
    static func typeMethod() {
        print("type method")
    }
    
}
//변경 가능 인스턴스
var mutable : Sample = Sample()

//불변 인스턴스
let immutable : Sample = Sample()

struct Student {
    var name : String = "unknown"
    var clas : String = "Swift" //강세표를 통해 class라는 변수 이름 선언할 수 있다고 함
    
    static func selfIntroduce() {
        print("학생타입입니다")
    }
    func selfIntroduce()
    {
        print("저는\(self.clas)반 \(name)입니다")
    }
}

Student.selfIntroduce()

var kim: Student = Student()
kim.name = "kim"
kim.clas = "swift"
kim.selfIntroduce()
