//
//  BeritaCell.swift
//  MU
//
//  Created by NDS on 17/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class BeritaCell: UITableViewCell {
    
    // Mark: Properties
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    
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
    
    // Mark: Lifecycle

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButton(_ sender: Any) {
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
    }
   
}
