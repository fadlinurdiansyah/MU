//
//  LoadingCell.swift
//  MU
//
//  Created by NDS on 19/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class LoadingCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var newsLoading: UIActivityIndicatorView!
    @IBOutlet weak var textNewsLoading: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsLoading.startAnimating()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
