func solution(_ a:Int, _ b:Int) -> String {
    
    var arr = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30,31]
    var week = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]
    var total : Int = 0
    var sum : Int = 0
    
    
    for i in 0..<a {
        sum += arr[i]
    }
    total = sum + b - 1
    
    return week[total%7]
     
    
}
