//
//  ViewController.swift
//  Final2
//
//  Created by Shania Daley on 5/1/19.
//  Copyright © 2019 Minyen chiang. All rights reserved.
//

import UIKit
import WebKit

class TwitterViewController: UIViewController {

    
    @IBOutlet weak var wbView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.twitter.com")
        let request = URLRequest(url: url!)
        wbView.load(request)
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    
    }
    
    
  
}
