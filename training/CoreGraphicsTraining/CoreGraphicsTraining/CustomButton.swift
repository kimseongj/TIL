//
//  CustomButton.swift
//  CoreGraphicsTraining
//
//  Created by kimseongjun on 2023/05/04.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        guard let myContext = UIGraphicsGetCurrentContext() else {
            return
        }
        
        if self.state == .normal {
            // Uncheck
            myContext.setLineWidth(3.0)
            myContext.setStrokeColor(UIColor.black.cgColor)
            
            myContext.addEllipse(in: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            myContext.drawPath(using: .stroke)
        } else if self.state == .selected {
            // Uncheck
            myContext.setLineWidth(3.0)
            myContext.setStrokeColor(UIColor.black.cgColor)
            
            myContext.addEllipse(in: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            myContext.drawPath(using: .stroke)
            
            // Check
            myContext.setStrokeColor(UIColor.blue.cgColor)
            
            myContext.move(to: CGPoint(x: 40, y: 10))
            myContext.addLine(to: CGPoint(x: 25, y: 45))
            myContext.addLine(to: CGPoint(x: 10, y: 30))
            myContext.drawPath(using: .stroke)
        }
    }
}

