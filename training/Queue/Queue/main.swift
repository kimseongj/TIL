//
//  main.swift
//  Queue
//
//  Created by kimseongjun on 2023/01/25.
//

import Foundation

protocol CalculatorItem {
    
}

extension String: CalculatorItem {
    
}

struct CalculatorItemQueue<T> {

    var queue: [T?] = []
    var head: Int = 0
    var isEmpty: Bool {
        return queue.isEmpty
    }

    mutating func enqueue(item: T) {
        queue.append(item)
    }

    mutating func dequeue() -> T? {
        guard head <= queue.count, let item = queue[head] else { return

            nil }
        queue[head] = nil
        head += 1

        if head > 10 {
            queue.removeFirst(head)
            head = 0
        }
        return item
    }

    var calculatedValue: Double = 0
}

var a = CalculatorItemQueue<Int>()
a.enqueue(item: 3)
print(a.queue)
print(a.dequeue())



//struct CalculatorItemQueue {
//
//    var queue: [String?] = []
//    var head: Int = 0
//    var isEmpty: Bool {
//        return queue.isEmpty
//    }
//
//    mutating func enqueue(item: String) {
//        queue.append(item)
//    }
//
//    mutating func dequeue() -> String? {
//        guard head <= queue.count, let item = queue[head] else { return nil }
//        queue[head] = nil
//        head += 1
//
//        if head > 10 {
//            queue.removeFirst(head)
//            head = 0
//        }
//        return item
//    }
//
//    var calculatedValue: Double = 0
//}
//
//var a = CalculatorItemQueue()
//a.enqueue(item: "3")
//print(a.queue)
//
//
//
//print(a.dequeue())
//
//let ab: Int? = nil

