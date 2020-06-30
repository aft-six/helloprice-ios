//
//  PushManager.swift
//  HelloPrice
//
//  Created by devming on 2020/06/30.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase

class PushManager: NSObject {
    static let shared = PushManager()
    
    private let messagingObject = Messaging.messaging()
    
    private override init() {
        super.init()
    }
    
    func setup() {
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted && error == nil {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        
        messagingObject.delegate = self
        
        messagingObject.subscribe(toTopic: "abc") { error in
          print("Subscribed to abc topic")
        }
    }
    
    func registerDeviceToken(token: Data) {
        messagingObject.apnsToken = token
    }
}

extension PushManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}

extension PushManager: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        /// TODO: fcmToken을 서버로 보내줘야함.
        print("Firebase registration token: \(fcmToken)")

        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
}
/*
 InstanceID.instanceID().instanceID { result, error in
     if let error = error {
         print("### \(error.localizedDescription)")
     } else if let result = result {
         print("### Remote instance ID token: \(result.token)")
     }
 }
 
 */
