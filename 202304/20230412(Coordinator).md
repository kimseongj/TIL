## Coordinator

### Coordinator를 사용하는 이유 

- 기존의 ViewController들은 화면전환을 위해 전환될 ViewController를 알고 있어야하는 구조이였다.

- 이는 ViewController 인스턴스들 간에 불필요한 참조를 하게 하는 구조이다.

- 이를 해결하기 위해 Coordinator 패턴을 적용할 수 있다.

- 화면 전환을 `Coordinator `라는 인스턴스를 만들어서 ViewController가 전환될 ViewController를 알 필요 없게 만드는 것이다.

