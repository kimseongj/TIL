import Swift
import Foundation

//인스턴스 생성과 소멸 / 이니셜라이저와 디이니셜라이저

//MARK: - 프로퍼티 기본값

//스위프트의 모든 인스턴스는 초기화와동시에
//모든 프로퍼티에 유효한 값이 할당되어 있어야 함
//프로퍼티에 미리기본값을 할당해두면
//인스턴스가 생성됨과 동시에초기값을 지니게 됨

class PersonA {
    //모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName : String = "nick"
    //클래스 인스턴스가 실제로 이니셜라이즈드 됐을 때 프로퍼티 값에 값들이 있어야 하는 규칙이 있음
    
}

let jason: PersonA = PersonA()
jason.name = "jason"
jason.age = 30
jason.nickName = "j"

//MARK: - 이니셜라이저
//프로퍼티 기본값을 지정하기 어려울 경우 사용 / 이니셜라이저를 통해 인스턴스가 가져야 할 초기값을 전달할 수 있음
class PersonB {
    var name: String
    var age: Int
    var nickName: String
    init(name: String, age: Int, nickName: String){
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나")


//MARK: - 프로퍼티의 초기값이 꼭 필요 없을 때
//옵셔널 사용

class PersonC {
    var name: String
    var age: Int
    var nickName: String?
    
    init(name: String, age: Int, nickName: String) {//convenience init
        self.name = name
        self.age = age
        self.nickName = nickName
    }
    
    init(name: String, age: Int) {//nickName이 옵셔널이기때문에 이니셜라이저 하나 더만들어 놓음
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")

//암시적 추출 옵셔널은
//인스턴스 사용에 꼭 필요하지만
//초기값을 할당하지 않고자 할 때 사용

class Puppy {
    var name: String
    var owner: PersonC!
    
    init(name: String) {
        self.name = name
    }
    func goOut() {
        print("\(name) and \(owner.name)")
    }
}

let happy: Puppy = Puppy(name: "happy")
happy.owner = jenny
happy.goOut()

//MARK: -  실패가능한 이니셜라이저
//이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우
//인스턴스 생성에 실패할수 있음
//인스턴스 생성에 실패하면 nil을 반환함
//그래서 실패가능한 이니셜라이저의 반환타입은옵셔널 타입임

class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age : Int) {
        if (0...120).contains(age) == false {
            return nil
        }
        if name.count == 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

// let john: PersonD = PersonD(name.... 옵셔널이 아니기에 오류 발생
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 10)
let batman: PersonD? = PersonD(name: "", age: 10)

print(joker) //nil
print(batman) //nil


//MARK: - 디이니셜라이저
//deinit은 클래스의 인스턴스가
//메모리에서 해제되는 시점에 호출됨
//인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있음

class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC

    init(name: String, child: PersonC){
        self.name = name
        self.child = child
    }
    deinit {
        if let petName = pet?.name {
            print("\(name) and \(child.name) and \(petName)")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil //donald 인스턴스가 더이상 필요 없어지므로 메모리에서 해재됨
//donald가 jenny에게 happy를 인도함 
