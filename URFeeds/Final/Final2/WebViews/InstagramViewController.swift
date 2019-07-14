//
//  InstagramViewController.swift
//  Final2
//
//  Created by Shania Daley on 5/1/19.
//  Copyright © 2019 Minyen chiang. All rights reserved.
//
import UIKit
import WebKit

class InstagramViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var back: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.instagram.com/accounts/login/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func goback(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

