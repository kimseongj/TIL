import Foundation

let order1 = BlockOperation {
    print("돈까스")
    print("떡볶이")
}

let order2 = BlockOperation {
    print("튀김 우동")
}

let order3 = BlockOperation {
    print("알리오 올리오")
    print("생맥주 2")
}

let order4 = BlockOperation {
    print("과일 세트")
    print("LA 갈비")
}

let order5 = BlockOperation {
    print("김치전")
    print("바닐라 아이스크림")
}

let orderBar = OperationQueue()
orderBar.maxConcurrentOperationCount = 2

orderBar.addOperation(order1)
orderBar.addOperation(order2)
orderBar.addOperation(order3)
orderBar.addOperation(order4)
orderBar.addOperation(order5)

var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]

let operationQueue = OperationQueue()

operationQueue.
