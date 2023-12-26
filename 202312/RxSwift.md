
# RxSwift

Reactive Extension + Swift

Swift를 반응형 프로그래밍하는 것

반응형 프로그래밍

데이터 흐름 및 변경사항을 전파하는데 중점을 둔 프로그래밍 패러다임

주변환경, 데이터에 변화가 생길 때 연결된 실행 모델들이 이 이벤트를 받아 동작하도록 설계하는 방식

Rx 3요소

객체에 이벤트나 값 추가, 수정등과 같은 것을 가능하게끔 해준다.

Observable : 관찰 가능한 순차적인 형태

비동기 이벤트를 어떤 관찰 가능한 형태로 만든다는 것은 비동기 이벤트를 제네릭 타입의 Observable이라는 클래스 인스턴스를 만든다는 것과 같음

비동기 이벤트의 시퀀스를 생성할 수 있는 대상

비동기 이벤트를 관찰 가능한 형태로 만든 것이 Observable이고, 이 Observable은 실제 그 비동기 이벤트가 일어났을 때, 이를 알리기 위해 그 이벤트에 대한 항목을 시퀀스로 방출한다.

Operator: 

Observer: 이벤트의 변화를 관찰하여 전파 받는 역할

Observer가 Observable을 구독할 수 있게 해주는 것이 `Subscribe` 라는 메서드이다.

총 세가지 클로저를 파라미터로 넘겨줘서 이벤트를 처리시킬 수 있다.

**Subscribe**

```swift
public func subscribe(
    onNext: ((Element) -> Void)? = nil,
    onError: ((Swift.Error) -> Void)? = nil,
    onCompleted: (() -> Void)? = nil,
    onDisposed: (() -> Void)? = nil
) -> Disposable
```

- subscribe 메서드를 사용할 경우 Observer를 만들어주지 않아도 임의의 AnonymousObserver를 생성해서 subscribe해준다.
- subscribe의 반환 값은 Disposable 이다.

Disposable / dispose()

처리하다 / 없애다

만약 Observable에 대한 이벤트를 받고 싶지 않을 때, `구독 해제` 를 위해 `Disposable` 이 존재한다. 

```swift
public protocol Disposable {
    func dispose()
}
```

Disposable의 존재 이유

- 메모리 관리
