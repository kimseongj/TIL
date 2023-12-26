DIcontainer를 통해 Coordinator들에 의존성 주입을 하려고 했을 때, DIContainer의 형태에 대한 고민이 생겼다. 



`AppDIContainer`를 만들어서 각각의 `DIContainer`를 만드는 메서드들을 담아놨다. 

```swift
final class AppDIContainer {
    static let shared = AppDIContainer()

    private let tokenManager: TokenManager
    private let provider: Provider
    
    private init(tokenManager: TokenManager = TokenManager(), provider: Provider = Provider()) { }
    
    func makeTriedCocktailSelectionDIContainer() -> TriedCocktailSelectionDIContainer {
        return TriedCocktailSelectionDIContainer(tokenManager: tokenManager,
                                                 provider: provider)
    }
    
    func makeCocktailRecommendDIContainer() -> CocktailRecommendDIContainer {
        return CocktailRecommendDIContainer(tokenManager: tokenManager,
                                            provider: provider)
    }
    
    func makeProductDetailDIContainer() -> ProductDetailDIContainer {
        return ProductDetailDIContainer(tokenManager: tokenManager,
                                        provider: provider)
    }
    
    ...
}
```



세부 `DIContainer`는 `Repository`, `Usecase`, `ViewModel`을 메서드를 통해 반환하고, 이 메서드들을 통해 `ViewController`를 반환한다.

반환된 `ViewController`를 `NavigationViewController`에 `push`, `present`한다.

이런 방향성으로 코드를 작성하다보니, `Coordinator`에 의존성 주입을 할때 문제가 생겼다. 모든 `Coordinator`에 `AppDIcontainer`가 주입되어야 하며 `AppDIcontainer`의 메서드를 사용해야 하는 문제점이다. 만약 UnitTest를 하게 된다 했을 때, AppDIContainer의 Mock을 만들면 세부 `DIContainer`를 만드는 메서드들을 전부 똑같이 구현해야 한다.

```Swift
// ProductDetilDIContainer
final class ProductDetailDIContainer {
    let tokenManager: TokenManager
    let provider: Provider
    
    init(tokenManager: TokenManager, provider: Provider) {
        self.tokenManager = tokenManager
        self.provider = provider
    }
    
    func makeDescriptionRepository(cocktailID: Int) -> DescriptionRepository {
        return DefaultDescriptionRepository(cocktailID: cocktailID)
    }
    
    func makeFetchDescriptionUsecase(cocktailID: Int) -> FetchDescriptionUsecase {
        return DefaultFetchDescriptionUsecase(descriptionRepository: makeDescriptionRepository(cocktailID: cocktailID))
    }
    
    func makeProductDetailViewModel(cocktailID: Int) -> ProductDetailViewModel {
        return DefaultProductDetailViewModel(fetchDescriptionUseCase: makeFetchDescriptionUsecase(cocktailID: cocktailID))
    }
    
    func makeProductDetailViewController(viewModel: ProductDetailViewModel) -> ProductDetailViewController {
        return ProductDetailViewController(viewModel: viewModel)
    } // -> ProductDetailViewController를 반환 
}
```





```swift
protocol MainViewDelegate: AnyObject {
    func pushTriedCocktailSelectionVC()
    func pushProductDetailVC(cocktailID: Int)
}

class MainVCCoordinator: Coordinator, MainViewDelegate {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var appDIContainer: AppDIContainer
    
    init(appDIContainer: AppDIContainer) {
        self.navigationController = .init()
        self.appDIContainer = appDIContainer
    }
    
    func start() { }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func startPush() -> UINavigationController {
        let cocktailRecommendDIContainer = appDIContainer.makeCocktailRecommendDIContainer()
        let mainViewController = MainViewController(viewModel: cocktailRecommendDIContainer.makeCocktailRecommendViewModel())

        navigationController.setViewControllers([mainViewController], animated: false)
        
        return navigationController
    }
		
  	func pushProductDetailVC(cocktailID: Int) {
        let productDetailVCCoordinator = ProductDetailVCCoordinator(navigationController: navigationController, appDIContainer: appDIContainer,
                                                                    cocktailID: cocktailID)
        productDetailVCCoordinator.parentCoordinator = self
        childCoordinators.append(productDetailVCCoordinator)
        productDetailVCCoordinator.start()
    }
}
```

