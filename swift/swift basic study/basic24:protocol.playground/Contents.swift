import Swift

// 프로토콜
// 특정 역할을 수행하기 위한 메서드, 프로퍼티, 이니셜라이저 등의 요구사항을 정의

//구조체, 클래스, 열거형은 프로토콜을 채택해서 프로토콜의 요구사항을 실제로 구현할 수 있음
//어떤 프로토콜이 요구사항을 모두 따르는 타입은 그 '프로토콜을 준수함'이라고 표현함

/*
 protocol 프로토콜 이름 {
    정의
 }
 */

protocol Talkable {
    // 프로퍼티 요구
    // 프로터피 요구는 항상 var 키워드만 사용 가능
    // get은 읽기만 가능해도 상관 없다는 뜻
    // get과 set을 모두 명시하면
    // 읽기 쓰기 모두 가능한 프로퍼티여야 함
    var topic: String {get set}
    var language: String {get}
    
    
    // 메서드 요구
    func talk()
    
    // 이니셜라이저 요구
    init(topic: String, language: String)
}

//MARK: - 프로토콜 채택 및 준수


//Person 구조체는 Talkable 프로토콜을 채택

struct Person: Talkable {
    var topic: String
    let language: String //상수로 선언할 경우 get(읽기 전용)일때만 가능하며, get set일 경우 set은 쓰기 역할이기 때문에 오류가 발생
    
    //읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체가 가능
    var langugage: String {return "한국어"}
    
    //읽기 쓰기 프로퍼티 또한 연산 프로퍼티로 대체 가능
//    var subject: String = ""
//    var topic: String {
//        set {
//            self.subject = newValue
//        }
//        get {
//            return self.subject
//        }
//    }
    func talk() {
        print("\(topic)에 대해 \(language)로 말함")
    }
    
    init(topic: String, language: String) {
        self.topic  = topic
        self.language = language
    }
    
}

//Mark: - 프로토콜 상속
// 프로토콜은 클래스와 다르게 다중상속이 가능
/*
protocol 프로토콜 이름: 부모 프로토콜 이름 목록 {
 정의부
 }
*/

protocol Readable {
    func read()
}
protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    //func read()
    func speak()
}
protocol ReadWriteSpeakable: Readable, Writeable {
    //func read()
    //func write() 상속되어 있어 이미 있음
    
    func speak()
}

struct SomeType: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    func write() {
        print("Write")
    }
    func speak() {
        print("Speak")
    }
}



//MARK: - 클래스 상속과 프로토콜
//클래스에서 상속과 프로토콜ㄹ 채택을 동시에 하려면
//상속받으려는 클래스를 먼저 명시하고
//그 뒤에 채택할 프로토콜 목록을 작성
class SuperClass: Readable {
    func read() { print("read")}
}
class SubClass: SuperClass, Writeable, ReadSpeakable {
    func write() {print("write")}
    func speak() {
        print("speak")
    }
}


//MARK: - 프로토콜 준수 확인
//인스턴스가 특정 프로토콜을 준수하는지 확인할 수 있음
//is, as 연산자 사용

let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()

var someAny: Any = sup
someAny is Readable
someAny is ReadSpeakable

someAny = sub
someAny is Readable
someAny is ReadSpeakable

someAny = sup

if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
}

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable{
    someReadSpeakable.speak()
}

someAny = sub

if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
    
}

