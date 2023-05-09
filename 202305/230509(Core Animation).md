# Core Animation

### Core Animation이란?

- 그래픽 랜더링과 애니메이션 구조를 가능하게 해주는 친구이다.
- Core Animation을 사용하면 애니메이션의 각 프레임을 그리는 데 필요한 대부분의 작업이 자동으로 수행된다.
- 우리가 해야할 일은 여러 애니메이션 파라미터(start와 endpoint)를 설정하고, Core Animation에게 알려주면 된다.
- Core Animation이 나머지는 대부분의 실제 드로잉 작업을 온보드 그래픽 하드웨어에 넘겨 렌더링을 가속화한다. 
- 이 자동 그래픽 가속은 CPU에 부담을 주지 않고 앱 속도를 저하시키지 않으면서 높은 프레임 속도와 부드러운 애니메이션을 제공한다. 
- UIKit에 포함되어 있다.
- Core Animation은 layer object가 핵심 요소이다.
- 캡처를 하고 비트맵에 캐싱을 해서 활용한다.



### 

<img src="https://hackmd.io/_uploads/HJbnBaV4h.png" width =400> 

<img src="https://hackmd.io/_uploads/HJ1kvpEN3.png" width =400>



![](https://hackmd.io/_uploads/Bkt3dpBNn.png)



### CAPropertyAnimation

- Layer에 있는 프로퍼티 값들이 변경되었을 때, 애니메이션을 실행해주게 된다.
- `CABasicAnimation`이 `CAPropertyAnimation`을 상속받고, 주로 사용된다.
-  사용 예시
  - 이 때, keyPath란, 변경해줄 값을 나타낸다. 

```swift
let animation = CABasicAnimation(keyPath: "opacity") 
animation.fromValue = 0 
animation.toValue = 1
```

- from / to / by
  - from : 시작점
  - to : 종료시점
  - by : 과정?? (from이 5이고 by가 10이면, 끝은 15가 된다.)



### CoreAnimation 사용예시

```swift
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button: UIButton!
    
    let subLayer: CALayer = {
        let layer = CALayer()
        layer.frame = .init(x: 100, y: 100, width: 100, height: 100)
        layer.backgroundColor = UIColor.blue.cgColor
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.tintColor = .systemBackground
        self.view.layer.addSublayer(button.layer)
    }
    
    func rotate() {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.z"
        animation.duration = 0.4
        
        if button.isSelected {
            animation.fromValue = 0
            animation.toValue = CGFloat.pi / 4
            button.layer.add(animation, forKey: "basic")
            button.layer.transform = CATransform3DMakeRotation(CGFloat.pi / 4, 0, 0, 1)

        } else {
            animation.fromValue = CGFloat.pi / 4
            animation.toValue = 0
            button.layer.add(animation, forKey: "basic")
            button.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1)
        }
        
        
    }

    @IBAction func didTapButton(_ sender: Button) {
        sender.isSelected.toggle()
        rotate()
    }
    
}



@IBDesignable
class Button: UIButton {
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineWidth(4)
        context.setStrokeColor(UIColor.green.cgColor)
        
        let width = bounds.width
        let height = bounds.height
        
        let circleFrame = bounds.insetBy(dx: width * 0.05, dy: height * 0.05)
        
        context.addEllipse(in: circleFrame)
        context.drawPath(using: .stroke)
        
        context.move(to: CGPoint(x: width * 0.5, y: height * 0.15))
        context.addLine(to: CGPoint(x: width * 0.5, y: height*0.85))
        
        context.move(to: CGPoint(x: width * 0.15, y: height * 0.5))
        context.addLine(to: CGPoint(x: width * 0.85, y: height * 0.5))
        
        context.drawPath(using: .stroke)
    }
} 
```





### Model Layer 

- 시작하려는 점과 종료시점의 위치 정보를 담고 있다.

- Model Layer에 값을 담으면 마지막점에  멈춤



### Presentation Layer 

- 움직이는 시점의 정보를 담고 있다.