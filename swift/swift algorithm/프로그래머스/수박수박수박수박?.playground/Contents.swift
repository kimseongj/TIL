func solution(_ n:Int) -> String {
   var result : String = ""
    
    for i in 1...n {
        if i%2 == 1 {
            result += "수"
        } else {
        result += "박"
    }
    }
    
    
    return result
}
