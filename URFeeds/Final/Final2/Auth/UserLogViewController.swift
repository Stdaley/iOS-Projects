//
//  UserLogViewController.swift
//  Final2
//
//  Created by Minyen chiang on 4/30/19.
//  Copyright © 2019 Minyen chiang. All rights reserved.
//

import UIKit
import CoreData


class UserLogViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var passText: UITextField!
    var matchname = ""
    var matchpass = ""
    var userArray: [Users] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //var container: NSPersistentContainer!
   
    
    
    
    @IBAction func Authentication(_ sender: Any) {
    
        matchname = self.NameText!.text!
        matchpass = self.passText!.text!
        
        if matchname == "Ryan" && matchpass == "Cz123" {
            //UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
            let page = self.storyboard?.instantiateViewController(withIdentifier: "PageView") as! PageViewController
            self.navigationController?.pushViewController(page, animated: true)
            
        } else { print("wrong password")
                 
        }
        
    }
    

    
    /* let persistenceManager: PersistenceManager
    
    init(persistenceManager: PersistenceManager){
        self.persistenceManager = persistenceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("throw me one")
    }
    
    */
    
/*
    @IBAction func Authentication(_ sender: UIButton) {
        
     
        
        if (matchname == "Ryan" && matchpass = "123") {
            let login = self.storyboard?.instantiateViewController(withIdentifier: "Login") as! Login
            self.navigationController?.pushViewController(login, animated: true)
        } else {
            return
        }
      /*  let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        let searchName = self.NameText?.text
        request.predicate = NSPredicate(format: "userName CONTAINS[cd] %@", searchName! )
        
        var outputSTR = "" */
   /*     do {
            let result = try context.fetch(request)
            if result.count > 0 {
                for online in result {
                let oneName = (online as AnyObject).value(forKey: "userName") as! String
                let onePass = (online as AnyObject).value(forKey: "passWord") as! String
                    if (matchname == oneName && matchpass == onePass){
                        UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
                        self.performSegue(withIdentifier: "takeUsertoHome", sender: self)
                    }
                    else { print("no user found")
                        return 
                    }
                }}else {
                outputSTR = "ddd"
            }
            
        } catch {
            print(error)
        }
        
      
        
    }
    */
    func fetchData(){
        
      
        
        do {
            userArray = try context.fetch(Users.fetchRequest())
            
            
        } catch {
            print(error)
            
        }
    }
    */
    @IBAction func dismissKeyboard(_ sender: Any) {
    
    NameText.resignFirstResponder()
    passText.resignFirstResponder()
    
}


func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    return true
}
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    self.view.endEditing(true)
}

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    NameText.resignFirstResponder()
    passText.resignFirstResponder()
    
    
    return true
}


override func viewDidLoad() {
    super.viewDidLoad()
    NameText.delegate = self
    passText.delegate = self
    
  /* if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(homeView, animated: false)
    }*/
    //   persistenceManager.
    
    // Do any additional setup after loading the view.
}

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
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
class PersistentContainer: NSPersistentContainer {
    
    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}
