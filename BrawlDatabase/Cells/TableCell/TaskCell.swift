//
//  TaskCell.swift
//  BrawlDatabase
//
//  Created by IGNACIO OLAGORTA VERA on 19/12/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var lblTaskCell : UILabel!
    @IBOutlet weak var imgTaskCell : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
