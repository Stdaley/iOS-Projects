//
//  PasswordRules.swift
//  cis454Project
//
//  Created by Shania Daley on 4/22/19.
//  Copyright © 2019 Shania Daley. All rights reserved.
//

import UIKit
// This file uses regular expressions to check the validity of user input in register page
// Name needs to be 2- 15 characters and be only letters
// Email must be 2-64 letters, numbers , or certain symbols. Contain a @ and end in a .___
// Password must be at least 6 characters and must have a capital, lowercase, number, and special character
// Returns a bool if isValid {true}
extension String {
    
    enum ValidityType {
        case name
        case email
        case password
    }
enum Regex: String {
    
    case name = "[A-Za-z]{2,15}"
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case password = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{6,}$"
}

func isValid(_ validityType: ValidityType) -> Bool {
    let format = "SELF MATCHES %@"
    var regex = ""
    
    switch validityType {
    case .name:
        regex = Regex.name.rawValue
    case .email:
        regex = Regex.email.rawValue
        
    case .password:
        regex = Regex.password.rawValue
    }
    return NSPredicate(format: format, regex).evaluate(with: self)
    
}
}
