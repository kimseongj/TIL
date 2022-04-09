import Swift

//MARK enum
//enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의함
//각 case는 소문자 카멜케이스로 정의함
//각 case는 그 자체가 고유의값임

/*
 enum 이름 {
    case 이름1
    case 이름2
    case 이름3, 이름4, 이름5
    ...
 */

//MARK 열거형 사용
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue

print(day)

switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}

//MARK 원시값
/*
 c언어의 enum처럼 정수값을 가질 수도 있음
 rawValue를 사용하면 됨
 case별로 각각 다른 값을 가져야함
 */
 
enum Fruit: Int {//Fruit 뒤에 Int는 원시값 타입
    case apple = 0
    case grape = 1
    case peach
// case mango = 0
}

//여기서 peach에서 2가 나오는 이유는 0,1,... 값을 집어넣지 않아도 1씩 증가되기 때문이다.

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
//Fruit.peach.rawValue == 2

enum School: String {
case elementary = "초등"
case middle = "중등"
case high = "고등"
case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")
//School.middle.rawValue == 중등

print("School.university.rawValue == \(School.university.rawValue)")
// School.university.rawValue == university > 문자열의 경우 순차적 증감이 안됨

//MARK: 원시값을 통한 초기화
//rawValue를 통해 초기화 할 수 있음
//rawValue가 case에 해당하지 않을 수 있으므로
//rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입임

//let apple: Fruit = Fruit(rawValue: 0) >>> 오류 케이스가 없으면 생성이 안될 수도 있어 nil이 나올 수 있기 때문
let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 ㅇ벗다")
}

//MARK:- 메소드
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("Spring~")
        case .jun, .jul, .aug:
            print("Summer~")
        case .sep, .oct, .nov:
            print("autumn")
        case .dec, .jan, .feb:
            print("winter")
        }
    }
}

Month.mar.printMessage()
