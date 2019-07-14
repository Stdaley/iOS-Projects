//
//  ViewController.swift
//  Final2
//
//  Created by Minyen chiang on 4/24/19.
//  Copyright © 2019 Minyen chiang. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import UserNotifications

class MenuViewController: UIViewController, CLLocationManagerDelegate , UNUserNotificationCenterDelegate{
    
   
    @IBOutlet weak var collectionView: UICollectionView!
    var minsToTimer:Double = 0.0
    var textField = UITextField?.self
    
    let titles = ["News","Instagram","Twitter", "Facebook"]
    let images: [UIImage] = [
        UIImage(named: "news_icon")!,
        UIImage(named: "ig_icon")!,
        UIImage(named: "tweet_icon")!,
        UIImage(named: "fb_icon")!
    ]
    
    let locationManager: CLLocationManager = CLLocationManager()

    var menuShowing = false
    
    @IBOutlet weak var LeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     /*
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true{
            let page = self.storyboard?.instantiateViewController(withIdentifier: "PageView") as! PageViewController
            self.navigationController?.pushViewController(page, animated: false)
        }*/
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 10000
        //requesting for PERMISSION
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
            
        })

    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //displaying the ios local notification when app is in foreground
        completionHandler([.alert, .badge, .sound])
    }
    
    @IBAction func Logout(_ sender: Any) {
        //UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
       
      /*  let login = self.storyboard?.instantiateViewController(withIdentifier: "UserLog") as! UserLogViewController
        
        self.navigationController?.popToViewController(login, animated: true)
    }*/
        displayAlert(alertMessage: "Quiting hey !")
        exit(0);
    }
    
    @IBAction func setTime(_ sender: Any) {
        
        let time = UIAlertController(title: "How long?", message: "Please enter minutes", preferredStyle: .alert)
        
        time.addTextField(configurationHandler: { (textField) in
                textField.keyboardType = .decimalPad
                textField.placeholder = "Minutes"
         })
            time.addAction(UIAlertAction(title: "Submit", style: .default) {(action) in
                
                let answer = time.textFields![0]
            if let finalAnswer = Double(answer.text!) {
                let content = UNMutableNotificationContent()
                content.title = "Time To Step Away!"
                content.body = "Your brain is probably FRIED!! Go do work :)"
                content.sound = UNNotificationSound.default
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (finalAnswer*60), repeats: false)
                let request = UNNotificationRequest(identifier: "timer", content: content, trigger: trigger)
                UNUserNotificationCenter.current().delegate = self

                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                
                } else {
                    print("Not a valid number: \(answer.text!)")
                }
            
            })
        time.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(time, animated: true, completion: nil)
        
    }

    @IBAction func OpenMenu(_ sender: Any) {
    if (menuShowing){
        LeadingConstraint.constant = -100
    } else {
        LeadingConstraint.constant = 0
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations:{
        self.view.layoutIfNeeded()
    })
    }
        menuShowing = !menuShowing
}
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for currentLocation in locations{
            print("\(String(describing: index)): \(currentLocation)")
            //"0:location
        }
    }
}

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCollectionViewCell", for: indexPath) as! menuCollectionViewCell
        cell.menuLabel.text = titles[indexPath.item]
        cell.menuPic.image = images[indexPath.item]
        
        return cell
    }
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    var segueIdentifier = ""
        switch indexPath.item {
            case 0: //For "one"
                segueIdentifier = "tonews"
            case 1: //For "two"
                segueIdentifier = "toig"
            case 2: //For "three"
                segueIdentifier = "totweet"
            default:
                segueIdentifier = "tofb"
    
        }
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }

    func displayAlert(alertMessage: String){
        let alertController = UIAlertController(title: "Request", message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action) in alertController.dismiss(animated: true, completion: nil)
            print("Input")
            
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}

