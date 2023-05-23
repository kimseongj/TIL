//
//  ViewController.swift
//  UserNotificationsPractice
//
//  Created by kjs on 09/05/23.
//

import UIKit

final class ViewController: UIViewController {
    let center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        center.requestAuthorization(
            options: [.alert, .sound, .badge]
        ) { [weak self] granted, error in
            if granted {
                self?.sendLocalNotification()
            } else if let error {
                print("error \(error)")
            } else {
                print("something wrong")
            }
        }
    }
}

private extension ViewController {
    func sendLocalNotification() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy/MM/dd hh:mm:ss"
        
        let contents = UNMutableNotificationContent()
        contents.badge = 1
        contents.title = "안녕하세요 노티피케이션입니다."
        contents.body = dateFormatter.string(from: Date())
        contents.sound = .defaultCritical
        contents.userInfo = ["ViewInfo": "노란색뷰"]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let request = UNNotificationRequest(identifier: "request", content: contents, trigger: trigger)
        
        center.add(request) { (error) in
            if let error {
                print(error)
            }
        }
    }
}

