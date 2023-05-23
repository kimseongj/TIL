//
//  ViewController.swift
//  Combine Binding
//
//  Created by kimseongjun on 2023/05/23.
//

import UIKit
import Combine

class ViewController: UIViewController {
    private var cancellables: Set<AnyCancellable> = []
    
    @IBAction func button(_ sender: Any) {
        viewModel.addTodoSchedule(Schedule(title: "ASd", content: "Qwe", expirationDate: Date()))
        print(viewModel.todoSchedules)
        
    }
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        bindViewModel()
    }
    
//    private func bindViewModel() { // B.
//            viewModel.$todoSchedules.sink { [weak self] _ in
//                print(self?.viewModel.todoSchedules)
//            }.store(in: &cancellables)
//        }
}

