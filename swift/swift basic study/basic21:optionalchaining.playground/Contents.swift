import Swift

//옵셔널 체이닝
//옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
//또다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있음

class Person {
    var name: String
    var job: String?
    var home: Apartment?

    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var guar : Person?
    var owner: Person?
    
    init(dong: String, ho: String){
        buildingNumber = dong
        roomNumber = ho
    }
}

let kim: Person? = Person(name: "Kim")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

//옵셔널 체이닝 실행 후 결과값이 nil일 수  있으므로
//결과 타입도 옵셔널임

//옵셔널 체이닝을 사용하지 않을 경우 아래 방식으로 풀어나가야 함
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home{
            if let guar = home.guar{
                if let guardJob = guar.job {
                    print("\(guardJob)")
                } else {
                    print("asdasdasd")
                }
            }
        }
    }
}
guardJob(owner: kim)

func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guar?.job {//순차적으로 nil인지 확인하며 nil일 경우 멈추고 nil을 리턴해줌
        print("\(guardJob)")
    } else {
        print("no guard")
    }
}

guardJobWithOptionalChaining(owner: kim)

kim?.home?.guar?.job

kim?.home = apart

kim?.home?.guar

kim?.home?.guar = superman

kim?.home?.guar

kim?.home?.guar?.name
kim?.home?.guar?.job

kim?.home?.guar?.job = "경비원"

//nil 병합 연산자
var guardJob: String

guardJob = kim?.home?.guar?.job ?? "슈퍼맨" // job의 값이 nil일 경우 guardJob에 "슈퍼맨" 할당됨
print(guardJob)

kim?.home?.guar?.job = nil

guardJob = kim?.home?.guar?.job ?? "수퍼맨"
print(guardJob)
