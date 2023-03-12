import UIKit
import Combine

//var myPublisher: Publishers.Sequence<[Int], Never> = [1, 2, 3].publisher


class DJViewModel {
    
    @Published var dj: [Person] = []
    var cancelBag = Set<AnyCancellable>()
    
    func requestDJ() {
        let url = URL(string: "http://localhost:8080/getJSON")!// URL 받고
        URLSession.shared.dataTaskPublisher(for: url)
            //.print()
            .map(\.data) // 받아온 JSON 데이터 배열로 만들고,
            .decode(type: [Person].self, decoder: JSONDecoder()) // 디코딩
            .replaceError(with: [])
            //.eraseToAnyPublisher()
            .assign(to: \.dj, on: self)// dj에 값이 들어가고 
            .store(in: &self.cancelBag)
    }
}
