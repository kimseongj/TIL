func solution(_ board:[[Int]], _ moves:[Int]) -> Int {

    var board1 = board
    var box = [Int]()
    var count :Int = 0
    
    for j in moves {
        for i in 0..<board1.count {
            if board1[i][j-1] != 0 {
                if box.count != 0 && box.last! == board1[i][j-1] {
                    box.removeLast()
                    board1[i][j-1] = 0
                    count += 2
                    break
                }
                
            
                box.append(board[i][j-1])
                
                board1[i][j-1] = 0
                
                break
            }
        }
        
        
    }
    
    
    return count
}

solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])
    
