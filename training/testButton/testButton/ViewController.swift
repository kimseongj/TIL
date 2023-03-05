//
//  ViewController.swift
//  testButton
//
//  Created by kimseongjun on 2023/03/03.
//

import UIKit

class ViewController: UIViewController {

    private var pushExpoItemListViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("한국의 출품작 보러 가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityLabel = "한국의 출품작 보러 가기"
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func confgureUI() {
        pushExpoItemListViewButton.translatesAutoresizingMaskIntoConstraints = false
    }


}

