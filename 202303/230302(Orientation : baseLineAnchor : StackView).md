## 화면 회전 (Orientation)

### 방법 1. AppDelegate에서 변경

- Appdelegate의 Orientation 방향을 정해주는 방식
- 아래의 경우 portrait(세로)모드로 고정시켜준다.

```swift

// AppDelegate
static var portraitOrientation: Bool = true
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        if AppDelegate.portraitOrientation == true {
            return UIInterfaceOrientationMask.portrait
        } else {
            return UIInterfaceOrientationMask.all
        }
    }

// ViewController
override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)    navigationControllerSupportedInterfaceOrientations(navigationController!)
        AppDelegate.portraitOrientation = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppDelegate.portraitOrientation = false
    }
```



### 방법 2. Custom NavigationController을 만들어 `supportedInterfaceOrientations`변수 override하기 

- MainViewController만 portrait으로 설정하고 나머지 뷰는 .all로 설정되게끔 만듬

```swift
final class NavigationViewController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? [.all]
    }
}


class MainViewController: UIViewController {
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
```



## baseLineAnchor

### baseLine이란?

- 아래의 그림과 같이 글자 밑의 기본선을 나타낸다.

### baseLineAnchor란?

- firstBaseLineAnchor : 한 줄 이상의 텍스트가 있을 때 첫번째 줄의 baseLine을 의미하는 Anchor이다.
- lastBaseLineAnchor : 한 줄 이상의 텍스트가 있을 때 마지막 줄의 baseLine을 의미하는 Anchor이다.

![스크린샷 2023-03-03 오후 9 31 55](https://user-images.githubusercontent.com/88870642/222721170-bd6cc903-55cf-435a-a30b-827384afafea.png)



## About StackView

- axis : 스택뷰가 쌓이는 방향

- distribution : 번역하면 "분배"로 스택뷰의 서브뷰들의 사이즈를 분배하는 방식이다. ( fill / fillEqually / fillProportionally / equalSpacing / equalCentering)

- alignment : 서브뷰들의 위치를 나타내는 방식이다. (axis의 반대 방향을 관리)

- Spacing : 스택뷰 간의 간격



## 참고

- [wikipedia - typography](https://en.wikipedia.org/wiki/Baseline_(typography))

- [야곰닷넷 - stackView](https://yagom.net/courses/autolayout/lessons/stack-views/topic/profile-view-with-stack-views/)