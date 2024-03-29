# Animate

지정된 기간, 지연, 옵션 및 완료 핸들러를 사용하여 하나 이상의 뷰에 대한 변경 사항을 애니메이션화합니다.



### animate 

![](https://i.imgur.com/79yBabq.png)

- Duration : 애니메이션의 총 동작시간을 정하며, 초단위로 측정된다. 음수 값이나 0을 지정하면 애니메이션 없이 변경된다.
- Delay : 애니메이션이 시작되기 전에 대기시간을 정하며, 0을 지정하면 즉시 애니메이션이 발동한다.
- Options :  애니메이션을 수행할 방법을 나타낸다.
- animations : 뷰에 커밋할 변경 사항이 포함된 블록 개체입니다. 여기에서 뷰 계층 구조에 있는 뷰의 애니메이션 가능한 속성을 프로그래밍 방식으로 변경할 수 있습니다. 이 블록은 매개변수를 사용하지 않으며 반환 값이 없습니다. 이 매개변수는 NULL이 아니어야 합니다.

- completion : 애니메이션이 종료되면 호출되는 클로저이다. Completion Handler가 호출되기 전에 애니메이션이 실제로 완료되었는지 여부를 나타내는 단일 부울 인수를 사용합니다.



이 메서드는 뷰에서 수행할 일련의 애니메이션을 시작합니다. animations 매개변수의 블록 개체에는 하나 이상의 보기 속성에 애니메이션을 적용하기 위한 코드가 포함되어 있습니다. **애니메이션 중에는 애니메이션되는 뷰에 대한 사용자 상호 작용이 일시적으로 비활성화됩니다.** 사용자가 보기와 상호 작용할 수 있게 하려면 options 매개 변수에 allowUserInteraction 상수를 포함합니다.



### animateKeyframes

![](https://i.imgur.com/GhCpHQA.png)

사용 예시

```swift
UIView.animateKeyframes(withDuration: 3, delay: 0, options: .beginFromCurrentState) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4.0) {
                self.left.frame = self.left.frame.offsetBy(dx: -120, dy: 0)
                self.right.frame = self.right.frame.offsetBy(dx: 120, dy: 0)
                self.spider.alpha = 1
                self.line.alpha = 1
                self.spider.frame = self.spider.frame.offsetBy(dx: 0, dy: 150)
                self.line.frame.size.height = 150
            }
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4.0) {
                self.left.frame = self.left.frame.offsetBy(dx: 120, dy: 0)
                self.right.frame = self.right.frame.offsetBy(dx: -120, dy: 0)
                self.spider.frame = self.spider.frame.offsetBy(dx: 0, dy: -150)
                self.spider.alpha = 0
                self.line.alpha = 0
                self.line.frame.size.height = 0
            }
        }
```

