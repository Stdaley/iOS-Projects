//
//  FirstViewController.swift
//  cis454Project
//
//  Created by Shania Daley on 4/7/19.
//  Copyright © 2019 Shania Daley. All rights reserved.
//

import UIKit

// This class formats the Sign In/ Sign Up Segue Page
// Swipe left or swipe right to sign in or sign up
class FirstViewController: UIViewController {

    //Outlets for formatting
    @IBOutlet var leftRect: UIView!
    @IBOutlet var rightRect: UIView!
    @IBOutlet var leftPanelView: UIView!
    @IBOutlet var rightPanelView: UIView!
    
    override func viewDidLoad() {
    // Use of CGLayer Methods to format views
        super.viewDidLoad()
        setCornerRadius(target: leftPanelView)
        setCornerRadius(target: rightPanelView)
        
        let leftPic = UIImageView()
        leftPic.image = UIImage(named: "ll")
        leftPic.frame = leftPanelView.bounds
        leftPanelView.addSubview(leftPic)
        leftPanelView.sendSubviewToBack(leftPic)
        
        let rightPic = UIImageView()
        rightPic.image = UIImage(named: "rr")
        rightPic.frame = rightPanelView.bounds
        rightPanelView.addSubview(rightPic)
        rightPanelView.sendSubviewToBack(rightPic)
        
        //Left Panel Customization
        setCornerRadius(target: leftRect)
        setShadowPath(target: leftRect)
        //Right Panel Customization
        setCornerRadius(target: rightRect)
        setShadowPath(target: rightRect)
}
    
    // Handlers for left and right swipes
    @IBAction func handleRightSwipe(_ sender: UISwipeGestureRecognizer) {
        sender.direction = .right
        print("Swiped right")
    }
    
    @IBAction func handleLeftSwipe(_ sender: UISwipeGestureRecognizer) {
         sender.direction = .left
          print("Swiped left")
    }
    
    // Functions to format views
    func setCornerRadius(target: UIView) {
        target.layer.cornerRadius = 10
        target.clipsToBounds = true
    }
    
    func setShadowPath(target: UIView){
        target.addShadow(offset: CGSize.init(width: 0, height: 5), color: UIColor.black, radius: 2.0, opacity: 0.47)
        target.layer.shadowPath = UIBezierPath(roundedRect: target.bounds, cornerRadius: 10).cgPath
        target.layer.shouldRasterize = true
        target.layer.rasterizationScale = UIScreen.main.scale
    }
    
} // End of First View Controller class

