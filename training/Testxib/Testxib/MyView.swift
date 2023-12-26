//
//  MyView.swift
//  Testxib
//
//  Created by kimseongjun on 2023/08/16.
//

import UIKit

@IBDesignable
class MyView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    private func configureView() {
        let view = Bundle.main.loadNibNamed("MyView",
                                            owner: self,
                                            options: nil)?.first as! UIView
        view.frame = bounds
        addSubview(view)
    }
}
