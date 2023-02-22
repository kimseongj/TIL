비동기처리 방법 

Delegate 패턴, 콜백 함수, completion 클로저 등 



Combine 프레임워크는 시간 경과에 따라 변경되는 값을 내보내는 Publisher와 이를 수신하는 Subcriber로 시간 경과에 따른 값 처리르 위한 선언적 Swift API이다.



Combine의 핵심

아래 4개 모두 프로토콜이다.

채택해야 하는 개념인건가??

Publisher 

- 프로토콜로 타입이 시간에 따라 일련의 값을 전송할 수 있음을 선언한다. 
- Output, Failure 타입이 제네릭으로 구현되어 있다.
- Receive(subscriber:)메서드를 구현해 subscriber를 accept한다. 
- 간단하게 이를 사용하라고 애플에서는 자주 사용할 것 같은 기능으로 Future, Just, Deferred, Empty, Fail, Record와 같은 Publisher프로토콜을 준수하는 Struct, Class들을 구현해뒀습니다.

Subscriber

- Publisher한테 값을 받을 수 있는 타입을 선언하기 위한 프로토콜 (Input, Failure 타입으로 제네릭 구현)

Operator 

- Publisher 프로토콜에 정의된 메서드들로 Publisher를 반환한다.
- Upstream, DownStream이라고 하는 Input, Output을 가지고 있다.



Subscription 

- Publisher와 Subscriber의 연결을 나타내는 프로토콜
- Publisher + Operator + Subscriber로 이뤄진 하나의 작업이 Subscription이다.

Publisher + Operator + Subscriber로 이루어진 하나의 작ㅍ



Combine의 좋은점

이벤트 처리 코드를 중앙 집중화(centralizing)하고 중첩된 closures 및 콜백과 같은 까다로운 기술을 제거하여 코드를 읽고 유지보수하기 숩다.

![스크린샷 2023-02-08 오후 6 00 55](https://user-images.githubusercontent.com/88870642/217483440-a7510f50-ed9e-479f-a77a-d6dd31f82677.png)



## Subscription

그럼 마지막으로 Publisher가 만들어서 Subscriber에게 준다고 했던 Subscription에 대해서 알아보겠습니다.

이 Subscription 역시 Protocol입니다.

공식문서에서 정의를 보면...



![img](https://blog.kakaocdn.net/dn/P5c6P/btrpeJ2paHs/fUIJ8wRvcY32NkkJgPHIJ1/img.png)



"Publisher와 Subscriber를 연결하는 프로토콜"이라고 합니다.

실제로 어떤 걸 요구하는지 보면 아래와 같아요.



![img](https://blog.kakaocdn.net/dn/cjz793/btrpmhpgTRb/rNa3J3PtKuZB2pAfyo2c4k/img.png)



Publisher나 Subscriber에 비해 아주 간단하네요.

딱 request(demand:)만 필요로 합니다.



```
// Publisher가 Subscription주면 호출됨
func receive(subscription: Subscription) {
    // Subscription에게 값을 1번 요청
    subscription.request(.max(1))
}
```



Publisher에게 받은 Subscription의 request(demand:)를 호출해서 Publisher에게 값을 요청합니다.

Demand는 아까 말한 대로 Publisher에게 값을 몇 번 달라고 요청하는 것입니다.

즉 Subscriber가 Publisher에게 값을 요청할 때 Subscription을 사용한다고 볼 수 있습니다.

이렇게 이해하면 Subscription의 정의가 잘 이해가 되는 듯하네요.
