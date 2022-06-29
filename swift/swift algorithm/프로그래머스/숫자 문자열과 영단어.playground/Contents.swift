import Foundation

func solution(_ s:String) -> Int {
    var ss = s

    
    if ss.contains("one"){
        ss = ss.replacingOccurrences(of: "one", with: "1")
    }
    
    if ss.contains("two"){
        ss = ss.replacingOccurrences(of: "two", with: "2")
    }
    
    if ss.contains("zero"){
        ss = ss.replacingOccurrences(of: "zero", with: "0")
    }
    
    if ss.contains("three"){
        ss = ss.replacingOccurrences(of: "three", with: "3")
    }
    
    if ss.contains("four"){
        ss = ss.replacingOccurrences(of: "four", with: "4")
    }
    
    if ss.contains("five"){
        ss = ss.replacingOccurrences(of: "five", with: "5")
    }
    
    if ss.contains("six"){
        ss = ss.replacingOccurrences(of: "six", with: "6")
    }
    
    if ss.contains("seven"){
        ss = ss.replacingOccurrences(of: "seven", with: "7")
    }
    
    if ss.contains("eight"){
        ss = ss.replacingOccurrences(of: "eight", with: "8")
    }
    
    if ss.contains("nine"){
        ss = ss.replacingOccurrences(of: "nine", with: "9")
    }
    
    return Int(ss)!
}
