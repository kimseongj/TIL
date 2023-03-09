import UIKit



protocol 도형 {
    var 면:Int { get }
    func 면개수계산(면의개수: Int) -> String
}

extension 도형 {
    func 면개수계산(면의개수: Int) -> String {
        return "\(면의개수)각형"
    }
}


class Triangle: 도형 {
    var 면: Int {
        return 4
    }
}

let triangle = Triangle()
triangle.면개수계산(면의개수: triangle.면)

