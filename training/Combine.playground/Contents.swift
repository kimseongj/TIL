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

class MyPublisher: Publisher {
    typealias Output = String
    
    typealias Failure = Never
    
    func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, String == S.Input {
        <#code#>
    }
}

class MySubscriber: Subscriber {
    typealias Input = String
    
    typealias Failure = Never
    
    // Publisher가 Subscription을 주면 호출되는 메서드
    // 즉, subscriber에게 publisher를 성공적으로 구독했음을 알리고 item을 요청할 수 있음
    func receive(subscription: Subscription) {
        <#code#>
    }
    
    // Publisher가 주는 output을 처리
    // subscriber에게 publisher가 element를 생성했음을 알림
    func receive(_ input: String) -> Subscribers.Demand {
        <#code#>
    }
    
    
    // subscriber에게 publisher가 정상 작동 혹은 오류로 publish를 완료했음을 알림
    func receive(completion: Subscribers.Completion<Never>) {
        <#code#>
    }
}
