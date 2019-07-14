//
//  TimeTableViewCell.swift
//  cis454Project
//
//  Created by Shania Daley on 5/4/19.
//  Copyright © 2019 Shania Daley. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    @IBOutlet weak var dateTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
