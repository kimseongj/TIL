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

**Disposable / dispose()**

- 처리하다 / 없애다
- Observable에 대한 이벤트를 받고 싶지 않을 때, `구독 해제` 를 위해 `Disposable` 이 존재한다.
- `subscribe` 메서드를 사용할 경우 `Disposable` 을 반환한다.

 

```swift
public protocol Disposable {
    func dispose()
}
```

Disposable의 존재 이유

- 이벤트가 방출되면 안되는 시점에서 이벤트의 구독을 끊어야 하는데 직접 이 때 `deinit`해줘야 한다. 만약 `deinit`을 하지 않는다면 (ViewController의 이동, Class가 deinit되어야 하는 시점)등에서 `메모리 릭(Memory Leak)`이 발생할 수 있다.

- `deinit` 에 직접 `dispose` 하기
    - 아래와 같이 직접 deinit에 `dispose()` 메서드를 호출시켜 이벤트 구독을 끊을 수 있다. 하지만 이와 같은 방법은 `Disposable` 인스턴스가 많아지면 많아질수록 코드의 가독성이 저하된다.
    
    ```swift
    private var buttonDisposable: Disposable?
    
    private func bindingButton() {
         buttonDisposable = button.rx
                                                    .tap
                                                    .subscribe(
                                                    onNext: { 
                                                                        print("이벤트 방출!!")
                                                    }
                                                    )
     }
    
    deinit {
           buttonDisposable?.dispose()
        }
    ```
    

- `DisposedBag` 사용하기
    - 위의 문제를 해결하는 방법이 `DisposeBag` 이다. `DisposedBag` 은 `Disposable` 타입들을 저장하는 배열로, `disposed(by:)` 메서드를 통해 담을 수 있다.
    
    ```swift
    private var disposedBag = DisposeBag()
    
    private func bindingButton() {
            button.rx
                .tap
                .subscribe(
                    onNext: { 
                                        print("이벤트 방출!!")
                    }
                ).disposed(by: disposedBag)
     }
    ```
    
    - `DisposedBag` 은 자신이 `deinit` 될 때 `dispose` 라는 메서드를 호출하는데 이 메서드는 자신이 가지고 있는  항목들을 모두 `dispose` 해준다.
    - 아래는 `DisposedBag` 이 정의되어 있는 모습이다.
