//
//  ViewController.swift
//  CoreAnimationStudy
//
//  Created by kimseongjun on 2023/05/13.
//

import UIKit

@IBDesignable
class ViewController: UIViewController {
    
    @IBOutlet weak var drinkView: DrinkView!
    
    //    let layer: CALayer = {
    //        let layer = CALayer()
    //        layer.frame = .init(x: 0, y: 100, width: 100, height: 100)
    //        return layer
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.layer.addSublayer(layer)
        //        layer.addSublayer(drinkView.layer)
        drinkView.clear()
        drinkView.makeCupPath()
        drinkView.makestrawPath()
        drinkView.makeDrinkPath()
    }
    
    
}

@IBDesignable
class DrinkView: UIView {
    
    let cupShapeLayer = CAShapeLayer()
    let strawShapeLayer = CAShapeLayer()
    let drinkShapeLayer = CAShapeLayer()
    let drinkMaskingShapeLayer = CAShapeLayer()
    
    lazy var width = bounds.width
    lazy var height = bounds.height
    
    
    func clear() {
        cupShapeLayer.fillColor = UIColor.clear.cgColor
        strawShapeLayer.fillColor = UIColor.clear.cgColor
        drinkShapeLayer.fillColor = UIColor.clear.cgColor
        drinkMaskingShapeLayer.fillColor = UIColor.clear.cgColor
        
        cupShapeLayer.strokeColor = UIColor.lightGray.cgColor
        cupShapeLayer.lineWidth = 4
        strawShapeLayer.strokeColor = UIColor.black.cgColor
        strawShapeLayer.lineWidth = 4
        drinkShapeLayer.strokeColor = UIColor.black.cgColor
        drinkShapeLayer.lineWidth = 4
        
        strawShapeLayer.lineCap = strawpath
    }
    
    
    //MARK :- cupPath
    func makeCupPath() {
        let cupPath = UIBezierPath()
        
        cupPath.move(to: CGPoint(x: width * 0.15, y: height * 0.15))
        cupPath.addLine(to: CGPoint(x: width * 0.35, y: height * 0.75))
        cupPath.stroke()
        
        cupPath.move(to: CGPoint(x: width * 0.85, y: height * 0.15))
        cupPath.addLine(to: CGPoint(x: width * 0.65, y: height * 0.75))
        cupPath.stroke()
        
        cupPath.addQuadCurve(to: CGPoint(x: width * 0.35, y: height * 0.75),
                             controlPoint: CGPoint(x: width * 0.5, y: height * 0.825))
        cupPath.stroke()
        
        self.layer.addSublayer(cupShapeLayer)
        cupShapeLayer.path = cupPath.cgPath
    }
    
    
    //MARK :- strawPath
    
    func makestrawPath() {
        let strawPath = UIBezierPath()
        strawPath.lineWidth = 30
        strawPath.lineCapStyle = .round
        
        strawPath.move(to: CGPoint(x: width * 0.95, y: height * 0.05))
        strawPath.addLine(to: CGPoint(x: width * 0.83, y: height * 0.15))
        strawPath.addLine(to: CGPoint(x: width * 0.5, y: height * 0.73))
        strawPath.stroke()
        
        self.layer.addSublayer(strawShapeLayer)
        strawShapeLayer.path = strawPath.cgPath
    }
    
    func makeDrinkPath() {
        let drinkPath = UIBezierPath()
        
        drinkPath.move(to: CGPoint(x: width * 0.15, y: height * 0.15))
        drinkPath.addLine(to: CGPoint(x: width * 0.35, y: height * 0.75))
        drinkPath.addQuadCurve(to: CGPoint(x: width * 0.35, y: height * 0.75),
                               controlPoint: CGPoint(x: width * 0.5, y: height * 0.825))
        //drinkPath.addLine(to: CGPoint(x: width * 0.85, y: height * 0.15))
        drinkPath.stroke()

        self.layer.addSublayer(drinkShapeLayer)
        drinkShapeLayer.path = drinkPath.cgPath
    }
}
