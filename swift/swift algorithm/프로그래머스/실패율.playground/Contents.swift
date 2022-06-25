////https://keeplo.tistory.com/435
//
//func solution(_ N:Int, _ stages:[Int]) -> [Int] {
//    var fail:Dictionary = [Int:Double]()
//
//    // 실패율 계산 후 저장
//    for i in 1...N{
//        // 도달한 수
//        let a = stages.filter{$0 >= i}.count
//
//        // 클리어한 수
//        let b = a - stages.filter{$0 > i}.count
//
//        // 실패율
//        let failCount = Double(b) / Double(a)
//
//        fail[i] = failCount
//    }
//
//    // 실패율이 높은 순서대로 내림차순 숫자 등록, 실패율이 같으면 오름차순
//    let failSorted = fail.sorted(by: <).sorted(by: {$0.value > $1.value})
//
//    return failSorted.map{$0.key}

//import Foundation
//
//func stay(_ N:Int, _ stages: [Int]) -> [Int] {
//    var stucked = [Int](repeating: 0, count: N-1) // 스테이지 단계 == 인덱스+1 // 이고 스테이지 안에 갯수 있음
//    for stage in stages {
//        stucked[stage-1] += 1
//    }
//    return stucked // 인덱스+1 이 단계 이고 값이 개수임
//}
//
//// 함수 리턴 타입 설정 해줄것
//func failure(_ N: Int, _ stages: [Int], _ stucked: [Int]) ->
//{
//    var failures = Array(repeating: Float(0), count: N) // 실패율 계산을 위한 Float형 변환
//    var players = stages.count // 게임에 참여한 플레이어 수
//
//    for i in 0..<N {
//        failures[i] = Float(stucked[i]) / Float(players)// 실패율 계산        players -= stucked[i]
//        players -= stucked[i]
//    }
//        return failures
//}
//
//func Answer(_ failures: [Float]) -> [Int] {
//    return failures.enumerated().sorted(by: { $0.element > $1.element}).map{ $0.offset + 1}
//}
//
//
//func solution(_ N:Int, _ stages:[Int]) -> [Int] {
//
//
//}
//
////https://sweetdev.tistory.com/313


import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    let stucked = calcStucked(N, stages)
    let failures = calcFailures(N, stages, stucked)
    let answer = getAnswer(failures)
    return answer
}

func calcStucked(_ N: Int, _ stages: [Int]) -> [Int] {
    var stucked = Array(repeating: 0, count: N+1)
    for stage in stages {
        stucked[stage-1] += 1
    }
    return stucked
}

func calcFailures(_ N: Int, _ stages: [Int], _ stucked: [Int]) -> [Float] {
    var failures = Array(repeating: Float(0), count: N)
    var players = stages.count
    for i in 0..<N {
        failures[i] = Float(stucked[i]) / Float(players)
        players -= stucked[i]
    }
    return failures
}

func getAnswer(_ failures: [Float]) -> [Int] {
    return failures
        .enumerated()
        .sorted(by: { $0.element > $1.element})
        .map{ $0.offset + 1}
}
