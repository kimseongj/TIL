//
//  SkillCollectionViewCell.swift
//  TestLeftAlignment
//
//  Created by kimseongjun on 2023/05/08.
//

import UIKit
import SnapKit

class SkillCollectionViewCell: UICollectionViewCell {
    
    static let indentifier = "SkillCell"
    
    let yellowRectangleView = YellowRectangleView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetting() {
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1.4
        self.addSubview(label)
//        self.addSubview(yellowRectangleView)
        
        label.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(2)
            
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-2)
        }
        yellowRectangleView.snp.makeConstraints { make in
            make.trailing.equalTo(label.snp.leading).offset(-4)
            make.centerY.equalToSuperview()
        }
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        return label
    }()
}
