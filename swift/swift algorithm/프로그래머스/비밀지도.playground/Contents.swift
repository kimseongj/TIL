func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for i in 0..<n {
       var result = String(arr1[i] | arr2[i], radix : 2)
        result = String(repeating: "0", count : n-result.count)+result
        var result1 = Array(result)
        
        for j in 0..<result1.count{
            if result1[j] == "1" {
                result1[j] = "#"
            } else {
                result1[j] = " "
            }
        }
        var result2 = String(result1)
        
        answer.append(result2)
    }
    
    
    return answer
}







//다른 사람의 풀이
//func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
//    var answer: [String] = []
//
//    for i in 0..<n {
//        var bitwise = String(arr1[i] | arr2[i], radix: 2)
//        bitwise = String(repeating: "0", count: n-bitwise.count) + bitwise
//        answer += [bitwise.reduce("", { $0 + ($1 == "1" ? "#" : " ") })]
//    }
//
//    return answer
//}
//
