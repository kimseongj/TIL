# Combine

## 🟡 나만의 정의 

- 비동기적인 기능을 구현하기 위해 만들어졌다. 
- 변화를 살피기 위해 최적화된 프레임워크인것 같다.
- 비동기적 프로그래밍을 위해 Delegate, Callback함수 , Completion 클로저 등을 활용하는 방법이 있지만, 코드의 가독성이 낮아지고, 예외처리의 어려움이 있는데 이것을 해결할 수 있다. 



## 🟡 Combine의 핵심 

### 1️⃣Publisher

- 프로토콜로, 자신을 구독하고 있는 Subscriber 객체에 시간이 흐름에 따라 값을 내보낼 수 있도록 타입을 선언한다.
- `Output`과 `Failure`타입으로 제네릭으로 구현되어 있다.

### 2️⃣Subscriber

- Publisher에게 값을 받을 수 있는 타입을 선언하기 위한 프로토콜이다.
- `input`, `failure` 타입이 제네릭으로 구현되어 있다.



### 3️⃣Operator

- Operator는 Publisher를 반환하는 Publisher 프로토콜에 정의된 메서드이다.
- 여러 종류의 Operator를 Combine 하여 사용하여 Publisher가 내보내는 값을 처리한다.
- Upstream, DownStream이라고 하는 Input, Output을 가지고 있다.



### 4️⃣Subscription

- Subscription은 Publisher와 Subscriber의 연결을 나타내는 프로토콜이다.
-  Publisher + Operator + Subscriber로 이뤄진 하나의 작업이 Subscription이다.

### 5️⃣Cancellable 

![image](https://github.com/kimseongj/TIL/assets/88870642/9bdea506-aec0-485c-95cb-bd5bcb5d7d43)

- Activity 또는 action이 취소를 지원한다고 나타내는 프로토콜이다.
- `publisher`의 `sink`메서드는 `AnyCancellable`을 반환한다. 



#### - store(in:) 메서드

![image](https://github.com/kimseongj/TIL/assets/88870642/5ee60f28-0208-4d36-bf63-97e4063e9f73)

- `store(in:)` 메서드는 `Set<AnyCancellable>`을 파라미터로 받는다.
- `AnyCancllable` 타입을 저장해주는 메서드이이다.
- 예시

```Swift
var bag = Set<AnyCancellable>()

let subject = PassthroughSubject<Int, Never>()
        
subject
.sink(receiveValue: { value in
   print(value)
})
.store(in: &bag)
```





### 6️⃣AnyCancellable

- `AnyCancellable`은 activity 또는 action이 취소되었을 때, `closure`를 실행하는 `type-erasing cancellable object`이다. 

