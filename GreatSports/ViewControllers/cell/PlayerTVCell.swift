//
//  PlayerTVCell.swift
//  GreatSports
//
//  Created by MONIKA MOHAN on 22/03/2023.
//

import UIKit

class PlayerTVCell: UITableViewCell {
    
    @IBOutlet weak var containerview: UIView!
    @IBOutlet weak var playerTVimg: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerDescription: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    
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
