//
//  UNNotificationReceiver.swift
//  UserNotificationsPractice
//
//  Created by kjs on 09/05/23.
//

import UserNotifications

final class UNNotificationReceiver: NSObject {
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    deinit {
        print("bye")
    }
}

extension UNNotificationReceiver: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification
    ) async -> UNNotificationPresentationOptions {
        return [.banner, .sound, .badge]
//        return .banner
// 둘이 바꿔치기도 해보세요~
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        print(response.notification.request.content)
        
        let userInfo = response.notification.request.content.userInfo
        print(userInfo["ViewInfo"])
        
        if userInfo["ViewInfo"] == "노란색뷰" {
            NotificationCenter.default.post(name: Notification.Name(<#T##String#>), object: <#T##Any?#>)
        }
    }
}
