## Protocol

- 특정 역할을 수행하기 위한 메서드, 프로퍼티, 이니셜라이저 등의 요구사항을 정의 (청사진이라고 볼 수 있음)

- 프로토콜은 다중 채택이 가능합니다.

- 구조체와 열거형도 채택이 가능하다.( class의 경우 단일 상속 및 class만 상속 가능)
- 특정 타입에 명찰을 다는 느낌이다.
- 프로토콜은 특정 타입의 특정 기능을 명시 해준다.



프로토콜은 저장프로퍼티인지, 계산 프로퍼티인지 지정하지 않는다. 프로퍼티 이름과 타입만 지정한다.

읽기 전용일 경우 상수로 선언하거나, 변수로 선언하면 된다. 상수로 선언할 경우, 프로토콜을 채택한 인스턴스의 값을 변경할 초기화 및 변경할 수 없다.

 읽기 쓰기 전용일 경우 변수로 선언하면 된다.



유연한 코드를 작성할 수 있음.

사용자 타입이 삭제되거나 수정되면 그 타입을 매개변수로 하는 다른 함수에 오류가 생길 수 있다. 

그것을 방지하기 위해 프로토콜을 사용하면 된다. 



```swift
@objc protocol a {
  @objc optional var b: Bool { get }
}

extension으로 한번 더 처리하면, 꼭 구현하지 않아도 된다. 
```



사장이 뷰컨 / 비서가 테이블뷰



private 사용법



1.프로퍼티(IBOutlet 포함) 를 쭉 나열하고 (2.이니셜라이저, 3.뷰라이프사이클 함수)그 다음에 4.메서드들(IBAction포함)을 위치시켜 주고



override된 함수는 private 사용 불가 



return은 함수와 함수가 커뮤니케이션하는 방법

equatable 공부해보기 



타입 캐스팅 

인스턴스의 타입을 체크하기 위해 혹은 슈퍼클래스를 하위클래스, 하위클래스를 슈퍼클래스 취급하기 위해 사용된다. 

### is

```is```를 사용할 경우 



git reset





# Class

- reference 타입이라 heap 에 살고 있음.
- argument로 class를 넘기면 pointer가 전달되기 때문에 여러군데에서 해당하는 class를 참조하고 있을 수 있음.
- 그래서 몇군데서 참조하고 있는지 알 수 있게 자동으로 참조 카운트(automatically ref counted) 를 세고, 얘를 가리키는 애가 더이상 존재하지 않으면 힙에서 사라짐.
- 객체 지향 프로그래밍 지원
- 언제나 변경 가능함(mutable). pointer 갖고 있기 때매 해당 heap 에 가서 변경하면 되는 거

```
class myClass {
    var mutableProperty: Int = 0
}let classInstance = myClass()
classInstance.mutableProperty = 1 // 인스턴스는 let이지만, 안의 property는 변경 가능.classInstance = myClass() // error : 다만 instance는 자체는 let이기 때문에 변경 불가
```

- MVVM 에서 ViewModel 은 언제나 class. 왜냐면 다른 뷰에서도 공유되어야하니까 ㅇㅇ. UIKit도 class 베이스.

# struct

- Value 타입이라 stack 에 살고 있음
- argument로 넘기면 해당 값이 복사된 복사본이 넘어감. 실제 bitwise copy 가 바로 일어나진 않고 않고 해당 값에 write 하려고 할때 일어나긴 하지만.. 튼 핵심은 공유하지 않는다는거
- array, dicionary, int, bool 등 대부분은 struct
- 함수형 프로그래밍 지원
- 변경 가능성(mutability)을 명시적으로 let이냐 var이냐를 통해 언급해줘야함

```
struct myStruct {
    var mutableProperty: Int = 0
}let structInstance = myStruct()
structInstance.mutableProperty = 1 // error : 인스턴스가 let이어서 안의 property도 변경 불가. 왜냐면 값 타입이라 property 변경되면 인스턴스 자체도 바뀜
```

- 이 강의에서 볼 대부분의 것들은 struct (다만 View 는 protocol)
