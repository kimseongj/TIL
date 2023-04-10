view의 draw 메서드란?



#  View Drawing Cycle

Draw : 



The UIKit Graphic System

- 특정 시점에 시스템은 UIView에게 뷰를 그릴 것을 요청
- UIView는 draw 메서드를 통해 뷰를 그림
- 시스템은 콘텐츠의 스냅샷을 캡처함
- 스냅샷이 화면이 표현됨
- 뷰를 다시 그려야 하는 상황이 되면 업데이트를 진행함 



setNeedsDisplay() 화면 다시 그려라



Promotion displays



특정 시점이란?

- 뷰를 가리던 다른 뷰가 움직이거나 제거되는 경우
- 숨겨진 뷰를 다시 보이게 하는 경우
- 스크롤해서 스크린 밖으로 내보냈다가 돌아오는 경우
- 직접 업데이트를 요청하는 경우





Render Loop

Render란?

![](https://i.imgur.com/d5hMnfN.png)



Update Constraints

- View의 layout에 필요한 variable을 Engine 이 계산
- Variable이 변경된 경우 View에게 이를 알림
- 





![](https://i.imgur.com/9PwuDTh.png)

Engine이 오토레이아웃을 계산해주는 친구임





![](https://i.imgur.com/k6PpdBC.png)





##  Modern CollectionView

핵심 키워드 `Compositional layout`, `Diffable Data Source`

- Diffable DataSource란?
  - 달라질 수 있는 능력이 있다.
  - IndexPath를 사용하지 않고, Hashable을 기반으로 동작한다.
  - 

- Compositional Layout란?
  - UICollectionView에서 사용할 수 있는 Layout 중 하나
  - 공식 문서 상 , 유연하고 빠른 컬렉션 뷰의 레이아웃 형태를 구현할 수 있다고 한다.

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





Override Super 

- override를 할 때, 부모의 작업을 실행하려면 super 키워드가 필요하며, 그렇지 않을 경우 필요하지 않다.

- super.method를 꼭 넣어줘야 하는 상황도 있고, 선택인 상황도 있다. 꼭 필요한지 아닌지는 문서에 보면 대부분 나와있다.