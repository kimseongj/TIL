import Swift

//MARK 프로퍼티
//저장 프로퍼티
//연산 프로퍼티
//타입 프로퍼티

struct Student {
    var name: String = ""
    var clas: String = "Swift" //인스턴스 저장 프로퍼티
    var koreanAge: Int = 0
    var westernAge: Int {// 인스턴스 연산 프로퍼티
        get{                   // 값을 꺼내가기 위해서는 get을 사용
            return koreanAge - 1
        }
        set(inputValue){ // koreanAge값을 받아 계산
            koreanAge = inputValue + 1
        }
    }
    //타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    //읽기 전용 인스턴스 연산 프로퍼티 (쓰기전용은 안되고 읽기+쓰기 전용은 가능)
    var selfIntroduction: String {
        get {
            return "저는 \(self.clas)반 \(name)입니다"

        }
    }
}

//MARK: - 사용

//타입 연산 프로퍼티 사용

var kim: Student = Student()
kim.koreanAge = 26

print("\(kim.koreanAge) and \(kim.westernAge)")

//MARK: - 응용

struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {// set 앞에 매개변수를 안 넣을 경우 newValue 사용하면 됨
            dollar = newValue / currencyRate
        }
    }
}

var inMyPocket = Money()
inMyPocket.won = 11000

print(inMyPocket.won)

inMyPocket.dollar = 10

print(inMyPocket.won)


//MARK: - 지역변수, 전역변수
//저장 프로퍼티와 연산 프로퍼티의 기능은
//함수, 메서드, 클로저, 타입 등의 외부에 위치한
//지역/전역 변수에도 모두 사용 가능함

var a: Int = 100
var b: Int = 200
var sum: Int {
    return a + b
}

print(sum)
