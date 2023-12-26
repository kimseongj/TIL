## Combine

### dataTaskPublisher

<img width="890" alt="image" src="https://github.com/kimseongj/TIL/assets/88870642/04da3d5b-563c-4246-a6ba-1cb76c456f13">

- `URL`을 매개변수로 받고, `URLSession.DataTaskPublisher`를 리턴한다.
- **task 성공 시**
  data와 `URLResponse`로 이루어진 튜플을 반환
- **task 실패 시**
  error를 반환





## runloop VS DispatchQueue







Protocol에 @Published 래퍼를 사용하는 방법

![image](https://github.com/kimseongj/TIL/assets/88870642/86b12744-b083-4aaf-afc0-fd95aae2c7cc)

```swift
protocol ViewModelProtocol {

    // Define name publisher
    var namePublisher: Published<String>.Publisher { get }
}

class MyViewModel: ViewModelProtocol {

    @Published var name: String
    
    // Manually expose name publisher in view model implementation
    var namePublisher: Published<String>.Publisher { $name }

    init(name: String) {
        self.name = name
    }
}
```

@Published로 래핑된 프로퍼티는 Protocol에 선언할 수 없습니다. 

Publisher를 직접 Protocol에 구현하는 것은 가능합니다. 



https://swiftsenpai.com/swift/define-protocol-with-published-property-wrapper/

# Combine

## 🟡 나만의 정의 



\- 비동기적인 기능을 구현하기 위해 만들어졌습니다. 

\- 변화를 살피기 위해 최적화된 프레임워크인것 같습니다.

\- 비동기적 프로그래밍을 위해 Delegate, Callback함수 , Completion 클로저 등을 활용하는 방법이 있지만, 코드의 가독성이 낮아지고, 예외처리의 어려움이 있는데 이것을 해결할 수 있습니다. 





## 🟡 Combine의 핵심 



### Publisher



\- 프로토콜로, 자신을 구독하고 있는 Subscriber 객체에 시간이 흐름에 따라 값을 내보낼 수 있도록 타입을 선언한다.

\- `Output`과 `Failure`타입으로 제네릭으로 구현되어 있다.



Subscriber



\- Publisher에게 값을 받을 수 있는 타입을 선언하기 위한 프로토콜이다.

\- `input`, `failure` 타입이 제네릭으로 구현되어 있다.



Operator



\- Operator는 Publisher를 반환하는 Publisher 프로토콜에 정의된 메서드이다.

\- 여러 종류의 Operator를 Combine 하여 사용하여 Publisher가 내보내는 값을 처리한다.



Subscription



\- Subscription은 Publisher와 Subscriber의 연결을 나타내는 프로토콜이다.

\- Publisher + Operator + Subscriber로 이뤄진 하나의 작업이 Subscription이다.



Cancellable 

\- Activity 또는 action이 취소를 지원한다고 나타내는 프로토콜이다.

\- `publisher`의 `sink`메서드는 `AnyCancellable`을 반환한다. 







store(in:) 메서드



![image](https://github.com/kimseongj/TIL/assets/88870642/5ee60f28-0208-4d36-bf63-97e4063e9f73)



\- `store(in:)` 메서드는 `Set<AnyCancellable>`을 파라미터로 받는다.

\- `AnyCancllable` 타입을 저장해주는 메서드이이다.

\- 예시





AnyCancellable

\- `AnyCancellable`은 activity 또는 action이 취소되었을 때, `closure`를 실행하는 `type-erasing cancellable object`입니다. 