import UIKit

enum abc: Character, CaseIterable {
    case car = "a"
    case bee = "b"
    case apple = "c"
}

var list = [String]()

for a in abc.allCases {
    print(a.rawValue)
}

for b in abc.allCases {
    print(b)
}
