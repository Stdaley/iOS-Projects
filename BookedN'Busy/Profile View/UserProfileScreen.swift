//
//  UserProfileScreen.swift
//  cis454Project
//
//  Created by Shania Daley on 5/3/19.
//  Copyright © 2019 Shania Daley. All rights reserved.
//

import UIKit
import Firebase

// This is the User Profile View Controller
class UserProfileScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Table View Presenting listings made only by the signed in user
    @IBOutlet weak var proTableView: UITableView!
    // Outlets for fields
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // Referene to the database
    var ref: DatabaseReference!
    // Array holding Listing object of values fetched from the database
    var userListing = [Listing]()
    
    // Variables to hold signed in user's email and display name (full name)
    var fullName:String!
    var email: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         fetchUser()
         fetchUserListings()
        
        userNameLabel.text = fullName
        emailLabel.text = email
    }
    
    // Function fetches user name and email from User Firebase class
    func fetchUser() {
         fullName = Auth.auth().currentUser?.displayName
         email = Auth.auth().currentUser?.email
    }
   
    // THis function fetches the listings under "listings" tree in the database
    // Finds the userUID key associated with current user signed in
    // Loops through all listings under that user's UID
    // Returns all listings and appends them to the userlisting array
    func fetchUserListings(){
        
        let uid = Auth.auth().currentUser?.uid
        ref = Database.database().reference().child("listings").child(uid!)
        
        ref.observe (DataEventType.value , with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.userListing.removeAll()
                    // All children of the uid node
                    for listings in snapshot.children.allObjects as! [DataSnapshot] {
                        let list = listings.value as? [String: AnyObject]
                        if (list?["userId"] as? String) != nil {
                            
                            let name = list?["name"] as! String? ?? ""
                            print(name as Any)
                            let listingID = list?["listingID"] as! String? ?? ""
                            print(listingID as Any)
                            let contactNumber = list?["contactNumber"] as! String? ?? ""
                            print(contactNumber as Any)
                            _ = list?["contactEmail"] as! String? ?? ""
                            let bio = list?["bio"] as! String? ?? ""
                            print(bio as Any)
                            let services = list?["services"] as! String? ?? ""
                            print(services as Any)
                            let availability = list?["avail"] as! String? ?? ""
                            print(availability as Any)
                            let add = Listing(postedBy: name, number: contactNumber, listID: listingID, bio: bio, service: services, availability: availability)
                            
                            self.userListing.append(add)
                        } // end of userid loop
                        // Reload the table view data
                        self.proTableView.reloadData()
                    } //end of listings loop
            }//end of children count loop
        }) //end of observe
    }//end of fetch posts
    
    // Table View functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = proTableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! ProfileTableViewCell
        
        cell.serviceType.text = self.userListing[indexPath.row].service
        cell.contactNumberLabel.text = self.userListing[indexPath.row].number
        cell.availableLable.text = self.userListing[indexPath.row].availability
        cell.postIDLabel.text = self.userListing[indexPath.row].listID

        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // Log out button handler. Brings user to main screen
    @IBAction func handleLogout(_ sender: UIButton) {
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "logOut", sender: self)
    }
    

}
