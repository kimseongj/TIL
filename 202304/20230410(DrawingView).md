#  View Drawing Cycle

UIView에는 `updateConstraints()`, `layoutSubviews()`, `draw(_:)` 메소드가 존재

updateConstraints : Constraints값을 갱신함

layoutSubviews :  Constraints 값을 이용하여 Layout(Size와 Postion)을 결정하며, 현재 View와 SubView들의 위치와 크기를 제공한다. 또한, 이 메서드는 재귀적으로 모든 SubView들의 layoutSubview까지 호출되기 때문에 부하가 크다.

draw : 뷰는 모두 사각형으로 그려지므로, 메소드 시그니쳐도 draw(rect:)로 정의된다.

![](https://i.imgur.com/dLhYsgJ.png)



### Layout

- UIView의 Layout은 화면에서 UIView의 크기와 위치를 의미한다.
- layoutSubviews()
  - View와 SubView들의 위치와 크기를 재조정한다.
  - 재귀적으로 모든 SubView들의 layoutSubview까지 호출되기 때문에 부하가 크다

- setNeedsLayout()
  - layoutSubviews를 가장 적은 부하로 호출할 수 있는 메서드이다.
  - setNeedsLayouts는 시스템에게 이 view의 layout이 재계산되어야 한다고 알린다.
  - setNeedsLayouts은 즉시 반환되고, 실제로 View를 업데이트해주지 않는다.
  - 하지만 다음 Update Cycle에서 layoutSubViews를 View와 SubView들에게 호출하게 한다.
  - 실제로 setNeedsLayouts가 호출되는 시점과 View가 다시 그려지는 시점은 정확하지 않지만, 유저가 인지할 수 없다.
- layoutIfNeeded()
  - UIView가 layoutSubviews를 호출하도록하는 명시적인 메서드이다.
  - layoutSubviews가 다음 UpdateCycle에서 호출되는 것이 아니라, View의 Layout의 변경사항이 있다면 즉시 호출된다.



### Display

- Layout이란 것이 View의 위치와 크기라면, Display는 View의 속성 중 크기/위치나 SubView들에 대한 정보를 갖지 않는 속성을 포함한다. (색, 텍스트, 이미지, Core Graphics 등)
- draw(_ rect:)
  - 뷰에서 CGRect 직사각형으로 특정된 영역에 대해 다시 뷰를 그리는 등의 업데이트를 할 때, 호출되는 메서드 UIView의 draw 메서드는 Layout Update 과정에서의 layoutSubviews와 같은 역할을 하며, draw메서드를 직접 호출하면 안된다.
- setNeedsDisplay()
  - View가 다시 그리기 전에 메서드는 반환한다.
  - setNeedsLayout과 유사하다.



### Constraints

1. Constraints를 Update한다.
   - 시스템이 View에 필요한 Constraints들을 계산하고 설정한다.
2.  Layout
   - Layout Engine이 View들의 Frame과 SubView들의 Frame을 계산하고 배치한다.
3. Display
   - View의 Content를 다시 그릴 필요가 있다면, draw 메서드를 호출한다.

- Layout과 Constraints의 Update는 ` layoutIfNeeded / updateConstraintsIfNeeded`를 통해 Run Loop의 어디서든 즉시 호출 가능하다.

- draw 메소드 setNeedsDisplay()가 호출될 때 호출되며, setNeedsDisplay()는 아래 4가지 상황에서 호출되며, 따로 호출할 수도 있다.
  - 뷰를 가리던 다른 뷰가 움직이거나 제거되는 경우
  - 숨겨진 뷰를 다시 보이게 하는 경우
  - 스크롤해서 스크린 밖으로 내보냈다가 돌아오는 경우
  - 직접 업데이트를 요청하는 경우



![](https://i.imgur.com/k6PpdBC.png)

- Main Run Loop : 디바이스가 회전되거나, 뷰의 위치가 변화되거나, 터치 이벤트를 받는 등 각종 이벤트를 처리하고, 그 이벤트에 맞는 핸들러를 찾아 그 인스턴스들에게 처리 권한을 위임한다.
- Update Cycle : 내부에서 메소드를 실행하여 Constraint, Layout, Display 정보를 업데이트 한다.



## 참고

- [나무's블로그 - UIView / 레이아웃 업데이트 관련 메소드](https://wlgusdn700.tistory.com/52)

- [UIView - The View Drawing Cycle](https://developer.apple.com/documentation/uikit/uiview)

The UIKit Graphic System

- 특정 시점에 시스템은 UIView에게 뷰를 그릴 것을 요청
- UIView는 draw 메서드를 통해 뷰를 그림
- 시스템은 콘텐츠의 스냅샷을 캡처함
- 스냅샷이 화면이 표현됨
- 뷰를 다시 그려야 하는 상황이 되면 업데이트를 진행함 

Promotion displays







Render Loop

![](https://i.imgur.com/d5hMnfN.png)

![](https://i.imgur.com/9PwuDTh.png)

Engine이 오토레이아웃을 계산해주는 친구임





##  Modern CollectionView

핵심 키워드 `Compositional layout`, `Diffable Data Source`

- Diffable DataSource란?
  - 달라질 수 있는 능력이 있다.
  - IndexPath를 사용하지 않고, Hashable을 기반으로 동작한다.
  - 

- Compositional Layout란?
  - UICollectionView에서 사용할 수 있는 Layout 중 하나
  - 공식 문서 상 , 유연하고 빠른 컬렉션 뷰의 레이아웃 형태를 구현할 수 있다고 한다.
  - 예시(make Grid Layout)

```swift
let customLayout: UICollectionViewCompositionalLayout = {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                         heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .fractionalWidth(0.2))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                     subitems: [item])

    let section = NSCollectionLayoutSection(group: group)

    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
}()
```

- CompositionalLayout.list란?
  - 테이블 뷰 형식처럼 vertical하게 생성되는 Layout이다.



Fractional 과 snapshot 공부하기

Override Super 

- override를 할 때, 부모의 작업을 실행하려면 super 키워드가 필요하며, 그렇지 않을 경우 필요하지 않다.

- super.method를 꼭 넣어줘야 하는 상황도 있고, 선택인 상황도 있다. 꼭 필요한지 아닌지는 문서에 보면 대부분 나와있다.



```swift 
cell.accessories = [
    .delete(displayed: .always,
            options: .init(isHidden: false,
                           reservedLayoutWidth: .standard,
                           tintColor: .red,
                           backgroundColor: .green),
            actionHandler: {
                print("삭제 버튼 클릭됨")
            })
]
```

