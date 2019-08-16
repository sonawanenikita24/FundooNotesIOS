//
//  TableViewCell.swift
//  FundooDemo
//
//  Created by BridgeLabz on 13/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var notedesc: UILabel!
    @IBOutlet weak var notetitle: UILabel!
}
