Delegate Pattern



Coordinator Pattern 

- 코디네이터는 하나 이상의 뷰 컨트롤러에게 화면전환 지시를 내리는 객체이다.

- 화면 전환 시 ViewController에서 다음 ViewController로 이동할 때 직접 push / present 등의 화면 전환을 하는 대신 모든 화면 내비게이션을 코디네이터가 관리한다.

- 즉 원래는 ViewController가 하던 화면 이동을 다른 클래스로 분리해주는 역할을 한다. (ViewController 가볍게)

- 화면 전환하는 코드가 흩어져 있어 파악하고 관리하기 어렵다.



Coordinator 특징

- coordinator 별로 하나 또는 그 이상의 ViewController를 보유한다.
- 각 coordinator는 일반적으로 "start"라고 불리는 메서드를 사용하여 View Controller를 표시한다.
- 각 View Controller에는 coordinator에 대한 delegate reference가 있다.
- 각 coordinator는 child coordinators 배열을 가지고 있다.
- 각 child coordinator는 parent coordinator에 대한 delegate reference가 있다.



Coordinator 프로토콜

```swift
import UIKit

protocol Coordinator {
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }
  
  func start()
}
```



MainCoordinator 클래스

뷰컨트롤러의 첫 시작 

메인 ViewController로의 이동

```swift
class MainCoordinator: NSObject, Coordinator {
  
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigiationController
  }
  
  func start() {
    let vc = ViewController.instantiate()
    vc.coordinator = self 
    navigationController.pushViewController(vc, animated: false)
  }
}
```



ChildCoordinator 클래스

뷰컨트롤러 화면 이동을 위한 Coordinator 패턴 

서브 ViewController로의 이동





Coordinator에서 하나의 네비게이션 컨트롤러가 만들어지면 그 Coordinator에서 함수를 만들고 파고 들어야 되는 것일까..?