\- 비동기 코드를 마치 동기 코드인것 처럼 작성 할 수 있음. ➞ 프로그래머가 동기 코드에서 사용할 수 있는 동일한 언어 구조를 최대한 활용 가능.

\- 자연스럽게 코드의 의미 구조를 보존 ➞ 언어에 대한 최소한 3가지 교차 개선에 필요한 정보를 제공.



await 

비동기 함수 호출시 잠재적인 일시 중단





러를 반환할 수 있을때의 키워드 순서가 `async thorws` 라는 점입니다. 하지만 이걸 호출할때는? `try await` 로 호출하게 되죠ㅎ.. 이게 영어 문법 상 읽기에 더 자연스럽다





![](https://hackmd.io/_uploads/SkzAYFor3.png)

Thumbnail을 불러오기 위한 절차



![](https://hackmd.io/_uploads/ByhS5tjBn.png)

Thumbnail을 받아오는 코드로, `image`가 없거나을 때, `guard let`구문에서 그냥 `return`되므로 사용자는 `image`가 호출되지 않은 것을 알 수 없다. (`return`문에 에러 처리를 해야하지만, 반환값을 줄 수 없다.)

- 이 문제를 해결하기 위해서는 아래와 같이 `completion Handler`를 전부 구현해주어야 한다.



이 때 생기는 문제점은 

- `completionHandler` 호출하는거 잊을 수 있다.
- 오류 처리를 어렵고 장황하게 만든다.
- 비동기 호출간의 제어 흐름이 복잡하다.



async / await

![](https://hackmd.io/_uploads/rJKsWciBn.png)

위 문제를 해결하기 위해 비동기 작업도 동기 작업처럼 순서대로 작성할 수 있는 강력한 기능이 있다.

바로 async / await이다.

- 함수를 선언할 때 `async`를 선언하다. (필요하다면 `throws`까지 선언)

- `request`는 동기작업으로 원래 작성하던대로 작성한다.
- `(data, response)`는 비동기 작업이므로, `await`키워드를 붙혀준다. 
  - 비동기 작업임을 알려주는 것이다.
  - `await`는 잠재적인 일시 중단이란 뜻이다.



:fire: await

- 메서드뿐만 아니라 프로퍼티도 `await`를 적용할 수 있습니다.



![](https://hackmd.io/_uploads/ryL8fcorn.png)

- `getter`를 통해 `async`를 구현할 수 있습니다.
- `setter`를 포함할 경우 사용할 수 없습니다.

![](https://hackmd.io/_uploads/rkIpMqsSh.png)

- `for`문에서도 사용 가능!



:fire: 잠재적 일시 중단 (suspend)

![](https://hackmd.io/_uploads/HyBFXqiS3.png)

- `await`란 잠재적인 일시 중단이라는 뜻으로, 비동기 함수가 실행도중 잠시 실행을 일시정지하고 스레드를 놓아줍니다.

- 다른 더 중요한 작업을 스레드에 올려놓고 스레드가 작업을 수행하게 합니다. 그러다 어느 시점에 이르러서 일시 중단된 비동기 함수를 계속 실행하는 작업이 가장 중요하다고 판단되는 시점에 다시 스레드에 비동기 함수를 재개합니다.

- 실제로 필요한 만큼 여러번 일시정지할 수도 있고, 아예 안할 수도 있다. (토큰을 통해 중요한 작업을 먼저 한다.)

  