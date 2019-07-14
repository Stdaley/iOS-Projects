//
//  FacebookViewController.swift
//  Final2
//
//  Created by Shania Daley on 5/1/19.
//  Copyright © 2019 Minyen chiang. All rights reserved.
//

import UIKit
import WebKit

class FacebookViewController: UIViewController {

    @IBOutlet weak var fbView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.facebook.com/login/")
        let request = URLRequest(url: url!)
        fbView.load(request)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
