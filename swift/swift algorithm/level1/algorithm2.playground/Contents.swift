// 하샤드의 수 

func solution(_ x:Int) -> Bool {
    var sum : Int = 0
    var temp : Int = x
    var abc : Int = 0
    
    while temp != 0 {
    abc = temp%10
    temp = temp/10
    sum += abc
    }
    // 2403 / 10 = 240
    // 240 / 19 = 24
    // 24 / 10 = 2
    // 2/ 10 = 0
    
    if x%sum  == 0 {
    return true
    } else {
    return false
    }
}
