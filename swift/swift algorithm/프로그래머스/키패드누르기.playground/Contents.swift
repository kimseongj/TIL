import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var lp : Int = 10
    var rp: Int = 11
    var result : String = ""
    
    let na :[[Int]] = [[3,1],[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2],[3,0],[3,2]]
    
    
    for i in numbers {
        
      
        
        if i == 1 || i == 4 || i == 7 {
            lp = i
            result += "L"
        } else if i == 3 || i == 6 || i == 9 {
            rp = i
            result += "R"
        } else {
            if abs(na[i][0] - na[lp][0]) + abs(na[i][1] - na[lp][1]) < abs(na[i][0] - na[rp][0]) + abs(na[i][1] - na[rp][1]) {// 왼쪽손이 더 가까운 경우
                lp = i
                result += "L"
            } else if abs(na[i][0] - na[lp][0]) + abs(na[i][1] - na[lp][1]) > abs(na[i][0] - na[rp][0]) + abs(na[i][1] - na[rp][1]) { // 오른쪽 손이 더 가까운 경우
                rp = i
                result += "R"
            } else {
                if hand == "right" {
                    rp = i
                    result += "R"
                } else if hand == "left"{
                    lp = i
                    result = "L"
                }
            }
        }
    }
    return result
}







