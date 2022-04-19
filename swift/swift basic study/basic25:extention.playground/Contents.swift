import Swift

//익스텐션
//익스텐션은 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가하는 것
//기능을 추가하려는 타입의 구현된 소스 코드를 알지 못하거나 볼 수 없다 해도, 타입만 알고 있다면 그 타입의 기능을 확장할 수도 있음

extension Int {
    var isEven: Bool {
        return self%2 == 0
    }
    var isOdd: Bool {
        return self&2 == 1
    }
}


print(1.isEven)
print(2.isEven)
print(1.isOdd)
print(2.isOdd)

var number: Int = 3
print(number.isEven)
print(number.isOdd)

number = 2
print(number.isEven)
print(number.isOdd)

extension Int {
    func multiply(by n: Int) -> Int {
        return self*n
    }
}

print(3.multiply(by: 2))// 6
print(4.multiply(by:5)) // 20

extension String {
    init(int: Int){
        self = "\(int)"
    }
    init(double: Double) {
        self = "\(double)"
    }
}

let stringFromInt: String = String(int: 100)

let stringFromDouble: String = String(double: 100.0)
