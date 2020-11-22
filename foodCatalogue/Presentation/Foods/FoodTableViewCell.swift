//
//  FoodTableViewCell.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
