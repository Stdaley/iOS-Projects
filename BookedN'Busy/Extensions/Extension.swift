//
//  Extension.swift
//  cis454Project
//
//  Created by Shania Daley on 4/8/19.
//  Copyright © 2019 Shania Daley. All rights reserved.
//

import UIKit

// View formatting to add shadow
extension UIView {
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
