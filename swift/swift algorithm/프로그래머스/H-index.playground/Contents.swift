//import Foundation
//
//func solution(_ citations:[Int]) -> Int {
//    var cita = citations
//    var counto :Int = 0
//
//    cita.sort( by : > )
//
//    if cita.first! == 0 {
//        return 0
//    }
//
//
//
//    for i in 0..<cita.count-1 {
//        if i+1 == cita.count-1 && cita[i+1] >= counto+1 {
//            counto += 1
//            break
//        }
//        if i+1 <= cita[i]{
//            counto += 1
//            if counto >= cita[i+1] {
//                break
//            }
//        }
//
//    }
//
//
//    return counto
//}
//
import Foundation

func solution(_ citations:[Int]) -> Int {
    var cita = citations
    var count :Int = 0
    
    cita.sort( by : > )
    
for i in 0..<cita.count {
    if i+1 <= cita[i] {
        count += 1
    }
}

    return count
}

//세상 허무하군요 ㅎ
