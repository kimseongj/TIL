//
//  SkillCollectionView.swift
//  TestLeftAlignment
//
//  Created by kimseongjun on 2023/05/08.
//

import UIKit

class SkillCollectionView: UICollectionView {
    
    override var contentSize: CGSize{
        didSet {
            if oldValue.height != self.contentSize.height {
                invalidateIntrinsicContentSize()
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return contentSize
    }    
}
