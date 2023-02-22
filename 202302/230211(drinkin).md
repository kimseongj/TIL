오늘의 궁금증! Delegate pattern을 썼을 때 `weak var`를 쓰는 경우와 `var`를 쓰는 경우의 차이

```swift
import UIKit

protocol MainViewDelegate: AnyObject {
    func pushChooseCocktailVC()
}

class MainViewController: UIViewController {
    //var coordinator: PreferCocktailSelectionViewCoordinator?
    var delegate: MainViewDelegate?
    
    let skeletonView: UIImageView = {
        let skeletonView = UIImageView()
        skeletonView.image = UIImage(named: "skeletonView")
        return skeletonView
    }()
    
    let recommendLabel1: UILabel = {
        let recommendLabel = UILabel()
        recommendLabel.font = UIFont.boldSystemFont(ofSize: 17)
        recommendLabel.text = "마셔봤던 칵테일을 선택하고"
        return recommendLabel
    }()
    
    let recommendLabel2: UILabel = {
        let recommendLabel = UILabel()
        recommendLabel.font = UIFont.boldSystemFont(ofSize: 17)
        recommendLabel.text = "다양한 칵테일을 추천받아보세요"
        return recommendLabel
    }()
    
    let startButton: UIButton = {
        let startButton = UIButton()
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = .black
        startButton.layer.cornerRadius = 20
        startButton.layer.borderColor = UIColor(red: 0.467, green: 0.467, blue: 0.459, alpha: 1).cgColor
        startButton.layer.borderWidth = 3
        startButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return startButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(skeletonView)
        skeletonView.addSubview(recommendLabel1)
        skeletonView.addSubview(recommendLabel2)
        view.addSubview(startButton)
        
        skeletonView.snp.makeConstraints { make in
            make.height.equalTo(380)
            make.width.equalTo(315)
            make.centerY.centerX.equalToSuperview()
        }
        
        recommendLabel1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        recommendLabel2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(recommendLabel1.snp.bottom).offset(4)
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(39)
            make.width.equalTo(108)
            make.top.equalTo(recommendLabel2.snp.bottom).offset(10)
        }
    }
    
    @objc func buttonAction() {
            delegate?.pushChooseCocktailVC()//self.navigationController!)
            print("asd")
    }
}



```



```swift
class MainVCCoordinator: Coordinator, MainViewDelegate{
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
    
    func pushChooseCocktailVC() {
        let preferCocktailSelectionViewCoordinator = PreferCocktailSelectionViewCoordinator(navigationController: navigationController)
        
        preferCocktailSelectionViewCoordinator.parentCoordinator = self
        childCoordinators.append(preferCocktailSelectionViewCoordinator)
        
        preferCocktailSelectionViewCoordinator.start()
    }
}
```



탭바에 뷰 겹침 현상

![image](https://user-images.githubusercontent.com/88870642/218252825-fc0aeb3c-ba56-482d-a2d6-6c622d59fbbc.png)





Modal fullScreen으로 하는 방법 

```swift
let vc = PreferCocktailSelectionViewController()
        vc.modalPresentationStyle = .fullScreen
```



ButtonAction 넣는 방법 

```swift
startButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

@objc func buttonAction() {
            delegate?.pushChooseCocktailVC()//self.navigationController!)
            print("asd")
    }
```





`UITableView`의 **automaticDimension**을 아시나요?
cell의 height를 제약조건만 맞다면, 내부의 크기에 따라 자동으로 rowHeight를 지정해주는 기능입니다.

```swift
 tableView.rowHeight = UITableView.automaticDimension
 tableView.estimatedRowHeight = UITableView.automaticDimension
```

UICollectionView에서는 **automaticDimension**을 따로 제공하지 않아 `preferredLayoutAttributesFitting`를 override해서 따로 구현해주어야했습니다.



CollectionView는 `layout` 없이 초기화 불가





Lazy var