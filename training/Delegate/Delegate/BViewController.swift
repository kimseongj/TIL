//
//  BViewController.swift
//  Delegate
//
//  Created by kimseongjun on 2023/01/16.
//
import UIKit

protocol DeliveryData: AnyObject { //AnyObject는 필수로 들어가야 되는듯  
    func returnValue(text: String?)
}

class BViewController: UIViewController {
    weak var delegate: DeliveryData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //@IBAction func
}
