//
//  NewsViewController.swift
//  Final2
//
//  Created by Shania Daley on 5/2/19.
//  Copyright © 2019 Minyen chiang. All rights reserved.
//

import UIKit
import WebKit

class NewsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var newsWeb: WKWebView!
    
    
    let urls: [String] = [ "https://www.nytimes.com", "https://www.cnn.com", "https://www.washingtonpost.com", "https://www.usatoday.com", "https://news.google.com/", "http://dailyorange.com", "http://www.espn.com"]
    
    var pickerChoices: [String] = []
    var choice: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerChoices = ["NY Times", "CNN", "Washington Post", "USA Today", "Google News", "Daily Orange", "ESPN"]
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true , completion: nil)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerChoices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerChoices[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var site = URLRequest(url: URL(string: "www.google.com")!)
        site = setRequest(url: urls[0])
        newsWeb.load(site)
        
        switch  row {
        case 0 :
            choice = urls[0]
             site = setRequest(url: choice)
            newsWeb.load(site)
        case 1:
            choice = urls[1]
             site = setRequest(url: choice)
            newsWeb.load(site)
        case 2:
            choice = urls[2]
             site = setRequest(url: choice)
            newsWeb.load(site)
        case 3:
            choice = urls[3]
             site = setRequest(url: choice)
            newsWeb.load(site)
        case 4:
            choice = urls[4]
             site = setRequest(url: choice)
            newsWeb.load(site)
        case 5:
            choice = urls[5]
             site = setRequest(url: choice)
            newsWeb.load(site)
        default:
            choice = urls[6]
             site = setRequest(url: choice)
            newsWeb.load(site)
        }
    }
    
    func setRequest (url: String) -> URLRequest{
        let site = URL(string: url)
        let request = URLRequest(url: site!)
        return request
    }


 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

