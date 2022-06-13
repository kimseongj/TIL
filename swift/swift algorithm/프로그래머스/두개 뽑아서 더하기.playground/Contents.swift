import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result = Set<Int>()
    
    for i in 0..<numbers.count-1 {
        
        for j in 0..<numbers.count-1 {
           if j+1 != i {
                result.insert(numbers[i] + numbers[j+1])
           } else {
               continue
           }
            
        }
    }
    
    return result.sorted()
}
