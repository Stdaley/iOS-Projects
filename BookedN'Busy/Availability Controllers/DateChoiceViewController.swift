//
//  DateChoiceViewController.swift
//  cis454Project
//
//  Created by Shania Daley on 5/4/19.
//  Copyright © 2019 Shania Daley. All rights reserved.
//

import UIKit
//This class is the started to our lister picking thier available times
// Working version should work during demo date

class DateChoiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // This is a live updated table view of the selected times of availability
    // No remove capabilities in this moment
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickedTimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = timeTable.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! TimeTableViewCell
        cell.dateTimeLabel.text = pickedTimes[indexPath.row]
       
        return cell
    }
   
   // Table view reference
    @IBOutlet weak var timeTable: UITableView!
    // Date picker reference
    private var datePick: UIDatePicker?

    //Watches for changes in the array and updates the table view according to the change
    var pickedTimes = [String](){
    didSet {
            timeTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialize a date picker
        datePick = UIDatePicker()
        datePick?.addTarget(self, action: #selector(DateChoiceViewController.dateChanged(datePick:)), for: .valueChanged)
        dateTimeTextField.inputView = datePick
        // Do any additional setup after loading the view.
        
    }
    
    // Text field to select times
    @IBOutlet weak var dateTimeTextField: UITextField!
    
    
    @IBAction func addDateTimeButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "You are trying to enter a duplicate time", message: "Duplicate times are not allowed", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        let alertTwo = UIAlertController(title: "Time Added", message: "", preferredStyle: .alert)
        alertTwo.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM d 'at' hh:mm aaa"
        
        let availableTime = dateFormatter.string(from: datePick!.date)
        
        if pickedTimes.contains(availableTime) {
            self.present(alert, animated: true)
        }
        else {
            pickedTimes.append(availableTime)
            timeTable.reloadData()
            self.present(alertTwo, animated: true)
        }
    }
    
    @IBAction func finishButton(_ sender: Any) {
        performSegue(withIdentifier: "returnToListing", sender: self)
    
    }
    
    
    @objc func dateChanged(datePick: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM d 'at' hh:mm aaa"
        
        let availableTime = dateFormatter.string(from: datePick.date)
        
        dateTimeTextField.text = availableTime
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "returnToListing") {
            let DVC = segue.destination as! AddListFormViewController
            DVC.pickedTimes = pickedTimes
        }
    }
    
    


}

