import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var arr = [Int]()
    var garo :Int = 0
    var sero :Int = 0
    
if yellow >= 4{
    for g in 2...yellow/2 {
        var s :Int = 0
        if yellow%g == 0 {
            s = yellow/g
            if s <= g && brown == g*2 + s*2 + 4 {
                garo = g
                sero = s
                arr.append(garo+2)
                arr.append(sero+2)
                break
                
            }
        } else {
            continue
        }
        
    }
} else {
        arr.append(yellow+2)
        arr.append(3)
}
    
    
    
    return arr
}


solution(24,24)
