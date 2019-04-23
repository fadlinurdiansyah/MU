//
//  BerandaTVC.swift
//  MU
//
//  Created by NDS on 13/04/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire
import SwiftyJSON

class BerandaTVC: UITableViewCell, SDWebImageManagerDelegate {
    
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedStackView: UIStackView!
    @IBOutlet weak var feedLabel: UILabel!
    let screenWidth = UIScreen.main.bounds.size.width
    var heightPic: CGFloat?
    var detailPost: [String: Any]?
    
    var data: Post? {
        didSet {
            updateUI()
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
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.feedImageView.image = nil
        self.feedLabel.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateUI() {
        if let message = data?.message {
            feedLabel.text = message
        }
        
        if let pictureURL = data?.fullPicture {
            if let heightString = detailPost?["height"],
                let widthString = detailPost?["width"] {
                
                let heightFloat = CGFloat(heightString as? Double ?? 0)
                let widthFloat = CGFloat(widthString as? Double ?? 0)
                
                print("Detail Height: \(heightFloat) & Detail Width: \(widthFloat)")
                
                feedImageView.sd_setImage(
                    with: URL(string: pictureURL),
                    placeholderImage: UIImage(named: "placeholder")?.resizeImageWithHeight(self.screenWidth, width: widthFloat, height: heightFloat, opaque: true),
                    options: SDWebImageOptions.refreshCached)
                { ( image, error, cacheType, url ) in
                    self.feedImageView.image = image?.resizeImage(self.screenWidth, opaque: true)
                }

            }
        }
        
    }
}

/* manutd.world?fields=posts.limit(10){id,created_time,message,full_picture,object_id}
 
 link
 */
