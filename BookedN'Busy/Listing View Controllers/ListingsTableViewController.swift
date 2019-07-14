//
//  ListingsTableViewController.swift
//  ServicesPage
//
//  Created by mira jacobs on 4/23/19.
//  Copyright © 2019 mira jacobs. All rights reserved.
//

import UIKit

// Set array of section values to be inputted in UITableView
var listTypes = ["beauty","services","arts"]


// View Listing Choices Table View Class
// This section is used to choose what service the user wants to add a listing to.
// This section only segues to beauty for this sprint due to time constraints
// Only click on the beauty section to review listings
class ListingsTableViewController: UITableViewController {
    
    // List of iems used as subtitles to describe
    var myList = [["name":"Beauty","image":"3","item":"Hair, nails"],
                  ["name":"School Services","image":"2","item":"Tutoring,Resume,CV"],
                  ["name":"Arts","image":"1","item":"photo shoots,etc"]
                 ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func profileButton(_ sender: Any) {
        let controller =  self.storyboard?.instantiateViewController(withIdentifier: "profile")
        self.present(controller!, animated: false, completion: nil)
    }
    // MARK: - Table view data source
    
    // Table View Structure
    // Method Set Height of Cells
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    // Method returns the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // Method returns the number of rows in each section
    // Assigned the count of items of the array to show the exact number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }

    // Method creates a cell structure to be reused to reproduce more cells in the tableview
    // Change the name of the labels and background pictures based off the index of the current row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
        let listObject = myList[indexPath.row]
        
        cell.backgroundImageView.image = UIImage(named: listObject["image"]!)
        cell.nameLabel.text = listObject["name"]
        cell.itemLabel.text = listObject["item"]
        
        return cell
    }
    
    // Method changes the view controller that is present when the cell is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //View controller storyboard id names
        var vc = ""
        switch indexPath.row {
        //When 1 is selected view controller segues to beauty listings
        case 0: //For "one"
            vc = "tab"
        //When 2,3 is selected view controller segues to menu for now
        case 1: //For "two"
            vc = "original"
        default:
            vc = "original"
        }
        //
        let controller =  self.storyboard?.instantiateViewController(withIdentifier: vc)
        self.present(controller!, animated: false, completion: nil)

    }
}
