## 230106 

#### Key-Value Coding(KVC)

객체의 값을 직접 가져오지 않고, Key 또는 KeyPath를 이용해서 간접적으로 데이터를 가져오거나 수정하는 방법

Key는 String이다.



#### KeyPath란?

- KeyPath는 객체 내부의 값에 직접적으로 참조하는 것이 아니라 값의 이름(프로퍼티)를 참조하는 것이다.
- Key란 objective-C에서 사용되는 개념인데, 프로퍼티에 접근할 때 사용한다고 한다. 
- 그렇다면 KeyPath는 해석해보면 "키의 경로"로 프로퍼티에 접근하는 경로를 뜻한다. 
```swift
struct Person {
    var kim: String = "kim"
}

let human: Person = Person()
human.kim // 값을 참조하는 형태

```



#### COW(Copy-on-Write)

COW 컴퓨터 프로그래밍에서 복사 동작을 할 때, 실제 원본이나 복사본이 수정되기 전까지는 복사를 하지 않고 원본 리소스를 공유함 

원본이나 복사본에서 수정이 일어날 경우, 그때 복사하는 작업을 함





## 참고

- [KeyPath - 팔만코딩경블로그](https://80000coding.oopy.io/2c9f09c6-8162-4336-b8fe-a2d2d721f5ae)

- [COW - 개발자 소들이](https://babbab2.tistory.com/18)
- 

