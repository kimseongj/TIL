//
//  Cell.swift
//  collectionView11
//
//  Created by kimseongjun on 2023/04/26.
//

import UIKit
// 분기처리를 ViewController에서 해줘야 하나..?
class HoldCollectionViewCell: UICollectionViewCell {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    lazy var yellowRectangleView = YellowRectangleView()
    
    lazy var emptyRectangleView = EmptyRectangleView()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendarad-Bold", size: 14)
        
       return label
    }()
    
    func configureHoldedCell() {
        stackView.addArrangedSubview(yellowRectangleView)
        stackView.addArrangedSubview(contentLabel)
    }
    
    func configureUnholdCell() {
        stackView.addArrangedSubview(emptyRectangleView)
        stackView.addArrangedSubview(contentLabel)
    }
}

// SWIFT
