 //
//  ListTableViewCell.swift
//  ServicesPage
//
//  Created by mira jacobs on 4/23/19.
//  Copyright © 2019 mira jacobs. All rights reserved.
//

import UIKit
//This class is used to initialize the fields within the Main selection menu
class ListTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

} // End of List Table View Cell
