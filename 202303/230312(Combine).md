```swift
class DJViewModel {
    
    @Published var dj: [Person] = []
    var cancelBag = Set<AnyCancellable>()
    
    func requestDJ() {
        let url = URL(string: "http://localhost:8080/getJSON")!
        URLSession.shared.dataTaskPublisher(for: url)
            //.print()
            .map(\.data)
            .decode(type: [Person].self, decoder: JSONDecoder())
            .replaceError(with: [])
            //.eraseToAnyPublisher()
            .assign(to: \.dj, on: self)
            .store(in: &self.cancelBag)
    }
}
```



Combine 프레임워크에 속한 타입이다.

Publisher 

- 게시자로 관심 있는 값이나 이벤트를 게시할 수 있다.

- publisher는 2가지종류의 이벤트를 발생시킬 수 있는데, 값과 완료 이벤트를 발생시킬 수 있다.
  - 완료 이벤트의 종류는 `.finished`와 오류이다.



구독방법

1. `assign`을 이용해서 UI컴포넌트에 직접 값을 할당할 수 있는 방법
2. sink를 이용해서 수신 값을 처리하는것과 완료 이벤트를 수신처리하는 클로저로 값을 처리하는 방법 
3. 게시자를 구독하고 작업이 끝나면 **자원을 확보하기 위해 구독을 취소해줘야 하는데 Cancellable**타입을 이용해서 처리해야 한다.
   - 이 때,  `cancel()`메서드를 사용하기 위해 `Cancellable`프로토콜을 준수해야 한다.
   - `cancel()`을 호출하지 않으면, 게시자가 완료될때까지 혹은 메모리 관리로 인해 저장된 구독이 해제될때까지 계속 존재한다.
   - ` cancel()`을 호출해서 구독을 해제시킬 수 있다.
   - 혹은 `.store()`를 사용해서 AnyCancellable을 저장해놓고 해당 변수가 해제될 때 구독을 취소하는 방식이 있다.
4. 구독을 하면 `AnyCancellable`인스턴스를 반환하고 이를 처리해줘야 한다. 





sink는 Subscriber의 일종



```Swift
import Foundation
import Combine

class MainViewRepository {
    @Published var recommendCocktailList: [MainPage] = []
    var cancelBag = Set<AnyCancellable>()
    
    func requestCocktailList() {
        guard let url = URL(string: "") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [MainPage].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .assign(to: \.recommendCocktailList, on: self)
            .store(in: &self.cancelBag)
    }
}

//class에서만 언래핑되는 이유가 뭐지
```



