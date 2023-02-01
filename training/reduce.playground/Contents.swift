import UIKit
import Foundation
//
//enum Operator: Character, CaseIterable {
//    case add = "+"
//    case subtract = "-"
//    case divide = "/"
//    case multiply = "*"
//
//    func calculate(lhs: Double, rhs: Double) ->Double {
//
//        switch self {
//        case .add:
//            return add(lhs: lhs, rhs: rhs)
//        case .subtract:
//            return add(lhs: lhs, rhs: rhs)
//        case .divide:
//            return add(lhs: lhs, rhs: rhs)
//        case .multiply:
//            return add(lhs: lhs, rhs: rhs)
//        }
//    }
//
//    func add(lhs: Double, rhs: Double) ->Double {
//        return lhs + rhs
//    }
//    func subtract(lhs: Double, rhs: Double) ->Double {
//        return lhs - rhs
//    }
//    func divide(lhs: Double, rhs: Double) ->Double {
//        return lhs / rhs
//    }
//    func multiply(lhs: Double, rhs: Double) ->Double {
//        return lhs * rhs
//    }
//}
//
//[1,2,3,4,5,6].reduce(0) {
//
//    //$0 + $1
//
//}

//let a = Double("-123.3")!
//let b = 123.3 + a
//print(b)

enum Shoes: String {
    case nike = "나이키"
    case adidas = "아디다스"
    case converse = "컨버스"
}

let a = Shoes(rawValue: "나이키")

