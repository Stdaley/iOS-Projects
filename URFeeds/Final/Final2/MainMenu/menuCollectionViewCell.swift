//
//  menuCollectionViewCell.swift
//  Final2
//
//  Created by Shania Daley on 5/1/19.
//  Copyright © 2019 Minyen chiang. All rights reserved.
//

import UIKit

class menuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var menuPic: UIImageView!
    @IBOutlet weak var placement: UIImageView!
    
    func displayContent(image: UIImage, title: String){
        menuPic.image = image
        menuLabel.text = title
    }
}
