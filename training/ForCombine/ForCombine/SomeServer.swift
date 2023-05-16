//
//  Server.swift
//  ForCombine
//
//  Created by soobak on 23/02/23.
//
import Foundation
import Combine

final class SomeServer {
    static let shared = SomeServer()
    private init () { }
    private var randomIndex: Int {
        Int.random(in: 0..<dummyData.count)
    }
    
    func forCallback(_ callback: @escaping (Data) -> Void) {
        DispatchQueue.global()
            .asyncAfter(deadline: .now() + 0.5) {
                callback(dummyData[self.randomIndex].data(using: .utf8)!)
            }
    }
    
    func forValue() -> AnyPublisher<Data, Never> {
        Just(dummyData[randomIndex].data(using: .utf8)!)
            .delay(for: 0.5, scheduler: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
    
    func makePublisher() {
        
    }
}

private let dummyData = [
"""
{
    "name":"김치찌개",
    "price":8000,
    "description":"돼지고기냐 참치냐 그것이 문제로다"
}
""",
"""
{
    "name":"커피",
    "price":2000,
    "description":"식후땡"
}
""",
"""
{
    "name":"컵라면",
    "price":1000,
    "description":"다이어트할때 더 생각남"
}
""",
"""
{
    "name":"스팸",
    "price":3500,
    "description":"아침엔 스팸, 점심엔 스팸, 저녁엔 스팸"
}
""",
"""
{
    "name":"부채살 크림 파스타",
    "price":10000,
    "description":"면곱배기는 서비스"
}
"""
]
