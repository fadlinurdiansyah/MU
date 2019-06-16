//
//  AdminHeaderCell.swift
//  MU
//
//  Created by NDS on 13/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class AdminCellHeader: UITableViewCell {
    
    // MARK: Properties
    var title: String?
    
    @IBOutlet weak var labelTitleHeader: UILabel!
    
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
    
    // MARK: lifecycle
    
    func updateUI() {
        if title != nil {
            self.labelTitleHeader.text = title
        }
    }
    
}
