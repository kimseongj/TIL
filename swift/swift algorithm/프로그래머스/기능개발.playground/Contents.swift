import Foundation

//solution([93,30,55],[1,30,5])
func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let progress = progresses
    let speed = speeds
    
    var complete = [Int]()
    var a: Int = 0
    var count: Int = 0
    var removeList = [Int]()
    var result = [Int]()
    
    
    
    for i in 0..<progress.count {
       
        
        a = (100-progress[i]) / speed[i]
        if (100-progress[i]) % speed[i] != 0 {
            a += 1
        }
    complete.append(a)
    }
    
//    while !complete.isEmpty  {
//        count = 0
//
//        for j in 0...(complete.count-1) {
//            let now = complete[j]
//            if now >= complete[j] {
//                count += 1
//                complete.remove(at: j)
//            }
//        }
//
//        //0,2
//        result.append(count)
//        for f in removeList {
//            complete.remove(at: f)
//            if complete.count == 0 {
//                return result
//            }
//        }
//
//
//    }
    while !complete.isEmpty {
        let nowDelay = complete.first!
        var count = 0
        while !complete.isEmpty && complete.first! <= nowDelay {
            count += 1
            complete.removeFirst()
        }
        result.append(count)
    }
    
    
    return result
}

solution([93,30,55],[1,30,5])
