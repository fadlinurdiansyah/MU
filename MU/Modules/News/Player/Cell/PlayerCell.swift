//
//  PlayerCell.swift
//  MU
//
//  Created by NDS on 25/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import SDWebImage

class PlayerCell: UICollectionViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    var playerData: Player?
    
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        playerImage.image = UIImage(named: "img-player-placeholder")?.imageWithGradient()
    }
    
    func updateUI() {
        guard let playerName = playerData?.strPlayer else { return }
        playerNameLabel.text = playerName
        
        if let playerPicURL = playerData?.strCutout {
            playerImage.sd_setImage(with: playerPicURL.toUrl(), placeholderImage: UIImage(named: "img-player-placeholder"))
        }
        
    }

}
