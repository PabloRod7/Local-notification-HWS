//
//  ViewController.swift
//  Project21
//
//  Created by Pablo Rodrigues on 06/01/2023.
//
import UserNotifications
import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(initialSchedule))
    }
    
    @objc func initialSchedule() {
        scheduleLocal(delaySecond: 5)
        
        }
    
    @objc func registerLocal() {
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, . sound]){ granted, error in
            if granted {
                print("YES")
            } else  {
                print("NOO")
                
            }
        }
        
    }
    
    @objc func scheduleLocal(delaySecond: TimeInterval) {
        registerCategory()
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "late wake me up"
        content.body = "the early birs catch the worm, but the late mouse get the cheese"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData" : "fizzbuzz"]
        content.sound = .default
        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 10
//        dateComponents.minute = 30
        
//      let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: delaySecond, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        
        
        
    }
    
    func registerCategory() {
        
        let center = UNUserNotificationCenter.current()
         center.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "Show me more...", options: .foreground)
        let delay = UNNotificationAction(identifier: "delay", title: "Remind me later...",options: .foreground)
       
        let category = UNNotificationCategory(identifier: "alarm", actions: [show, delay], intentIdentifiers: [])
        
        center.setNotificationCategories([category])
       
        
    }
    

    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
       
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("custom Data received \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
//                swiped to unlock
                let ac = UIAlertController(title: "Swipe", message: "", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "ok", style: .default))
                present(ac, animated: true)
            case "show":
//                the user tapped shoe more ...
                let ac = UIAlertController(title: "Button", message: "The user tapped the tell me more button", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Ok", style: .default))
                present(ac, animated: true)
            case "delay":
//                user delayed..
                scheduleLocal(delaySecond: 3600*24)
                print("so daqui a 24h")
                
            default:
                break
            }
        }
        completionHandler()
        
        
    }


}

