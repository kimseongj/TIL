### 스택(stack)과 힙(heap)의 차이점

프로그램이 실행될 때 다양한 메모리 공간을 제공받는데, 운영체제로부터 할당받는 대표적인 메모리 공간은 4가지가 있다.

| 코드 영역              | 데이터 영역           | 힙 영역            | 스택 영역           |
| ---------------------- | --------------------- | ------------------ | ------------------- |
| 실행할 프로그램의 코드 | 전역 변수 / 정적 변수 | 사용자의 동적 할당 | 지역변수 / 매개변수 |

#### 코드 영역

메모리의 코드 영역은 실행할 프로그램의 코드가 저장되는 텍스트 영역

CPU가 코드 영역에 저장된 명령어를 하나씩 가져가서 처리하게 된다.



#### 데이터 영역

메모리의 데이터 영역은 프로그램의 전역 변수와 정적(Static)변수가 저장되는 영역이다.

프로그램 시작 시 할당되며, 프로그램 종료시 소멸된다.



#### 스택 영역

메모리의 스택 영역은 함수의 호출과 관계되는 지역 변수와 매개변수가 저장되는 영역이다.

함수가 호출될 때 할당되며, 호출이 끝나면 소멸된다.

스택은 후입선출 구조로 (LIFO) 가장 늦게 저장된 데이터가 가장 먼저 나오는 구조이다. 

스택 영역은 메모리의 높은 주소에서 낮은 주소의 방향으로 할당된다.

메모리 크기에 제한이 있으며, 넘을 경우 스택 오버플로가 발생하고 속도가 빠르다.



#### 힙 영역

메모리의 힙 영역은 사용자가 직접 관리하는 메모리 영역이다. 

힙 영역은 동적으로 할당되고 해제되는 메모리이다.

힙 영역은 스택 영역과 다르게 낮은 주소에서 높은 주소의 방향으로 할당된다. 

메모리 크기에 제한이 없다. 하지만 속도가 느리다.



### Class VS Struct

```swift
struct FirstStruct {
  var one: Int = 1
}

class FirstClass {
  var one: Int = 1
}

let first = FirstStruct()
var second = first
second.one = 2
// first = 1 / second = 2


let firstClass = FirstClass()
var secondClass = firstClass
thirdClass.two = 2
// secondClass = 2 / thirdClass = 2
```

class는 참조타입이기 때문에 값이 같이 바뀌지만, struct는 값타입으로 값이 함께 바뀌지 않는다.

Class는 상수로 인스턴스해도 내부의 변수 프로퍼티를 변경할 수 있지만 Struct는 상수로 인스턴스하면 내부의 변수 프로퍼티를 변경할 수 없다. 그 이유가 무엇일까?

 

### Key Value Observing

- 다른 객체의 프로퍼티가 변할 때 객체가 인식하는 메커니즘 

- KVO는 응집도에 큰 영향을 미친다. 

- MVC에서 모델과 컨트롤러, 뷰가 같은 상태를 유지할 수 있도록 도와준다. 

- 형식적으로는 컨트롤러가 모델을 주시하고, 뷰가 컨트롤러 혹은 모델을 주시한다.

- KVO에서 한 객체가 다른 여러 객체들의 프로퍼티를 감시할 수 있고, 그 관계는 일대일, 일대다 관계로 유지된다.

- KVO의 메커니즘은 NSNotification과 NSNotificationCenter와 흡사하다. NSNotification은 중앙 객체가 관찰자 객체들과 브로드캐스팅하지만, KVO의 경우 속성 값이 변경될 때 관찰 개체로 직접 이동한다. 

- 루트 클래스 NSObject가 KVO를 기본적으로 제공하기 때문에 재정의가 필요 없으며, Cocoa 객체에서 KVO를 사용할 수 있다. 즉 NSObject가 상속되어 있는 클래스에서만 KVO를 사용할 수 있다.



#### 사용법

```swift
class Address: NSObject {
  @objc dynamic var city: String
  
  init(city: String) {
    self.city = city
  }
}
```

관찰자 프로퍼티(Observer Property)랑 비슷한거 같다.

```swift
var address = Address(town: "서울")
address.observe(\.city, options: [.old, .new]) { (object, change) in                                      
                    print(change.oldValue, change.newValue) // 서울, 부산
    }
address = "부산"
```

KeyPath

```swift
var address = Address(town: "서울")
address.observe(\.city) { (object, change) in                                      
                    print(change.oldValue, change.newValue) // nil, nil
    }
address = "부산"
```





### NSNotificationCenter

NotificationCenter는 유저에게 직접 정보를 전달하는 역할이 아닌 객체 간의 정보를 전달하기 위해 존재한다.

NotificationCenter는 각 객체들에게 정보를 전달하기 위한 중심역할을 해준다.

NotificationCenter는 싱글톤으로 구성되어 있어 사용자가 인스턴스를 만들지 않고 NotificationCenter를 부를 수 있다.

#### Observer

Observer란 NotificationCenter에서 자신의 정보를 등록하여 알림을 받고자 하는 객체를 의미한다. 

모든 객체는 Observer가 될 수 있고, 이벤트를 보내는 객체가 될 수도 있다.

#### Post

Post는 객체가 NotificationCenter로 이벤트를 보내는 행위를 의미한다. 

#### Notification

Notification은 이벤트를 발행하는 객체가 NotificationCenter에 보내는 이벤트를 의미한다.

#### NotificationName

NotificationCenter는 싱글톤으로 만들어지는데, 이벤트를 여러개 만들고 싶을 때는 어떻게 하는게 좋을까

예를 들면, 텍스트를 바꾸는 알림, 이미지를 변경하는 알림을 보내고자 한다면, 싱글톤인 NotificationCenter는 자신에게 보내지는 이벤트가 어떤 이벤트인지 알고 있어야 한다. 

NotificationName이라는 식별자를 통해 구분해서 알려준다.



#### 사용 예제

NotificationCenter에서 addObserver 메서드를 제공하기 때문에 가져다 쓰면 된다. 

```swift
func addObserver(
	_ observer: Any,  // 인스턴스를 넣어준다.
  selector aSelector: Selector, // 
  name aName: NSNotification.Name?,
  object anObject: Any?
)
```

옵저버 패턴 / 발행-구동 패턴



#### observer 

인스턴스들을 옵저버로 지정한다.



#### aSelector

수행할 작업이 무엇인지 표시한다. 



#### aName

name은 전달받은 Notification의 이름을 적는다. 이 옵저버들이 어떤 이벤트를 받을지 결정한다.

만약 aName을 nil값을 넣으면 NotificationName을 고려하지 않고 모든 Notification을 받게 된다.



anObject

이 파라미터를 통해 Notification을 보내는 객체를 특정할 수 있다. 





[메모리 영역 - 정현 블로그](https://junghyun100.github.io/%ED%9E%99-%EC%8A%A4%ED%83%9D%EC%B0%A8%EC%9D%B4%EC%A0%90/)

[클래스- yagom 강의](https://yagom.net/courses/swift-basic/lessons/%ec%82%ac%ec%9a%a9%ec%9e%90%ec%a0%95%ec%9d%98-%ed%83%80%ec%9e%85/topic/%ea%b0%92-%ed%83%80%ec%9e%85%ea%b3%bc-%ec%b0%b8%ec%a1%b0-%ed%83%80%ec%9e%85/)

[KVO - apple documents](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/KVO.html)

[NotificationCenter- choidam blog](https://silver-g-0114.tistory.com/106)