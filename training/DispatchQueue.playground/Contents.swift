import Foundation

//DispatchQueue.main.async {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}
//
//DispatchQueue.main.async {
//    for _ in 1...5 {
//        print("🥶🥶🥶🥶🥶")
//    }
//}

//import Foundation
//
//DispatchQueue.main.async {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}
//
//for _ in 1...5 {
//    print("🥶🥶🥶🥶🥶")
//    sleep(2)
//}


//global().async

//DispatchQueue.global().async {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...5 {
//        print("🥶🥶🥶🥶🥶")
//        sleep(2)
//    }
//}
//
//DispatchQueue.main.async {
//    for _ in 1...5 {
//        print("🥵🥵🥵🥵🥵")
//        sleep(1)
//    }
//}


import Foundation

var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let semaphore = DispatchSemaphore(value: 2)

for _ in 1...5 {
    let card = cards.removeFirst()
    DispatchQueue.global().async {
        if true {
            semaphore.wait()
            
            print("야곰: \(card) 카드를 뽑았습니다!")
            Thread.sleep(forTimeInterval: 1.3)
            print("야곰 \(card) 뽑기 끝")
            semaphore.signal()
        }
    }
}

//for _ in 1...5 {
//    DispatchQueue.global().async {
//            semaphore.wait()
//            let card = cards.removeFirst()
//            print("야곰: \(card) 카드를 뽑았습니다!")
//            Thread.sleep(forTimeInterval: 1.3)
//            print("야곰 \(card) 뽑기 끝")
//            semaphore.signal()
//    }
//}
