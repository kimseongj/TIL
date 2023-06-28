# Clean Architecture

![image](https://github.com/kimseongj/TIL/assets/88870642/de2b56b1-90f3-442b-9a18-d8f4606733de)

위의 그림은 Clean Architecture의 도식화한 모습이다. 안쪽 레이어에 있는 애들은 바깥 레이어에 있는 것들을 몰라야 하며, 안쪽 레이어에서 바깥쪽에 의존하지 말아야 한다. 즉 바깥쪽에 있는 객체(클래스, 구조체 등)을 안쪽에 있는 객체 내부에서 생성하면 안된다. 그림에서 볼 수 있듯이 화살표가 안으로 향하고 있으며, 안족 레이어에 의존하는 구조이어야 한다. 







![image](https://github.com/kimseongj/TIL/assets/88870642/3ebab46a-1d59-4a96-9e54-e496a5b86051)



## Domain Layer

가장 안에 있는 부분으로 DomainLayer는 아무것도 모른다.

잠재적으로 다른 프로젝트에서 재사용이 가능하다.

Entity, Use Case, Repository, Interface를 포함하고 있다. 이 레이어는 다른 프로젝트에서도 재사용될 수 있다.



## Presentation Layer

- UI를 가지고 있으며, ViewModel들이 UseCase를 실행시키며, Domain Layer에만 의존합니다.

- View, ViewModel을 가지고 있다. 
- ViewModel은 UIKit, SwiftUI 등의 UI프레임워크와 분리시키는 것이 좋은 MVVM의 방향성이며, 그이유는 재사용, 리팩토링, 테스트 등이 용이해지기 때문이다. 
- View는 비즈니스 로직 및 앱 로직에 접근할 수 없으며, 오로지 ViewModel을 통해 전달받는다.



## Data Layer

- Data Source를 포함하고 있으며 원격이나 로컬일 수 있다. 

- Domain에서 Data의 Repository의 request와 response를 받아야 하는데, 이것은 Domain을 의존하는 관계가 아닌것이 되며, 이를 해결하기 위해 의존성 역전을 사용해야 한다. 
- 즉 Data의 Data Repository는 Domain의 인터페이스(프로토콜)을 따르고, JSON 데이터와 CoreData Entity들을 도메인 모델로 맵핑한다. 



**의존성 역전이란?**

> SOLID 원칙 중 하나로, 의존 관계 역전 법칙은 상위 계층이 하위 계층에 의존하는 전통적인 의존관계를 반전시킴으로써 상위 계층이 하위 계층의 구현으로부터 독립되게 할 수 있는 구조이다.

1. 상위 모듈은 하위 모듈에 의존해서는 안된다. 상위 모듈과 하위 모듈 모두 추상화에 의존해야 한다.
2. 추상화는 세부 사항에 의존해서는 안된다. 세부사항이 추상화에 의존해야 한다.
3. B 클래스가 A 클래스에 의존하는 (B→A) 구조였다면, 의존 관계 역전 법칙에서는 어떤 추상화된 인터페이스(Swift 에서는 프로토콜)에 A, B 객체가 모두 의존(A → 프로토콜 ← B)하고 있는 구조라고 볼 수 있다.

```swift
protocol DIInterface: AnyObject{
    var num: Int{get set}
}
class A: DIInterface{
    var aNum = 1
}
class B{
    var bNum: DIInterface
    init(num: DIInterface){
        self.bNum = num
    }
}

let b = B(A())
```





## Reference

- [kudoleh - CleanArchitecture-MVVM](https://github.com/kudoleh/iOS-Clean-Architecture-MVVM)
- [NSKG님 - Clean Architecture](https://yoojin99.github.io/app/%ED%81%B4%EB%A6%B0-%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98/)
- [김종권님 블로그 - 의존성 주입](https://silver-g-0114.tistory.com/143)