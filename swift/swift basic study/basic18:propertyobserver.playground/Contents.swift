import Swift

//프로퍼티 감시자를 사용하면 프로퍼티 값이 변경될 때 원하는 동작을 수행할 수 있음
//프로퍼티 감시자는 저장프로퍼티에 사용 가능 변수 값이 변할 때마다 호출되는 함수이기 때문
//연산 프로퍼티에는 사용불가
//MARK: - 프로퍼티 감시자

struct Money {
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("\(currencyRate)에서 \(newRate)으로 변경될 예정")
        }
        didSet(oldRate) {
            print("\(oldRate)에서 \(currencyRate)으로 변경됨")
        }
    }
    var dollar: Double = 0 {
        willSet {
            print("\(dollar)에서 \(newValue)로 변경될 예정임")
        }
        didSet {
            print("\(oldValue)에서 \(dollar)로 변경됨")
        }
    }
    
    var won: Double { // 연산 프로퍼
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
}

//MARK: - 사용
var inMyPocket: Money = Money()
inMyPocket.currencyRate = 1150

inMyPocket.dollar = 10

print(inMyPocket.won)

//프로퍼티 감시자의 기능은
//함수, 메서드, 클로저, 타입 등의 외부에 위치한
//지역/전역 변수에도 모두 사용하능함

var a: Int = 100 {
    willSet {
        print("\(a) and \(newValue)")
    }
    didSet {
        print("\(oldValue) and \(a)")
    }
}

a = 200

