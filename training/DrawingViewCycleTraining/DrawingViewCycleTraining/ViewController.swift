//
//  ViewController.swift
//  DrawingViewCycleTraining
//
//  Created by kimseongjun on 2023/04/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: FirstView!
    
    @IBAction func pushButton() {
        configureUI()
    }
    
    lazy var secondView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureUI() {
        view.addSubview(secondView)
        
        NSLayoutConstraint.activate([
        secondView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
        secondView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        secondView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
        ])
    }
}

class FirstView: UIView {
    override func draw(_ rect: CGRect) {
        print("draw되었습니다.")
    }
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        print("setNeedsDisplay호출")
    }
}
