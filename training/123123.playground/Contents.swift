import UIKit

//print("123.123+1234".split(whereSeparator: { $0.isNumber }).filter { !$0.contains(".")})
//var a = [1, 2]
//    a.insert(4, at: 0)
//var b = "1234"
//b.insert("1", at: 0)

//enum NumberCase: String{
//case zero = "0"
//case doubleZero = "00"
//case dot = "."
//}
//
//print(NumberCase.zero)

//Double("0")
//
//let numberFormatter = NumberFormatter()
//numberFormatter.numberStyle = .decimal
//numberFormatter.maximumFractionDigits = 20
//let a = 0.0
//numberFormatter.string(from: a)
//
//numberFormatter.

//enum Operator: Character, CaseIterable {
//    case add = "+"
//    case subtract = "−"
//    case divide = "÷"
//    case multiply = "×"
//}
//
//extension String {
//    func split(with target: Character) -> [String] {
//
//        return split(separator: target).map { String($0) }
//    }
//}
//
//var numbers = ["1+2−3+4"]
//
//Operator.allCases.forEach { `operator` in
//   numbers = numbers.map { $0.split(with: `operator`.rawValue) }.flatMap { $0 }
//}
//
//[1, [2-3], 4]
//var a = "123456"
//
//a.dropLast()
////a.removeLast()
//print(a)

extension String {
    func abc() -> String {
      return self + "123"
       
    }
}

"12345".abc()

for i in "12345" {
    print(i is String)
}


