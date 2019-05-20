//
//  BeritaCell.swift
//  MU
//
//  Created by NDS on 17/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

protocol BeritaCellDelegate: class {
    func didTapButtonShare()
}

class BeritaCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var newsDescLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    var newsData: NewsData? {
        didSet {
            newsDescLabel.text = newsData?.message
        }
    }
    
   
    weak var delegate: BeritaCellDelegate?
    
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
    
    // MARK: Lifecycle

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButton(_ sender: Any) {
        
    }
    
    @IBAction func shareButton(_ sender: Any) {
        delegate?.didTapButtonShare()
    }
   
}
