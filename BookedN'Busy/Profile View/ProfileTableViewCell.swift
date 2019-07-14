//
//  ProfileTableViewCell.swift
//  cis454Project
//
//  Created by Shania Daley on 5/4/19.
//  Copyright © 2019 Shania Daley. All rights reserved.
//

import UIKit

// This class formats the user's listings table view
class ProfileTableViewCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var serviceType: UILabel!
    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var availableLable: UILabel!
    @IBOutlet weak var postIDLabel: UILabel!
    @IBOutlet weak var removeListingButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
