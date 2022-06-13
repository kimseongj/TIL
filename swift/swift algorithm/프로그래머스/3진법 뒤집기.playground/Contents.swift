//import Foundation
//func solution(_ n:Int) -> Int {
//
//}
import Foundation

func solution(_ n:Int) -> Int {
    var a :Int = n
    var b :Int = 0
    var c :Int = 0
    var arr = [Int]()
    var result :Int = 0


while a != 0 {
    b = a%3
    a /= 3
    arr.append(b)
}
arr.reverse()

for i in 0..<arr.count {
    c = Int(pow(3.0 ,Double(i)))
    result += arr[i]*c
}
return result
}

