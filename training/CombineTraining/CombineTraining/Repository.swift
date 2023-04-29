//
//  Repository.swift
//  CombineTraining
//
//  Created by kimseongjun on 2023/04/25.
//

import Foundation
import Combine

class Repository {

    func fetchPublisher<T: Decodable>(endpoint: EndPointMakeable, dataType: T) -> AnyPublisher<T, Error> {
        let dailyBoxOfficeEndpoint = DailyBoxOfficeEndpoint()
        let urlRequest = dailyBoxOfficeEndpoint.makeURLRequest()
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest!).map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

class DailyBoxOfficeViewModel {
    let repository = Repository()
    var subscriber: Set<AnyCancellable> = .init()
    
    @Published var dailyBoxOffice: DailyBoxOffice?
    
    func fetchDailyBoxOffice(completion: @escaping (DailyBoxOffice) -> Void) {
        repository.fetchPublisher().sink { completion in
            print("Rceived completion: \(completion)")
        } receiveValue: { dailyBoxOffice in
            completion(dailyBoxOffice)
        }.store(in: &subscriber)
    }
}
