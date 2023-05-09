//
//  ViewController.swift
//  CoreAnimation
//
//  Created by kimseongjun on 2023/05/08.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button: Button!
    
    let layer: CALayer = {
        let layer = CALayer()
        layer.frame = .init(x: 100, y: 100, width: 100, height: 100)
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(layer)
        layer.addSublayer(button.layer)
        
    }
    
    func rotateButton() {
        
    }
    
}

@IBDesignable
class Button: UIButton {
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineWidth(4)
        context.setStrokeColor(UIColor.green.cgColor)
        
        let width = bounds.width
        let height = bounds.height
        
        let circleFrame = bounds.insetBy(dx: width * 0.05, dy: height * 0.05)
        
        context.addEllipse(in: circleFrame)
        context.drawPath(using: .stroke)
        
        context.move(to: CGPoint(x: width * 0.5, y: height * 0.15))
        context.addLine(to: CGPoint(x: width * 0.5, y: height*0.85))
        
        context.move(to: CGPoint(x: width * 0.15, y: height * 0.5))
        context.addLine(to: CGPoint(x: width * 0.85, y: height * 0.5))
        
        context.drawPath(using: .stroke)
    }
}
