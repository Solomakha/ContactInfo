//
//  MyTableViewCell.swift
//  ContactInfo
//
//  Created by Admin on 15.10.2022.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var grImg: UIImageView!
    @IBOutlet weak var grTitle: UILabel!
    @IBOutlet weak var contactCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
