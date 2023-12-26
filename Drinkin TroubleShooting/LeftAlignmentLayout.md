```swift
class CollectionViewLeftAlignFlowLayout: UICollectionViewFlowLayout {
    let cellSpacing: CGFloat = 8
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin
            leftMargin += layoutAttribute.frame.width + cellSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
        
        return attributes
    }
}
```



- `minimumLineSpacing`을 통해 cell간 최소간격을 표현합니다.
- `sectionInset`으로 Section간 여백을 0으로 설정합니다.
- `super.layoutAttributesForElements(in: rect)`을 사용하여 현재 영역에 있는 `attributes`(각 셀의 크기와 위치 정보)를 가져옵니다.
- `attributes?.forEach`를 통해 각 `cell`의 특성에 접근합니다.
- `maxY`를 -1로 하여 cell의 첫 행일 때, `maxY`보다 값이 크면 `leftMargin`을 `sectionInset.left `(x == 0)인 부분으로 바꿔줍니다.
- 그 이후에 `leftMargin`을 `layoutAttribute.frame.origin.x`에 넣어줌으로써 `cell`의 x위치를 `leftMargin`으로 바꿔줍니다.
- `leftMargin`에 현재 `cell`의 크기 더하기 `leftMargin`을 해서 다시 `leftMargin`에 넣어줍니다.
- `maxY`를 현재 `cell`의 y좌표값과 비교하여 더 큰값을 다시 `maxY`에 넣어줍니다.



### CollectionView LeftAlignmentLayout 구현

> 디자인에 따라 구현함에 있어 CollectionViewCell들이 왼쪽 정렬이 되도록 구현해야 하는 과정이 있었습니다. 왼쪽 정렬을 구현하려면 flowLayout을 커스텀 제작이 필요했습니다. 따라서 아래와 같이 구현했습니다.