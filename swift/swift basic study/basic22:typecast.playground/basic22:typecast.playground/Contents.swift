import Swift
/*
 -타입캐스팅
 스위프트의 타입캐스팅은 인스턴스의 타입을 확인하는 용도 또는 클래스의 타입으로 사용할 수 있는지 확인하는 용도이며 is, as를 사용
 */

//let someInt: Int = 100
//let someDouble: Double = Double(someInt)// someInt를 Double타입으로 하나 더 생성

//타입 캐스팅을 위한 클래스 정의
class Person {
    var name: String = ""
    func breath() {
        print("숨")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool(){
        print("등교")
    }
}

class UniversityStudent: Student {
var major: String = ""
    func goToMT() {
        print("엠티")
    }
}

var kim: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()

//MARK: - 타입 확인
//is를 사용하여 타입을 확인
var result: Bool
result = kim is Person // true >>kim은 Person타입이므로
result = kim is Student // false
result = kim is UniversityStudent // false


result = hana is Person // true
result = hana is Student // true >>hana는 Student이며 Person을 상속하고 있으므로 두개의 타입을 가짐
result = hana is UniversityStudent // false

result = jason is Person // true
result = jason is Student // true
result = jason is UniversityStudent // true

if kim is UniversityStudent {
    print("kim은 대학생이다")
} else if kim is Student {
    print("kim은 학생")
} else if kim is Person {
    print("kim은 사람")
}

switch kim {
case is Person:
    print("kim은 사람")
case is Student:
    print("kim은 학생")
case is UniversityStudent:
    print("kim은 대학생")
default:
    print("kim은 사람, 학생, 대학생 모두 아님")
}

switch kim {
case is UniversityStudent:
    print("kim은 대학생")
case is Student:
    print("kim은 학생")
case is Person:
    print("kim은 사람")
default:
    print("kim은 사람, 학생, 대학생 모두 아님")
}


//업캐스팅
var mike: Person = UniversityStudent() as Person

var jenny: Student = Student()

var jina: Any = Person()


//다운캐스팅****
//as? 또는 as!를 사용하여
//자식 클래스의 인스턴스로 사용할 수 있도록
//컴파일러에게 인스턴스의 타입정보를 전환해줌
//캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 nil을 반환하기 때문에 결과의 타입을 옵셔널타입으로 해야함
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent
optionalCasted = jina as? UniversityStudent
optionalCasted = jina as? Student


//강제 다운 캐스팅
//as!를 사횽함
//캬스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 오류발생
//캐스팅에 성공하면옵셔널이 아닌 일반 타입을 반환
var forcedCasted: Student

forcedCasted = mike as! UniversityStudent
