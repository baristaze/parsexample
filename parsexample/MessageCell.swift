//
//  MessageCell.swift
//  parsexample
//
//  Created by Francisco de la Pena on 5/20/15.
//  Copyright (c) 2015 Baris Taze. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
