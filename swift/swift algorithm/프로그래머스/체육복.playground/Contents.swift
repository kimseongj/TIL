//
//import Foundation
//
//func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
//    var narr = [Int](repeating: 1, count: n)
//    var count : Int = 0
//    for i in lost {
//        narr[i-1] = 0
//    }
//    for j in reserve {
//        narr[j-1] = 2
//    }
//
//    for f in 0..<n {
//        if narr[f] == 0 {
//            if f == 0 {
//                if narr[f+1] == 2 {
//                    narr[f] = 1
//                    narr[f+1] = 1
//                } else {
//                    continue
//                }
//            }
//
//            if narr[f-1] == 2 {
//                narr[f] = 1
//                narr[f-1] = 1
//                continue
//            }
//            if narr[f+1] == 2 {
//                narr[f] = 1
//                narr[f+1] = 1
//
//            }
//            if f == n-1 {
//                if narr[f-1] == 2{
//                    narr[f] = 1
//                    narr[f+1] = 1
//                } else {
//                    continue
//                }
//            }
//        }
//
//    }
//    for g in 0..<n {
//        if narr[g] == 0 {
//            count += 1}
//    }
//
//    return n - count
//}
//
//어디가 문제인지 찾지 못했다. 다른 사람이 푼것을 보니 유사하게 작성하였지만... if문에서 예외처리가 제대로 안된 모양이다..



import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {

    // 가지고 있는 체육복 개수 저장 (기본적으로 1벌)
    var students = [Int](repeating: 1, count: n)
    
    // 잃어버린 사람은 체육복 0벌
    for l in lost {
        students[l-1] = 0
    }
    // 여벌 가져 온 사람은 +1 벌
    for r in reserve {
        students[r-1] += 1
    }
    
    var count = 0 // 체육복을 빌리지 못한 학생 수
    for i in 0..<n {
        if students[i] == 0 {
            if i>0 && students[i-1] > 1 {
                // 앞번호 학생에게 빌린다.
                students[i] = 1
                students[i-1] = 1
            } else if i<n-1 && students[i+1] > 1 {
                // 뒷번호 학생에게 빌린다.
                students[i] = 1
                students[i+1] = 1
            } else {
                // 빌리지 못했다.
                count += 1
            }
        }
    }
    
    return n - count
}
