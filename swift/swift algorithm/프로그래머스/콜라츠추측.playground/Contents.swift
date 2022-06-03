import Swift


func solution(_ num:Int) -> Int {
    var n : Int = 0
    var count : Int = 0
    var x : Int = num
    while x != 1 {
        if x%2 == 0 {
          x = x / 2
            count += 1
        }
        else {
           x = x * 3 + 1
            count += 1
        }
    }
    if count > 500 {
        return -1
    }
    
    return count
}
