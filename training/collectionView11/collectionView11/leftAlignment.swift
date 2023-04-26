//
//  leftAlignMent.swift
//  collectionView11
//
//  Created by kimseongjun on 2023/04/26.
//
// 왼쪽 정렬만 가능한 Layout
import UIKit

class CollectionViewLeftAlignFlowLayout: UICollectionViewFlowLayout {
    let cellSpacing: CGFloat = 10
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? { // UICollectionViewLayoutAttributes가 각 Cell의 특성을 나타내주는 클래스인듯
        self.minimumLineSpacing = 10
        self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // Cell의 위, 아래, 좌, 우 여백
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
