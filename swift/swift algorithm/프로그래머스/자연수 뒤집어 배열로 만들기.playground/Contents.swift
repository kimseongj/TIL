import UIKit

func solution(_ n:Int64) -> [Int] { 
    var reverse = [Int]()
    var temp : Int = Int(n)
    while temp != 0 {
    reverse.append(temp%10)
    temp /= 10
    }
    
    return reverse
}
