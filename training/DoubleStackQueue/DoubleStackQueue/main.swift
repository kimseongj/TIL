//
//  main.swift
//  DoubleStackQueue
//
//  Created by kimseongjun on 2023/01/25.
//

import Foundation

struct QueueStack<T> {

    private var dequeueStack: [T] = []
    private var enqueueStack: [T] = []

    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }

    var peek: T? {
        return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }

    mutating func enqueue(item: T) {
        enqueueStack.append(item)
    }

    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
        //Removes and returns the last element of the collection.
    }
}

var abc = QueueStack<String>()
abc.enqueue(item: "1")
print(abc.peek ?? "asd")
print(abc.dequeue()!)


//struct QueueStack {
//
//    private var dequeueStack: [String] = []
//    private var enqueueStack: [String] = []
//
//    var isEmpty: Bool {
//        return dequeueStack.isEmpty && enqueueStack.isEmpty
//    }
//
//    var peek: String? {
//        return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
//    }
//
//    mutating func enqueue(item: String) {
//        enqueueStack.append(item)
//    }
//
//    mutating func dequeue() -> String? {
//        if dequeueStack.isEmpty {
//            dequeueStack = enqueueStack.reversed()
//            enqueueStack.removeAll()
//        }
//        return dequeueStack.popLast()
//        //Removes and returns the last element of the collection.
//    }
//}
//
//var abc = QueueStack()
//abc.enqueue(item: "1")
//print(abc.peek ?? "axd")
//print(abc.dequeue())
