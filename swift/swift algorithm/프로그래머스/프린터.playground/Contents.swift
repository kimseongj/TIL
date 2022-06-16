import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
  var turn = priorities
    var count :Int = 0
    
    var index = location
    while(true) {
    if turn[0] == turn.max() {
        turn.removeFirst()
        count += 1
        
        if index == 0 {
            break
        } else {
            index -= 1
        }
    } else {
        let temp = turn.removeFirst()
        turn.append(temp)
        
        if index == 0 {
            index = turn.count - 1
        } else {
            index -= 1
        }
    }
    }
    return count
}
