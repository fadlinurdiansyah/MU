//
//  BeritaCell.swift
//  MU
//
//  Created by NDS on 17/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import SDWebImage

protocol BeritaCellDelegate: class {
    func didTapButtonShare()
}

class BeritaCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var newsDescLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var timePostingLabel: UILabel!
    
    var newsData: NewsData? {
        didSet {
            updateUI()
            newsImageView.sd_setImage(with:  newsData?.fullPicture?.toUrl(), placeholderImage: UIImage(named: "img-placeholder"))
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
    
    override func prepareForReuse() {
        newsImageView.image = nil
        newsDescLabel.text = nil
        timePostingLabel.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func likeButton(_ sender: Any) {
        
    }
    
    @IBAction func shareButton(_ sender: Any) {
        delegate?.didTapButtonShare()
    }
    
    func updateUI() {
        
        guard let message = newsData?.message else {
            return
        }
        newsDescLabel.text = message
        
        if let timePost = newsData?.createdTime {
            let postDateFormat = DateFormatter()
            postDateFormat.dateFormat = "yyyy-mm-dd HH:mm:ss"
            let datePost = postDateFormat.date(from: timePost)! as Date
            
            timePostingLabel.text = datePost.timeAgoDisplay()
        }
        
        if let pictureURL = newsData?.fullPicture {
            newsImageView.sd_setImage(with: URL(string: pictureURL), placeholderImage: UIImage(named: "img-placeholder"), options: SDWebImageOptions.refreshCached) { (image, error, cacheType, url) in
                self.newsImageView.image = image
            }
        }
    }
    
    // MARK: Method hitung mundur waktu Kick Off
    func getSecond(withTimeStamp time: String) -> String {
        
        let timePosting = time
        let postDateFormat = DateFormatter()
        postDateFormat.dateFormat = "yyyy-mm-dd HH:mm:ss"
        let datePost = postDateFormat.date(from: timePosting)! as Date
        
        return datePost.timeAgoDisplay()
    }
   
}
