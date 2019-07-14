//
//  RegisterExtension.swift
//  cis454Project
//
//  Created by Shania Daley on 4/23/19.
//  Copyright © 2019 Shania Daley. All rights reserved.
//

//Additional methods for register class to reduce clutter 
import UIKit

extension RegisterUserViewController {
    
    //Validity Functions
    // Validity type check //
    // Email and Password Check Refer to PasswordRules.Swift //
    func handleTextChange(field: UITextField) {
        guard let text = field.text else {return}
        switch validityType {
        case .email:
            if text.isValid(validityType) {
                print("Valid Email")
                validityLabel.isHidden = false
                validityLabel.text = "Valid \(validityType)"
            }
            else {
                validityLabel.isHidden = false
                validityLabel.text = "Not a Valid \(validityType)"
            }
            validityLabel.isHidden = true
            
        case .password:
            if text.isValid(validityType) {
                print("Valid Password")
                validityLabel.isHidden = false
                validityLabel.text = "Valid \(validityType)"
                passwordGuidlines.isHidden = true
            }
            else {
                validityLabel.isHidden = false
                validityLabel.text = "Not a Valid \(validityType)"
                passwordGuidlines.isHidden = false
            }
            validityLabel.isHidden = true
            
        default:
            return }
    }

    
    //Basic Functions
    //Return button delegation
    func returnButton(first: UITextField, second: UITextField, third: UITextField, fourth: UITextField, fifth: UITextField) {
        first.delegate = self
        second.delegate = self
        third.delegate = self
        fourth.delegate = self
        fifth.delegate = self
    }
    
    // Display Message //
    func displayMessage(userMessage:String) -> Void {
        let alertController = UIAlertController(title: "", message: userMessage, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setSignUpButton(enabled: Bool){
        if enabled == true {
            signUpButton.isEnabled = true
        }
        else {
            signUpButton.isEnabled = false
        }
    }
    
    func setLabelVisibility(label: UILabel,visible: Bool){
        if visible {
            label.isHidden = false
        }
        else {
            label.isHidden = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (firstNameTextField.text!.isEmpty || lastNameTextField.text!.isEmpty || emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty || repeatPasswordTextField.text!.isEmpty) {
            
            setSignUpButton(enabled: true)
        }
        else{
            setSignUpButton(enabled: true)
        }
    }
    
    
}

extension RegisterUserViewController: UITextFieldDelegate {
    
    //Return key function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTextField:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            repeatPasswordTextField.becomeFirstResponder()
        default:
            
            let valid = signUpButton.isEnabled

            if valid == true {
                validityLabel.text = "Valid Login"
            }
            else {
                displayMessage(userMessage: "Please complete all fields or press cancel")
            }
            repeatPasswordTextField.resignFirstResponder()
            setLabelVisibility(label: validityLabel, visible: false)
        }
        
        return true
    }
}

