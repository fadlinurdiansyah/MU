//
//  LoadingTVC.swift
//  MU
//
//  Created by NDS on 19/04/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoadingTVC: UITableViewCell {
    
    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        loadingView.startAnimating()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
