//
//  Model.swift
//  ForCombine
//
//  Created by soobak on 23/02/23.
//

import Foundation
import Combine

struct Food: Decodable {
    let name: String
    let price: Int
    let description: String
}

struct SomeModelV1 {
    private let decoder = JSONDecoder()
    private var subscriber: Set<AnyCancellable> = .init()
    
    func request(
        fromServer server: SomeServer = SomeServer.shared,
        _ completionHandler: @escaping (Food) -> Void
    ) {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            server.forCallback { foodData in
                if let food = try? decoder.decode(Food.self, from: foodData) {
                    completionHandler(food)
                }
            }
        }
    }
    
    func requestByCombine(server: SomeServer = SomeServer.shared) {
        Timer.publish(every: 1.0, on: .current, in: .common)
            .map { eachTime in
                server.forValue() )
            }
    }
}
