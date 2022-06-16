//import Foundation
//
//func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {// 다리 배열
//    var sum :Int = 0 // 현재 얼만큼 무게 있는지
//    var count: Int = 0 // 시간 초
//    var countsum: Int = 0 // 결과
//    var bridge = [Int]()
//    for i in 0..<truck_weights.count {
//
//        bridge = [Int](repeating: 0, count: bridge_length)
//        count = 0
//        bridge.append(truck_weights[i])
//        bridge.removeFirst()
//        sum += truck_weights[i]
//
//        if sum+truck_weights[i+1] > weight {
//
//            while bridge.isEmpty != true {
//                bridge.removeFirst()
//                count += 1
//            }
//            sum = 0
//            count += 1
//        }
//        countsum += count
//
//
//    }
//    return countsum
//}
//
////solution(2,10,[7,4,5,6])
//     solution(100,100,[10])



func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var ret: Int = 1
    var trucks: [Int] = Array(repeating: 0, count: bridge_length)
    var array = truck_weights
    var total: Int = 0
    for t in array {
        if total+t-trucks[0] > weight {
            while total+t-trucks[0] > weight {
                total -= trucks[0]
                trucks.removeFirst()
                trucks.append(0)
                ret += 1
            }
            total -= trucks[0]
            trucks.removeFirst()
            trucks.append(t)
            total += t
            ret += 1
        } else {
            total -= trucks[0]
            trucks.removeFirst()
            trucks.append(t)
            total += t
            ret += 1
        }
    }
    return ret + bridge_length - 1
}
