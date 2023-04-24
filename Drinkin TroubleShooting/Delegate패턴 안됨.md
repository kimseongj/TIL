```swift
protocol MainViewDelegate: AnyObject {
    func pushChooseCocktailVC()
    func pushProductDetailVC()
}

class MainViewController: UIViewController {

    weak var delegate: MainViewDelegate?
  
  ...
  
  @objc func startButtonAction() {
        guard let validDelegate = delegate else {
            print("delegate가 nil입니다.")
            return
        }
    
        validDelegate.pushChooseCocktailVC()
    }
}
```

Coordinator 패턴을 구현 중에 다음 뷰로 전환시키기 위해 Delegate 패턴을 사용했다.

아래와 같이 `delegate`를 `weak var`로 선언한 뒤 `MainVCCoordinator`에 delegate선언을 자신으로 하게 되면 MainViewController에서 `delegate`값이 nil로 나오는 오류가 발생한다. 



해결방안

1. `mainViewController`를 `startPush`함수 외부로 빼서 선언한다. 

```swift
class MainVCCoordinator: Coordinator, MainViewDelegate {
    
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = .init()
    }
    
    func start() {
    }
    
    func startPush() -> UINavigationController {
        let mainViewController = MainViewController()
        mainViewController.delegate = self
        
        navigationController.setViewControllers([mainViewController], animated: false)
        
        return navigationController
    }
```

