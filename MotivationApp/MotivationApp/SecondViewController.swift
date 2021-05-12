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
    var notificationMotivationText : String = String()
    var notificationMotivationPersonName : String = String()
    
    @IBAction func didTimePickerValueChanged(_ sender : UIDatePicker){
        self.timeInt = Int(self.timePicker.countDownDuration) / 60
        
        if timeInt >= 60{
            let hour : Int = timeInt / 60
            let minit : Int = timeInt % 60
            
            if hour < 10 {
                self.timeLabel.text = "0\(hour) : \(minit)"
            }else{
                self.timeLabel.text = "\(hour) : \(minit)"
            }
            
            if minit == 0{
                self.timeLabel.text = "\(hour) : 00"
            }
        }else{
            self.timeLabel.text = "00 : \(timeInt)"
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
        
        notificationContent.title = self.notificationMotivationPersonName
        notificationContent.body  = self.notificationMotivationText

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
