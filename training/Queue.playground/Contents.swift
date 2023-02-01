import UIKit



func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    var abc = [T]()
    abc.append(a)
    abc.append(b)
    print(abc)
}

swapTwoValues(a: 1, b: "asd")





