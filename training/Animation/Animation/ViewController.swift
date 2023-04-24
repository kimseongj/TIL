//
//  ViewController.swift
//  Animation
//
//  Created by kimseongjun on 2023/04/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var animationView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        
        return view
    }()
    
    private lazy var button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Animation1", for: .normal)
        button.addTarget(self, action: #selector(button1Action), for: .touchUpInside)
        
        return button
    }()
    
    @objc func button1Action() {
        print("button1")
        self.animationView.snp.makeConstraints {
          $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(60)
          $0.centerX.equalToSuperview()
          $0.size.equalTo(120)
        }
    }
    
    private lazy var button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Animation2", for: .normal)
        
        return button
    }()
    
    @objc func button2Action() {
        print("button2")
        UIView.animate(withDuration: 1, delay: 0, animations: { self.animationView.frame = CGRect(x:0, y:0, width: 200, height: 200)
        })
    }
    
    private lazy var button3: UIButton = {
        let button = UIButton()
        button.backgroundColor = .magenta
        button.setTitle("Animation3", for: .normal)
        button.addTarget(self, action: #selector(button3Action), for: .touchUpInside)
        
        return button
    }()
    
    @objc func button3Action() {
        print("button3")
        self.animationView.snp.remakeConstraints {
          $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(16)
          $0.centerX.equalToSuperview()
          $0.size.equalTo(240)
        }
        
        UIView.animate(withDuration: 1, delay: 0, animations: animationView.layoutIfNeeded)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        configureUI()
        setButton()
    }
    
    private func configureUI() {
        view.addSubview(animationView)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        self.animationView.snp.makeConstraints {
          $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(16)
          $0.centerX.equalToSuperview()
          $0.size.equalTo(120)
        }
        
        button1.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(button2.snp.leading).offset(-20)
        }
        
        button2.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(50)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
        }
        
        button3.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalTo(button2.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setButton() {
        button1.addTarget(self, action: #selector(button1Action), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Action), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3Action), for: .touchUpInside)
    }
}
