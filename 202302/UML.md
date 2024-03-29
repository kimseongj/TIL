## UML

- UML이란 Unified Modeling Language의 약자

- 모델을 만드는 표준 언 (모델이란? 무엇을 만들 때, 잘 작동할지 미리 검증해보는 것, 실제 비용보다 비용이 훨씬 적을 경우 모델을 만들어 설계 검사)



### 사용하는 유형 

- 다른 사람들과 의사소통 또는 설계 논의
- 전체 시스템의 구조 및 클래스의 의존성 파악
- 유지보수를 위한 설계의 back-end 문서



### UML 특징

- 구조 다이어그램: 시스템의 개념, 관계 등의 측면에서 요소들을 나타내고 각 요소돌의 정적인 면을 보기 위한  것

- 행위 다이어그램: 각 요소들 혹은 요소들간의 변화나 흐름, 주고받는 데이터 등의 동작을 보기 위한 것

- 클래스 다이어그램은 의존 관계를 명확히 보게 해준다.

- UML은 목적에 따라 다르게 사용된다. 

- 개념: 소스코드와 관계가 깊지 않으며 오히려 사람의 자연언어와 더 관련이 있음.

- 명세와 구현: 명세와 구현 차원의 UML은 소프트웨어의 설계 혹은 완성된 소프트웨어의 구현 설명 목적 등으로 사용하며 설계를 해서 소스코드로 바꾸거나 구현된 소스코드를 설명하려고 사용한다. 이 두 차원의 클래스 다이어그램은 제약이 많아서 반드시 일정한 규칙과 의미론을 지켜야 한다.



### 구조 다이어그램 중 클래스 다이어그램

클래스 다이어그램의 요소

- Class : 클래스는 3개의 파트로 나누어 표현한다. 이름(클래스명), 속성(프로퍼티), 기능(메서드)으로 나누어지며



- Stereo Type: 스테레오 타입이란 UML에서 제공하는 기본 요소 외에 추가적인 확장요소를 나타내는 것

길러멧을 사용하여 표현한다. 역할을 구분해주는 느낌..? Protocol? 



- Abstract Class/Method: 추상클래스란 1개 이상의 메서드가 구현체가 없고 명세만 존재하는 클래스로, 이테리체나, {abstract}프로퍼티로 표기하는 것이 쉽고 명확하다.



### 클래스간의 관계

클래스 다이어그램의 주 목적은 클래스간의 관계를 한눈에 쉽게 보고 의존 관계를 파악하는것에 있다.

![스크린샷 2023-01-17 오후 3 29 46](https://user-images.githubusercontent.com/88870642/212825777-cbbeea70-b1f1-477c-b10c-26b65c0455c4.png)



- **Generalization(일반화) 실선**

부모클래스와 서브클래스간의 상속 관계를 나타낸다. Generalization이란 서브 클래스가 주체가 되어 서브 클래스를 슈퍼 클래스로 일반화하는 것을 말한다. (개념을 확장하는 느낌?) 반대 개념은 구체화(Specialize)가 있다.

상속되어 있으면 일반화로 표시



- **Realization(실체화) 점선**

Realization은 interface의 spec만 있는 메서드를 오버라이딩 하여 실제 기능으로 구현하는 것을 말한다.

즉 추상화되어 있는 메서드를 오버라이딩하여 실제 기능으로 구현하는 느낌?



- **Dependency(의존)**

Dependency는 클래스 다이어그램에서 일반적으로 제일 많이 사용되는 관계로서, 어떤 클래스가 다른 클래스를 참조하는 것을 말한다.

참조의 형태는 메서드 내에서 대상 클래스의 객체 생성, 객체 사용, 메서드 호출, 객체 리턴, 매개변수로 해당 객체를 받는 것 등을 말한다.



- **Association(연관), Directed Association(방향성 있는 연관)**

클래스 다이어그램에서의 Association은 보통 다른 객체의 참조를 가지는 프로퍼티를 의미한다.

화살표를 통해 무엇을 참조하고 있는지 확인할 수 있다. 화살표가 없을 경우, 쌍방향으로 참조하거나, 어느쪽이 참조하든 상관없음을 나타낸다.



- **Aggregation(집합)**

Aggregation은 Shared Aggregation이라고도 하며 Composition과 함께 Association 관계를 조금 더 특수하게 나타낸 것

Association은 집합이라는 의미를 내포하고 있지 않지만, Aggregation은 집합이라는 의미를 가지고 있음

Aggregation은 Association과 코드가 같고 내용이 거의 비슷해서 사용 안하는게 좋아보여요!



- **Composition(합성)**

Composition도 Aggregation과 비슷하게 whole과 part의 집합관계를 나타낸다. 하지만 개념적으로 Composition이 더 강한 집합을 의미한다.

강한 집합이란 partrk whole에 종속적이어서 part가 whole의 소유이다.part가 whole에 대해 독립적이어서 whole이 part를 빌려 쓰는 것과 비슷하다.



학습활동

- 첫번째로, 나 자신 -> 각 타입의 특징, 전체 구조와 타입 간의 관계 파악
- 두번째로, 같이 일하는 사람 -> 의사소통 및 설계 논의
- 세번째로, 미래에 이 프로그램을 맡을 사람 -> 문서화



집합과 합성의 차이

결과에 초점을 두면 집합, 구성요소에 초점을 두면 합성

연관관계가 의존관계를 포함하고 있음

싱글톤은 의존