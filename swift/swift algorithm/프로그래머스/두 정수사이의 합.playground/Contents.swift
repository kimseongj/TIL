import UIKit

func solution(_ a:Int, _ b:Int) -> Int64 {
    var sum : Int = 0
    if a < b {
    for i in a...b {
        sum += i
    }
    } else if a > b {
        for i in b...a {
            sum += i
        }
    } else {
        sum = a
    }
    return Int64(sum)
}
