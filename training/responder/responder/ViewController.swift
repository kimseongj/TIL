//
//  ViewController.swift
//  responder
//
//  Created by kimseongjun on 2023/03/16.
//

import UIKit

//class ViewController: UIViewController {
//    let numOfTouchs = 2
//
//       override func viewDidLoad() {
//           super.viewDidLoad()
//
//           // 손가락 1개인 경우
//           let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
//           swipeUp.direction = UISwipeGestureRecognizer.Direction.up
//           self.view.addGestureRecognizer(swipeUp)
//
//           // 손가락 2개인 경우
//           let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
//           swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
//           swipeUpMulti.numberOfTouchesRequired = numOfTouchs
//           self.view.addGestureRecognizer(swipeUpMulti)
//
//       }
//
//       @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
//           if let swipeGesture = gesture as? UISwipeGestureRecognizer {
//               switch swipeGesture.direction {
//               case UISwipeGestureRecognizer.Direction.up:
//
//               case UISwipeGestureRecognizer.Direction.down:
//
//               case UISwipeGestureRecognizer.Direction.left:
//
//               case UISwipeGestureRecognizer.Direction.right:
//
//               default:
//                   break
//               }
//           }
//       }
//
//
//}

class ViewController: UIViewController {
    @IBOutlet var directionLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    var currentPoint: CGPoint!
    var firstPoint: Double!
    var endPoint: Double!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        currentPoint = touch.location(in: view)
        let stringPointX: String = String(format: "%.2f", currentPoint.x)
        let stringPointY: String = String(format: "%.2f", currentPoint.y)
        locationLabel.text = "x: \(stringPointX), y: \(stringPointY)"
        firstPoint = currentPoint.x
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        currentPoint = touch.location(in: view)
        let stringPointX: String = String(format: "%.2f", currentPoint.x)
        let stringPointY: String = String(format: "%.2f", currentPoint.y)
        locationLabel.text = "x: \(stringPointX), y: \(stringPointY)"
        endPoint = currentPoint.x
        
        if firstPoint > endPoint {
            directionLabel.text = "왼쪽"
        } else {
            directionLabel.text = "오른쪽"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
