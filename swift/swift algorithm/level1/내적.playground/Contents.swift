import UIKit

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var mult : Int = 0
    var naejuk : Int = 0  // 꼭 실수를 선언해주어야 하는가?
    for i in 0..<a.count { // ..< 의 정확한 의미 알기
     mult = a[i]*b[i]
     naejuk += mult
    
    }
    return naejuk
}
