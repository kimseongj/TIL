//
//  ViewController.swift
//  HitTest
//
//  Created by kimseongjun on 2023/03/18.
//

import UIKit

class ViewController: UIViewController {
     
    let greenView = GreenView()
    let orangeView = OrangeView()
    let purpleView = PurpleView()
    let blueView = BlueView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOrangeView))
        greenView.addGestureRecognizer(tapGesture)
    }
    
    func configureUI() {
        view.addSubview(greenView)
        greenView.addSubview(orangeView)
        greenView.addSubview(purpleView)
        view.addSubview(blueView)
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenView.heightAnchor.constraint(equalToConstant: 400),
            greenView.widthAnchor.constraint(equalToConstant: 300),
            
            orangeView.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 80),
            orangeView.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
            orangeView.heightAnchor.constraint(equalToConstant: 100),
            orangeView.widthAnchor.constraint(equalToConstant: 200),
            
            purpleView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: -50),
            purpleView.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
            purpleView.heightAnchor.constraint(equalToConstant: 100),
            purpleView.widthAnchor.constraint(equalToConstant: 200),
            
            blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueView.heightAnchor.constraint(equalToConstant: 100),
            blueView.widthAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
    @objc func tapOrangeView() {
        if greenView.backgroundColor == .green {
            greenView.backgroundColor = .black
        } else {
            greenView.backgroundColor = .green
        }
    }
}

class GreenView: UIView {
    let textA: String = "GreenView"
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {

        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {

                    return hitTestView
                }
            }
            print("Green")
            return self
        }
        return nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Error")
    }
}

class OrangeView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    return hitTestView
                }
            }
            print("Orange")
            return self
        }
        return nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Error")
    }
}

class PurpleView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    return hitTestView
                }
            }
            print("Purple")
            return self
        }
        return nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Error")
    }
}

class BlueView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    
                    
                    return hitTestView
                }
            }
            print("Blue")
            return self
        }
        return nil
    }
    
    let button = CustomButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .blue
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Error")
    }
    
    func configureUI() {
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: -40),
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalToConstant: 140)
        ])
        
    }
}

class CustomButton: UIButton {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    
                    return hitTestView
                }
            }
            print("YellowButton")
            return self
        }
        return nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        
        self.setTitle("Button", for: .normal)
        self.setTitleColor(.blue, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
