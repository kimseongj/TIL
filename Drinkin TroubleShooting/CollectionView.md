CollectionView 는 Multiple Select를 지원하지 않는다. 



collectionView에서 cell이 선택되거나 해제될 때 cell의 상태변화를 주고 싶은 경우가 있습니다. 이 때 일반적으로 collectionView(didSeleted:)와 collectionView(didDeseleted:) 메서드를 떠올리기 쉽지만 좋은 접근 방법은 아닙니다. **위 메서드들은 상태변화보다는 동작에 사용하는 편이 좋습니다.**

![](https://hackmd.io/_uploads/SJko2TXVh.png)

다중 선택을 위한 메서드 

```swift
collectionView.allowsMultipleSelection = true
```









