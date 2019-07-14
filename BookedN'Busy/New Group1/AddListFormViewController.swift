//
//  AddListFormViewController.swift
//  cis454Project
//
//  Created by Shania Daley on 5/2/19.
//  Copyright © 2019 Shania Daley. All rights reserved.
//

import UIKit
import Firebase

// This class is used to structure the add listing form and add the user input to the listing database table
class AddListFormViewController: UIViewController {
    
    // Outlets for each user input field
 
    @IBOutlet weak var posterName: UILabel!
    @IBOutlet weak var posterEmail: UILabel!
    @IBOutlet weak var posterNumber: UITextField!
    @IBOutlet weak var posterService: UITextField!
    @IBOutlet weak var posterBio: UITextView!
    
    // trial
    var pickedTimes: [String] = []

    
    // Reference to the current user
    let currentUse = Auth.auth().currentUser
    // Reference to the listings tree
    var refListing:DatabaseReference!
    var availListing: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fields are pre-filled in with user's name and email in their account details
        posterName.text = currentUse?.displayName ?? ""
        posterEmail.text = currentUse?.email
        
        // Initialize the database to point to the listings tree
        refListing = Database.database().reference().child("listings")
        
       
    }

    // This function uses the database reference to add a listing to the tree
    // Use updateChildValues to avoid overwritting any posts from the current user
    // Allowing them to add multiple listings
    func addListing() {
        let key = refListing.childByAutoId().key
        let uid = (Auth.auth().currentUser?.uid)!
        //Converts the user input to a structured number
        let phoneNumber = posterNumber.text?.toPhoneNumber()

        // An array of all values needed to be placed in the listings tree properly
        let list = [ "userId" : uid,
                     "name": Auth.auth().currentUser?.displayName as Any,
                     "contactEmail": posterEmail.text! ,
                     "contactNumber": phoneNumber as Any,
                     "services": posterService.text!,
                     "bio": posterBio.text!,
                     "listingID":key as Any] as [String : Any]
        let listingPost = ["\(key ?? "")" : list]
        refListing.child(uid).updateChildValues(listingPost)
        self.storyboard?.instantiateViewController(withIdentifier: "MainListings")

    }
    
    //Add Availability Button
    var addTimesAction: (()->())?
    
    @IBAction func addAvailability(_ sender: Any) {
        addTimesAction?()
    }
    
    
    // When cancel is pressed... Dismiss the view controller and return to the present listings screen
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // When done button is pressed...
    @IBAction func doneButton(_ sender: Any) {
        //Confirm the user wants to submit their listing.
        // User pressed confirm, an alert pops up letting them know it was added
        // User pressed cancel, user is brought back to the form
        let alert = UIAlertController(title: "Confirm", message: "Click Confirm to Submit Your Listing", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { action in
            self.addListing()
            let up = UIAlertController(title: "Your Listing Was Added to the Beauty Section \(self.posterName.text!)! ", message: "Your Listings Are In Your Profile", preferredStyle: .alert)
                up.addAction(UIAlertAction(title: "OK", style: .default, handler: {done in
                self.dismiss(animated: true, completion: nil)
            })) // End of Confirm Alert action
        self.present(up, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    
    }// end of done button
}
// This extension formats a string to a regular expression
extension String {
    public func toPhoneNumber() -> String {
        return self.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "$1-$2-$3", options: .regularExpression, range: nil)
    }}


