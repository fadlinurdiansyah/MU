//
//  NewsDetailCell.swift
//  MU
//
//  Created by NDS on 18/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class NewsDetailCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
