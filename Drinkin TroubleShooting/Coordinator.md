### Coordinator 패턴의 적용

> Coordinator 패턴은 ViewController 간의 흐름을 관리하는 디자인 패턴으로 사용됩니다. 하나의 ViewController의 화면 전환 및 인스턴스를 관리하는 역할을 할 수 있습니다.

:fire: **Coordinator 패턴을 적용하여 사용해봤을 때, 느낀 점은 아래와 같습니다.**

1. 한개의 `ViewController`가 앱 흐름에 따라 여러 곳에서 호출될 때, `Coordinator`를 구현하면,  `Coordinator`를 재사용하여 쉽게 앱의 흐름을 구현할 수 있습니다.
2. `ViewController` 내부에 다음 UI에 대한 `ViewController`를 인스턴스로 만들어서 화면 전환을 하면 제 3자의 입장에서 앱 흐름을 파악하는데 ViewController를 하나씩 다 열람하는 번거로움이 생길 것 같습니다. `Coordinator`를` 통해 화면 전환을 구현하면, 가독성 측면에서 상당한 이점을 갖을 수 있을 것입니다.
3. 테스트를 실제 진행하지 않았지만, `Coordinator `패턴을 사용할 경우 테스트할 때 전체 앱을 탐색할 필요 없이 모의 `Coordinator`를 만들어 독립 테스트가 가능할 것 같습니다.

4. 하지만 결국 `ViewController`마다 `Coordinator`를 만들기 때문에 화면 수가 적은 앱에서는 필요 이상의 코드들이 생성될 수 있습니다.

:fire:**결론** : 결론적으로 코디네이터 패턴은 복잡한 탐색과 앱 흐름이 있는 앱의 경우 iOS 앱 아키텍처에 효율적인 디자인 패턴이 될 것입니다. 그러나 모든 앱에 필요하거나 소규모 앱에는 적합하지 않을 수 있고, 요구 사항과 복잡성에 따라 채택을 고려해야 할 것 같습니다.



**현재 프로젝트의 `Coordinator` 프로토콜 예시**

```swift
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
		// childCoordinators를 담아주는 역할
    func start()
    func childDidFinish(_ child: Coordinator?)
  // childCoordinator가 deinit됐을 때, childCoordinators에서 해당 childCoordinator삭제해주는 메서드
}
```

:fire: **childCoordinators에 Coordinator를 저장하는 이유**

1. 하위 `Coordinator`를 추적하기 용이합니다. 로직을 확인할 때, 쉽게 흐름을 파악할 수 있습니다.
2. 하위 `Coordinator`의 의도치 않은 `deinit`에도 인스턴스가 유지될 수 있습니다.



![image-20230924164930142](/Users/ksj8277/Library/Application Support/typora-user-images/image-20230924164930142.png)