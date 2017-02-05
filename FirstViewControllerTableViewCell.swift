//
//  FirstViewControllerTableViewCell.swift
//  ShongTodoLocator
//
//  Created by admin on 03.02.17.
//  Copyright © 2017 Weeabos. All rights reserved.
//

import UIKit

class FirstViewControllerTableViewCell: UITableViewCell {
    /* this controllers only purpose is the visiblity of 
     * locationLabelFC to share it on the detail View
     */
    @IBOutlet var locationLabelFC: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
