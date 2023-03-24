//
//  PlayerDetailTVCell.swift
//  GreatSports
//
//  Created by MONIKA MOHAN on 24/03/2023.
//

import UIKit

class PlayerDetailTVCell: UITableViewCell {
    @IBOutlet weak var about: UITextView!
    
    @IBOutlet weak var descriptionL: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var heightConstarin: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}



