//
//  SecondViewController.swift
//  MotivationApp
//
//  Created by 이정우 on 2021/05/08.
//

import UIKit
import UserNotifications

class SecondViewController : UIViewController {
    
    // Notification functions
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        
        userNotificationCenter.requestAuthorization(options: authOptions) { success, error in
            if let error = error {
                print("Error: \(error)")
            }
        }
    }

    
    func sendNotification(seconds: Double) {
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "이정우"
        notificationContent.body  = "집에서 쉬면서 코딩이나 하고 싶다."

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: "mainNotification",
                                            content: notificationContent,
                                            trigger: trigger)

        userNotificationCenter.add(request) { error in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
        
    }
    
    
    
    @IBAction func touchUpInsideCancleButton(){
        dismiss(animated: true)
    }
    
    @IBAction func touchUpInsideStartButton(){
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    }
    
}
