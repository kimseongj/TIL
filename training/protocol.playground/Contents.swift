//import UIKit
//
//// 스케쥴 관리, 전화받기, 운전하기
//
//protocol Secretary {
//    var name: String { get }
//    var age: Int { get }
//
//    func manageSchedule()
//    func takeAPhone()
//    func drive()
//}
//
//extension Secretary {
//    func manageSchedule() {
//        print("extension테스트 스케쥴")
//    }
//}
//
//struct Kim: Secretary {
//    var name: String = "Kim"
//    var age: Int = 27
//    var gender: String = "Man"
//
//    func manageSchedule() {
//        print("일정을 잡았습니다!")
//    }
//
//    func takeAPhone() {
//        print("전화를 받았습니다")
//    }
//
//    func drive() {
//        print("운전중")
//    }
//
//    func eat() {
//        print("밥먹는중입니다. 일 안해요.")
//    }
//}
//
//struct Park: Secretary {
//    var name: String = "Park"
//    var age: Int = 29
//    var gender: String = "Woman"
//
//    func manageSchedule() {
//        print("일정 잡았당께")
//    }
//
//    func takeAPhone() {
//        print("전화를 받았당께")
//    }
//
//    func drive() {
//        print("운전중이랑께")
//    }
//
//    func smoke() {
//        print("담배만 피고 할게요. 잠시만요.")
//    }
//
//}
//
//struct Lee: Secretary {
//    var name: String = "Lee"
//    var age: Int = 30
//    var gender: String = "Man"
//
//    func takeAPhone() {
//        print("전화를 받았수다!")
//    }
//
//    func drive() {
//        print("운전중이올시다.")
//    }
//}
//
//struct Boss {
//    var name: String
//    var company: String
//
//    var secretary: Secretary
//}
//
//var kim = Kim()
//var park = Park()
//var lee = Lee()
//
//var vetto: Boss = .init(name: "Vetto", company: "VettoCompany", secretary: kim)
//var songjun: Boss = .init(name: "Songjun", company: "SongCompany", secretary: park)
//
//var secretary1: Secretary = Kim()
//var secretary2: Secretary = Park()
//var secretary3: Secretary = Lee()
//
////MARK: 인스턴스에 있고, 프로토콜에 없는 함수 호출해보기
//// secretary1.eat() -> 접근 불가
//secretary1.drive() // "운전중입니다!" 프린트
////secretary2.smoke() -> 접근 불가
//secretary2.drive() // "운전중이랑께" 프린트
//
////MARK: extension을 통해 기본 메서드 정의
//secretary1.manageSchedule() // "일정을 잡았습니다!" 프린트
//secretary3.manageSchedule() // "extension테스트 스케쥴" 프린트

var a: [String: Int] = ["a": 2, "b": 3]
var b: [String: Int] = ["c": 4, "d": 5]

a = b
print(a)
