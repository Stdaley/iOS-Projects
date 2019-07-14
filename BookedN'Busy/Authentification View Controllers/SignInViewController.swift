//
//  SignInViewController.swift
//  UserRegistration
//
//
//  Copyright © 2019 Shania Daley. All rights reserved.
//

import UIKit
import Firebase

// This class is the sign in methods for the view controllers
class SignInViewController: UIViewController {

    //Outlets for user input
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Sign in button tapped...
    @IBAction func signInButtonTapped(_ sender: Any) {
        print("Sign in button tapped")
        handleSignIn()
    }
    // Register new account button tapped...
    // Change view controllers to the registration page
    @IBAction func registerNewAccountButton(_ sender: Any) {
        print("Register account button tapped")
        let registerUserViewController = self.storyboard?.instantiateViewController(withIdentifier:"RegisterUserViewController") as!
            RegisterUserViewController
        self.present(registerUserViewController, animated: true)
    }
    
    // When user taps the screen, dismiss the keyboard
    @IBAction func dismissKeyboard(_ sender: Any) {
        userEmailTextField.resignFirstResponder()
        userPasswordTextField.resignFirstResponder() }
    
    // When user taps return the cursor moves to the next text field
    // When return is pressed from the last field. The sign in handler handles sign in
    // As if user pressed sign in button manually
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            switch textField {
        
            case userEmailTextField:
                userEmailTextField.resignFirstResponder()
                userPasswordTextField.becomeFirstResponder()
                break
            case userPasswordTextField:
                userPasswordTextField.resignFirstResponder()
                handleSignIn()
                break
            default:
                break
        }
            return true
    }

    // Objective C handler to handle sign in
    // Set fields to local static variables email, password
    // Use Firebase Authentification to match credentials with the database using static vars
    // If sign in matches... Change view to profile page, else and alert will notify user that credentials are wrong
    @objc func handleSignIn() {
       
        guard let email = userEmailTextField.text else {return}
        guard let password = userPasswordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            
            if error == nil && user != nil {
                self.performSegue(withIdentifier: "toHomeScreen" , sender: self)
            }
            else {
                let alert = UIAlertController(title: "Sign In Failed", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
} // End of Sign In 

