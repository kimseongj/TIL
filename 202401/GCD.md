# GCD

병렬 프로그래밍 : 여러 개의 CPU가 유사하거나 동일한 작업을 분담해서 처리하는 것을 뜻한다. 그래픽 처리나 머신 러닝에서 병렬 프로그래밍이 권장된다.

동시성 프로그래밍 : 하나의 CPU가 여러 작업을 동시에 처리하는 것을 뜻한다. 하나의 CPU가 여러개의 스레드를 번갈아가면서 작업을 처리하는데, 이때 속도가 매우 빨라 동시에 처리하는 것처럼 느껴진다. 

직렬성 프로그래밍 : 동시성 프로그래밍과 반대되는 개념으로 하나의 스레드에서만 작업을 하고, 순서대로 작업을 처리한다.

동시성 : Serial / Concurrent // 단일 스레드 / 다중 스레드

동기 / 비동기 : 스레드의 수와는 무관하게 작업이 끝나기를 기다리냐, 기다리지 않느냐

## Serial / Concurrent

DispatchQueue는 `대기열에 보내다` 라는 뜻이다. GCD는 개발자가 작업만 정해주면 시스템이 알아서 스레드를 관리해주기 때문에 DispatchQueue에 작업을 넘겨주기만 하면 알아서 동작한다. 

DispatchQueue에 작업을 넘길 때 2가지를 구분해야 한다. 

- 스레드 (Serial / Concurrent)
    - 단일 스레드
    - 다중 스레드
- 동기 OR 비동기 (sync / async)
    - 동기
    - 비동기
    

DispatchQueue를 초기화할 때 `attributes`를 따로 `.concurrent`로 설정하지 않으면 그 기본 값은 Serial이 된다.

```jsx
// Serial Queue
DispatchQueue(label: "Serial")
DispatchQueue.main

// Concurrent Queue
DispatchQueue(label: "Concurrent", attributes: .concurrent)
DispatchQueue.global()
```

### Main / Global

**Main**

- 전역적으로 사용이 가능하다.
- global 스레드들과는 다르게 Run Loop가 자동으로 설정되고 실행된다. 메인 스레드에서 동작하는 Run Loop를 Main Run Loop라고 한다.
- UI 작업은 메인 스레드에서만 작업할 수 있다.
- 앱이 실행되는 동안에는 늘 메모리에 올라와있는 기본 스레드이다.

**Global**

- main 스레드가 아닌, 작업을 처리하기 위해 발생한 스레드를 말한다.
- main 스레드와 달리 `global` 메서드가 호출되면 작업을 처리하기 위해 메모리에 올라왔다가, 작업이 끝나고 나면 메모리에서 제거된다.

메인 스레드는 앱의 기본이 되는 스레드이다. 모든 앱은 적어도 하나 이상의 스레드가 필요한데, 모든 작업은 스레드 위에서 처리되기 때문이다. 

main은 프로퍼티 global()은 메서드

Main Thread는 메모리에 늘 올라와 있다.

여러 스레드에서 여러 작업을 동시에 하는 Concurrent Queue는 Main Thread 외에 새로운 스레드를 만들어서 사용한다. 

## Operation

`Operation` 은 GCD를 객체 지향적으로 재탄생시킨 것이다. `Operation` 은 각각을 직접 실행시킬 수도 있고 `OperationQueue` 라는 Queue에 넣어서 실행 및 관리시켜줄 수 있다.
