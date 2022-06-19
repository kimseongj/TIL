//// 나의 풀이 (for문과 while문에서 오류가 계속 발생 ㅠ)
//import Foundation
//
//func solution(_ clothes:[[String]]) -> Int {
//
//
//
//    var clothe1 = clothes
//    var clothe = [String]()
//    var total = [Int]()
//    var count : Int = 0
//
//    var result : Int = 1
//
//
//    for j in 0..<clothes.count {
//        clothe.append(clothe1[j][1])
//    }
//
//
//    while true {
//        count = 0
//        var removeList = [Int]()
//        for i in 0...(clothe.count-1) {
//            if clothe[0] == clothe[i] {
//                count += 1
//                    removeList.append(i)
//            }
//        }
//
//        for f in removeList {
//            clothe.remove(at: f)
//        }
//        removeList.removeAll()
//        total.append(count+1)
//
//        if clothe.count == 0 {
//            break
//        }
//    }
//
//
//    for g in total {
//        result *= g
//    }
//
//
//    return result-1
//}
//
//solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]])
//
//
//
//

 
import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var type = [String: Int]()
    var count :Int = 1
    
    
    for clothe in clothes {
        if type[clothe[1]] == nil {  // 딕셔너리 외에는 사용 잘 안할 듯 
            type[clothe[1]] = 1
        } else {
            type[clothe[1]]! += 1
        }
        
        //if type[clothe[1]] != nil {
          //  type[clothe[1]]! += 1
        //} else {
         //   type[clothe[1]] = 1
        //}
    }
    
    for (_ , value) in type {
         
        count *= (value+1)
    }
    
    return count-1
    
    
}



solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]])
