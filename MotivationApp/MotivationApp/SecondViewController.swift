//
//  SecondViewController.swift
//  MotivationApp
//
//  Created by 이정우 on 2021/05/08.
//

import UIKit
import UserNotifications

class SecondViewController : UIViewController {
    
    @IBOutlet weak var timePicker : UIDatePicker!
    @IBOutlet weak var timeLabel : UILabel!
    
    var timeInt : Int = Int()
    
    
    @IBAction func didTimePickerValueChanged(_ sender : UIDatePicker){
        self.timeInt = Int(self.timePicker.countDownDuration) / 60
        if timeInt >= 60{
            let hour : Int = timeInt / 60
            let minit : Int = timeInt % 60
            self.timeLabel.text = "\(hour)시간 \(minit)분"
            if minit == 0 {
                self.timeLabel.text = "\(hour)시간"
            }
        }else{
            self.timeLabel.text = "\(timeInt)분"
        }
        
    }
    
    
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
        notificationContent.body  = self.timeLabel.text!

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
        sendNotification(seconds: 1)
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    }
    
}
