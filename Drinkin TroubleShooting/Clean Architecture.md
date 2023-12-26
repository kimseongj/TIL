### Clean Architecture

>   Clean Architecture를 저만의 해석을 바탕으로 이해하려고 노력했습니다.
>
> 일단, Clean Architeture를 사용하면서 느낀 것은 객체의 모듈화가 정말 잘되어있는 아키텍쳐 디자인이라고 생각됩니다. MVVM의 경우 ViewModel에서 비즈니스 로직을 담당하고,  Model과 상호작용하여 데이터를 주고 받습니다. 그렇다면 여러 비즈니스 로직이 하나의 ViewModel에서 구현되어 ViewModel의 부피가 커지게 되며, 복잡성이 생길 수 있습니다. Clean Architecture는 ViewModel의 비즈니스 로직마저, Usecase라는 객체를 생성하여 하나씩 분리합니다. 즉, 모듈성이 극대화된다고 생각합니다. 모듈성이 강해지면, unit test와 refactoring 시 유리할 것 같습니다. 하지만 Clean Architecture를 사용하면 나쁜 것은 아니지만 코드의 양이 늘어납니다. 특히, Repository를 불가피하게 usecase에서 사용하게 되는 경우가 있는데 이 때, 의존성 역전을 통해서 Usecase가 직접 Repository를 의존하는 것을 방지해줘야 합니다. 
>
> 결론은 Clean Architecture는 유지보수성, 테스트 용이성, 확장성을 보장하기 위한 아키텍쳐 패턴이라고 생각합니다.



:fire: **Clean Architecture의 이해**

![스크린샷 2022-09-26 오후 2 57 24](https://user-images.githubusercontent.com/88870642/192203620-6586d83a-ef97-4076-844b-44650f7bf213.png)

> 내부 레이어(Entity, Useacase)는 외부 레이어(framework 및 UI)에 종속되어서는 안 됩니다. 즉, 내부 원으로 들어가는 형태로 의존성을 지녀야 합니다.



<img width="711" alt="image" src="https://github.com/kimseongj/TIL/assets/88870642/6a5d9f18-4756-4590-b0ee-ddc9d19096d7">

### Domain

- Entity
  - Entity는 다른 프로젝트에서 재사용될 수 있으며, 절대적으로 다른 계층으로부터 영향을 받으면 안됩니다.
  - 주로 데이터 구조의 집합이며 객체, 함수의 집합일 수도 있습니다.
- Usecase 
  - 시스템의 동작을 사용자의 입장에서 표현한 시나리오라고 할 수 있습니다.
  - 즉, 애플리케이션 고유 비즈니스 로직을 관리하는 객체입니다.



### Data

- Data Source를 포함합니다.

- Repository

  - Repository는 외부 혹은 내부의 데이터를 받아오고 저장하는 역할을 합니다.

  - Domain에서 Data의 Repository의 request와 response를 받아야 하는데, 이것은 Domain을 의존하는 관계가 아닌것이 되며, 이를 해결하기 위해 의존성 역전을 사용해야 합니다.

  - 즉 Data의 Data Repository는 Domain의 프로토콜을 따라야합니다.



:fire: **의존성 역전이란?**

> SOLID 원칙 중 하나로, 의존 관계 역전 법칙은 상위 계층이 하위 계층에 의존하 의존관계를 반전시켜 상위 계층이 하위 계층의 구현으로부터 독립되게 할 수 있는 구조입니다.

1. 상위 모듈은 하위 모듈에 의존해서는 안된다. 상위 모듈과 하위 모듈 모두 추상화에 의존하여 상위 모듈이 하위 모듈에 의존하지 않게 연결할 수 있습니다.
2. A -> B 의존성을 A -> 추상화(Protocol) <- B와 같은 형태로 바꾼다고 생각하면 됩니다.



### Presenter

- 프레젠테이션 레이어에는 UI(View)가 포함되어 있습니다.

- View는 하나 이상의 유즈케이스를 실행하고, MVVM 패턴에서 ViewModel에 의해 조정됩니다.

- View, ViewModel을 가지고 있습니다.
  - ViewModel에서 Usecase를 실행하는 형태입니다.









## 참고



\- https://share-factory.tistory.com/33#recentComments





















\- [kudoleh - CleanArchitecture-MVVM](https://github.com/kudoleh/iOS-Clean-Architecture-MVVM)

\- [NSKG님 - Clean Architecture](https://yoojin99.github.io/app/%ED%81%B4%EB%A6%B0-%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98/)

