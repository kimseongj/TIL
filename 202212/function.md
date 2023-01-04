Function의 생성과 호출



함수의 전달인자(argument) : 매개변수 타입과 일치하는 / 매개변수와 항상 일치해야 됨 (asd,asdasd)

함수에 전달하거나 함수 내부에서 전달받는 "값"을 의미

전달인자 레이블(argument label) : 

함수의 매개변수(parameter) : 함수 호출 시 사용하는 호칭(name1, name2)

함수의 반환값(return) : 함수호출 시 반환해주는 값

```swift
func greet(to name1: String, from name2: String) -> String {
  print("Hello")
  return "Hello"
}

greet(to: "asd", from: "asdasd")
```



기본 타입의 종류

- function 

- array

- dictionary

- Type identifier

- tuple

  여러가지 타입들을 넣을 수 있는 타입

  ```swift
  var tuple = (1, "hi", true)
  var tuple2 = (tuple, 1, 2, true)
  ```

  

- optional

- Implicitly-unwrapped-optional

- Protocol-composition

- opaque

- any

- self

- 





try!는 강제 언래핑처럼 에러가 나지 않는다고 확신하고 사용하는 것과 같습니다! 다만 강제 언래핑했는데 nil이면 에러가 발생하는 것처럼 에러가 있으면 안되겠죠

try?는 에러가 발생하면 nil을 반환하고 그렇지 않으면 옵셔널 타입으로 반환합니다!