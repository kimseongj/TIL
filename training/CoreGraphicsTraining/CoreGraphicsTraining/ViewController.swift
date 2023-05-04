//
//  ViewController.swift
//  CoreGraphicsTraining
//
//  Created by kimseongjun on 2023/05/04.
//

import UIKit

@IBDesignable
class ViewController: UIViewController {

    @IBAction func clickButton(_ sender: CustomButton) {
        sender.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
}

