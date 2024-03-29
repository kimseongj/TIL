## NumberFormatter

- NumberFormatter는 class로 Formatter를 상속받는 class이다.
- 객체를 포함하는 셀의 텍스트 표현을 포맷하고 숫자 값의 텍스트 표현을 객체로 변환하는 인스턴스이다.

- Significant Digits : 유효 숫자(자연수)

- Fraction Digits : 분수 숫자(소수)

- NumberFormmatter의 반환값은 Optional이다.

- 세자리수 마다 콤마 넣기

- `.decimal`로 `numberStyle`을 설정해주면 세자리수 마다 콤마를 넣을 수 있다.

```swift
let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .decimal // 
let price = 12000
let result = numberFormatter.string(for: price)!
print(result) // 12,000
```



- 소숫점 최대 자리수 지정 

```swift
let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .decimal
numberFormatter.maximumFractionDigits = 7
let price = 12345678.12345678
let result = numberFormatter.string(for: price)!
print(result) //12,345,678.1234567
```



## Closure

- 일급 시민(다른 곳으로 저장되거나, 전달될 수 있음)
- 변수, 상수 등으로 저장, 전달인자로 전달이 가능
- 함수 : 이름이 있는 클로저
- 함수와 클로저는 같은 역할을 한다. 
- 코드의 블럭

- 정의

```swift
{ (매개변수 목록) -> 반환타입 in
		실행코드
}
```



- 클로저 사용

```swift
func sumFunction(a: Int, b: Int) -> Int {
  return a + b
}

var sumResult: Int = sumFunction(a: 1, b: 2)

var sum: (Int, Int) -> (Int) = { (a: Int, b: Int) -> in return a + b}

sumResult = sum
```



- 함수의 타입 선언

```swift
let add: (Int, Int) -> Int
```



- 함수의 전달인자 클로저 

```swift 
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in
      return a +b
      }

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
  return method(a,b)
}

calculated = calculate(a: 3, b: 4, add) //7 리턴 

calculated = calculate(a: 3, b: 4, { (left: Int, right: Int) -> Int in 																						return left + right})
```



**🔥축약시 주의사항 : 다른 사람도 알아볼 수 있도록 가독성 있게 축약하라.**



- 후행 클로저

클로저가 함수의 마지막 전달인자일 때, 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저를 구현할 수 있다.

```swift
result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
                                 return left + right}

 abc = abc() { (left: Int, right: Int) -> Int in
                                 return left + right}
abc = abc { (left: Int, right: Int) -> Int in
                                 return left + right} // 클로저가 abc의 전달인자이다.
```



- 반환타입 생략

이미 함수의 전달인자 타입을 알고 있기 때문에 반환타입 생략이 가능하다.

```swift
func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
  return method(a,b)
}

calculated = calculate(a: 3, b: 4, method: {left: Int, right: Int} in 
                      return left + right)
```



- 단축인자 이름

클로저의 매개변수 이름이 굳이 불필요하다면 단축 인자이름을 활용할 수 있다.

```swift
calculated = calculate(a:3, b: 4, method: { return $0 + $1
                                          })
```



- 후행클로저와 반환타입, 단축인자 이름 사용

```swift
calculated(a: 3, b: 4) { $0 + $1 }
```





## AutoLayout 

### Attribute (특성)

- Top, bottom, width, height 등이 있다.

- point란 autoLayout뿐만 아니라, UI를 구성할 때, 가장 기본적인 단위이다.(pixel과는 다름)
- leading과 trailing은 글자가 시작되고, 끝나는 방향



### Nonambiguous Layouts

- view의 넓이와 높이는 superview의 top, bottom, leading, trailing값과 차이를 알면 자동으로 계산해준다.

..... 추가예정