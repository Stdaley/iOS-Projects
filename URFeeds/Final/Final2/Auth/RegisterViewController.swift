//
//  RegisterViewController.swift
//  Final2
//
//  Created by Minyen chiang on 5/1/19.
//  Copyright © 2019 Minyen chiang. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController, UITextFieldDelegate {

   var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var EnterButton: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    var USERNAME = ""
    var PASSWORD = ""
    

  
  //  EnterButton.isEnabled = false
    
   // @NSManaged public var userName: String
    
    
    
    @IBAction func SignUpNewUsers(_ sender: Any) {
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        USERNAME = self.username!.text!
        PASSWORD = self.password!.text!
       
        if ( PASSWORD == "" || USERNAME == "" ){
            displayAlert(alertMessage: "Come on, make an acount!")
            
        } else {
           
            newUser.setValue(self.password!.text, forKey: "passWord")
            newUser.setValue(self.username!.text!, forKey: "userName")
            let page = self.storyboard?.instantiateViewController(withIdentifier: "PageView") as! PageViewController
            self.navigationController?.pushViewController(page, animated: true)
            do {
                try context.save()
                print(newUser)
                print("saved successfully")
            } catch {
                print("error")
                
            }
       
        }
        
        
    }

        
    

   
    @IBAction func dismissKeyboard(_ sender: Any) {
        username.resignFirstResponder()
        password.resignFirstResponder()
        
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        username.resignFirstResponder()
        password.resignFirstResponder()
        
        
        return true
    }
    
    
    func displayAlert(alertMessage: String){
        let alertController = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { (action) in alertController.dismiss(animated: true, completion: nil)
            print("Input")
            
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        username.delegate = self
        password.delegate = self
        
     //   persistenceManager.

        // Do any additional setup after loading the view.
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

