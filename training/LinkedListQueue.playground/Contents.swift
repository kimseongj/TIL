import UIKit


final class Node<T> {
    let data: T
    var next: Node<T>?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    mutating func enqueue(data: T) {
        if head == nil {
            head = Node.init(data: data)
            tail = head
        }
        
        let newNode = Node.init(data: data)
        
        tail?.next = newNode
        tail = newNode
//        tail?.next = Node.init(data: data)
//        tail = Node.init(data: data)
    }
    
    mutating func dequeue() -> T? {
        if head == nil {
            return nil
        }
        let dequeue = head
        head = head?.next
        dequeue?.next = nil
        
        return dequeue?.data
    }
}
