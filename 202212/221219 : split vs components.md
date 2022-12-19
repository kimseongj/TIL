# split(separator) VS component(separatedBy)

## split
```swift
func split(separator: Character, maxSplits: Int.max, omittingEmptySubsequensces: Bool = true) -> [Substring]
```
- Character타입으로 받으며 [Substring]으로 반환한다. 
- 여기서 Substring은 무엇일까? 의문이 든다!

### Substring이란?
- Substring이란 String과 거의 같은 메서드드들을 사용할 정도로 매우 흡사하지만 약간의 차이가 있다.
- String과 마찬가지로 characters가 저장되는 메모리 영역을 가지고 있다.

```swift
let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)
```
![스크린샷 2022-12-19 오후 10 52 37](https://user-images.githubusercontent.com/88870642/208441104-89cd2582-eed5-41d1-924b-a80fa5a4802c.png)

- 위의 코드와 같이 beginning은 Substring인 "Hello"를 갖게 된다. 
이 때, beginning은 새로운 메모리를 할달받지 않고, 기존에 greeting 상수의 메모리에서 사용할 수 있다.
- 메모리 측면에서 좋메모리 할당 비용을 줄여주기 위해서 사용된다.

## component
```swift
func components(separatedBy separator: String) -> [String]
```
- compoenents 정의를 살펴보면 String 형태로 받아서 [String]형태로 반환해준다. 
- separator를 기준으로 문자열을 분리해주며, readLine에서 많이 사용된다.