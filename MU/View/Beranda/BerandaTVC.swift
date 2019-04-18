//
//  BerandaTVC.swift
//  MU
//
//  Created by NDS on 13/04/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class BerandaTVC: UITableViewCell {
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedStackView: UIStackView!
    @IBOutlet weak var feedLabel: UILabel!
    
    var feeds: Feeds? {
        
        didSet {
//            updateUI()
        }
    }
    
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
    
    private func updateUI() {
        
        let screenSize = UIScreen.main.bounds.size
        
        if
            let image = feeds?.image,
            let desc = feeds?.desc
        {
            feedLabel.text = desc
            feedImageView.image = UIImage(named: image)?.resizeImage(screenSize.width, opaque: true)
        }
        
    }
}
