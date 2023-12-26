//
//  ViewController.swift
//  initTest
//
//  Created by kimseongjun on 2023/07/22.
//

import UIKit

class ViewController: UIViewController {
    private var viewModel: ViewModel!

    func configureView() {
        let view1 = UIView()
        view1.backgroundColor = .black
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(view1)
        NSLayoutConstraint.activate([
            view1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            view1.widthAnchor.constraint(equalToConstant: 100),
            view1.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        configureView()
        // Do any additional setup after loading the view.
    }
}

class ViewModel {
    private let useCase: UseCase
    
    init(useCase: UseCase) {
        self.useCase = useCase
    }
}

class UseCase {
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
}

class Repository {
    
}

