import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var yesan = d
    var budget1 = budget
    var count : Int = 0
    yesan.sort()
    
    for i in yesan {
        budget1 -= i
        count += 1
        if  budget1 == 0 {
            break
        } else if budget1 < 0{
            count -= 1
            break
        } else {
            continue
        }
    }
    
    return count
}


