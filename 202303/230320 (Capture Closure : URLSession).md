# Fetching Website Data into Memory



## URLSession

- task를 인스턴스한 것은 URL session이다.
- 요구사항이 간단하면 `shared`라는 싱글톤 객체를 통해 사용할 수 있다.
- delegate callback을 통해 전송과 상호 작용하려면 공유 인스턴스를 사용하는 대신 세션을 만들어야 한다.
- 세션을 만들 때 인스턴스를 사용하고 하위 프로토콜 중 하나를 구현하는 클래스를 전달하기도 한다.
- 세션을 재사용하여 여러 작업을 생성할 수 있으므로 필요한 각 고유 구성에 대해 세션을 생성하고 속성으로 저장한다.



#### URLSessionDataTask

- 요청 데이터를 메모리로 받는 클래스로, 데이터를 파일 시스템에 저장시켜준다.
- data task는 웹서비스의 엔드포인트에서 불리는게 이상적이다.



#### 시작과 결과 받기

- 세션을 갖게되면, `dataTask()` 메서드를 통해 data task를 만들 수 있으며, `resume`을 통해 시작된다.
- 주의점 - 비슷한 session을 사용할 경우 하나의 session을 만들어서 공유하는게 권장한다.
- 결과는 `Completion Handler`를 통해 받을 수 있다.
  - `Completion Handler`란 함수가 종료되고 호출되는 클로저를 뜻한다.

- URLSession이 데이터를 받는 순서 
  - URLSession이라는 인스턴스를 통해 URLSessionDataTask라는 메서드를 사용하여, 데이터를 받으면 CompletionHandler로 빠져나온다.

<img width="622" alt="스크린샷 2023-03-19 오후 5 32 57" src="https://user-images.githubusercontent.com/88870642/226163159-9f6c32a0-fcc0-4987-b8c1-e7195ab0b3b4.png">



#### Completion Handler에서 확인가능한 세가지

1. error 매개변수가 nil인지 확인해야 한다. nil이 아닐 경우 전송 오류가 발생되고 , 오류처리와 함께 종료된다.

2. response 매개변수를 확인하여 상태코드(200~299인지)가 성공을 나타내는지, MIME 유형이 예상 값인지 확인해야 한다.
3. 필요하면 data를 인스턴스해서 사용한다.



### 예시

```swift
func startLoad() {
    let url = URL(string: "https://www.example.com/")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            self.handleClientError(error)
            return
        }
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
            self.handleServerError(response)
            return
        }
        if let mimeType = httpResponse.mimeType, mimeType == "text/html",
            let data = data,
            let string = String(data: data, encoding: .utf8) {
            DispatchQueue.main.async {
                self.webView.loadHTMLString(string, baseURL: url)
            }
        }
    }
    task.resume()
}
```

- URLSession의 `shared`인스턴스가 생성되면서 시작된다.
- `shared`인스턴스는 data task를 만들고 data task는 결과를 completion handler에 보낸다.
- local error와 server error를 확인하고 데이터 모델로 파싱한다.





# Capture Closure

## Capture Closure란?

- value를 capture 한다는 뜻은, 클로저 외부의 변수를 클로저 내부에 저장해두는 것을 의미한다.

- Swift에서 제일 간단한 value capture는 nested function으로, 함수 내부에 함수가 있을 때이다.
- 예시
  - `runningTotal`과 `amount`가 `incrementer메서드에 capture된 형태이다.
  - 이 때, `makeIncrementer`의 반환타입은 `() -> Int`이다.
  - `incrementer`함수를 반환하여 `incrementer`함수 내부에 반환되는 값을 반환한다.

```Swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
```



## Capture Closure의 특징 

- `runningTotal`과 `amount`가 capture되었을 때, `makeIncrementer`함수의 호출이 종료되어도 사라지지 않고, `incrementer`함수가 호출될 때 `runningTotal`을 사용할 수 있다.
  - `makeIncrementer`메서드를 참조하는 상수 `makeIncrementTen`을 만들었을 경우, 메서드 내부의 값은 함수호출이 종료되어도 값이 지워지지 않고 저장되는 모습이다.

```swift
let makeIncrementerTen = makeIncrementer(forIncrement: 10)
makeIncrementerTen() // 10
makeIncrementerTen() // 20
makeIncrementerTen() // 30
makeIncrementerTen() // 40

let makeIncrementerSix = makeIncrementer(forIncrement: 6)
makeIncrementerSix() // 6
makeIncrementerSix() // 12
```

- Swift는 value를 저장하거나 캡쳐할 때, value의 값이 변하지 않으면, 복사하지 않고, 원래 value의 값을 사용한다. (COW)



🔥🔥 위에 내용에서 확인할 수 있는 점은 Closure는 참조타입이라는 것이다. 



