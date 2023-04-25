//
//  ViewController.swift
//  CombineTraining
//
//  Created by kimseongjun on 2023/04/25.
//

import UIKit

class ViewController: UIViewController {

    let dailyBoxOfficeViewModel = DailyBoxOfficeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad start")
        
        dailyBoxOfficeViewModel.fetchDailyBoxOffice { dailyBoxOffice in
            print(dailyBoxOffice.boxOfficeResult.dailyBoxOfficeList[1].movieName)
        }
    }
}

