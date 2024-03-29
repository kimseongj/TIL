## Observer

### 용어
- **Subject(=Publisher), Protocol**
Observer를 소유하고있음
옵저버를 추가/제거할 수 있음
Observer가 지켜보는 대상

- **Subject(Publisher) Instance, =Concrete Subject**
상태가 변경되면 Observer에게 알림(Update메서드 호출)

- **Observer(=Subscriber), Protocol**
객체의 변경 사항을 알려야하는 객체에 대한 Update메서드 프로토콜 제공

- **Observer(Subscriber) Instance, =Concrete Observer**
Subject 인스턴스 객체에 대한 참조 유지
Subject의 상태와 일관성 유지
객체의 상태와 일관성을 유지하기 위해 update를 구현

- 사용하는 이유
한 객체의 상태 변경이 다른 객체에 영향을 미쳐야할 때 필요하다.
예를 들어 카카오톡 채팅방에 내용이 바꼈을 때, 채팅방 목록 화면에서도 내용이 바뀌는 것처럼 말이다.

- 장단점
개방/폐쇄 원칙을 지킬 수 있다. 출판사의 코드를 변경하지 않고 새 구독자를 받을 수 있다.
런타임 객체 간의 관계들을 형성할 수 있다.

### 특징
- 행동 패턴
- 관찰중인 객체에서 발생하는 이벤트를 여러 다른 객체에 알리는 디자인 패턴
- Combine Framework의 Publisher, Subscriber나 notification과 비슷하다
- 관찰자와 피관찰자로 나뉘어진다.
- 시간이 지나 변경될 수 있는 객체가 있을 때, 그 객체에 구독자를 선언하여, 객체의 변경이 있을 시 구독자에게 알리는 구조이다.
- 같은 구독자가 같은 프로토콜을 구현하고 출판사가 오직 그 프로토콜을 통해서만 구독자들과 통신하는 것이 중요하다. 
- 이 때, 프로토콜은 구독 메서드들만 알고 있어, 프로토콜을 통해 구독자들이 출판자 클래스와 구독자 클래스들과 결합하지 않고 관찰할 수 있다.


1. 새 이벤트가 발생하면 출판사는 구독자 리스트를 살펴본 후 각 구독자 객체의 구독자 프로토콜에 선언된 알림 메서드를 호출한다.
2. 구독자 프로토콜에는 알림 프로토콜을 선언하며 대부분 단일 `update`메서드로 구성된다. 이 메서드에는 출판사가 업데이트와 함께 어떤 이벤트의 세부 정보들을 전달할 수 있도록 하는 여러 매개변수가 있을 수 있다.
3. 구독자들은 응답에 대한 몇 가지 작업을 수행할 수 있도록 해야 하며, 출판사와 구독자가 결합하지 않도록 같은 프로토콜을 구현해야 합니다.
4. 일반적으로 구독자들은 업데이트를 올바르게 처리하기 위해 콘텍스트 정보가 어느 정도 필요로 합니
5. 클라이언트는 출판사와 구독자 객체들을 별도로 생성하고 구독자들을 출판사에 등록한다.



구독자 리스트는 동적으로 컴파일된다. 런타임에서 알림들을 받는 것을 시작하거나 중단할 수 있어야 한다.
새로운 구독자를 추가할 때, 기존 출판사에서 같은 프로토콜을 통해 구독자와 작업을 하기 때문에 기존 출판사 클래스를 변경할 필요가 없다.

:fire: KeySentence
프로토콜은 구독 메서드들만 알고 있어, 프로토콜을 통해 구독자들이 출판자 클래스와 구독자 클래스들과 결합하지 않고 관찰할 수 있다.
구독자 리스트는 동적으로 컴파일된다. 런타임에서 알림들을 받는 것을 시작하거나 중단할 수 있어야 한다.
새로운 구독자를 추가할 때, 기존 출판사에서 같은 프로토콜을 통해 구독자와 작업을 하기 때문에 기존 출판사 클래스를 변경할 필요가 없다.

+ 예제(카키,,,! 코드로 예제짜는거 어떠십니까..?)