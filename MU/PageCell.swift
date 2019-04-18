//
//  PageCell.swift
//  MU
//
//  Created by NDS on 06/04/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import Firebase

class PageCell: UICollectionViewCell {
    @IBOutlet weak var judulLabel: UILabel!
    @IBOutlet weak var boardingImageView: UIImageView!
    @IBOutlet weak var descTextView: UITextView!
    
    var dataBoarding: SaveOnBoarding! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        self.judulLabel.text = dataBoarding.judul
        self.descTextView.text = dataBoarding.description
        
        if let imageURL = dataBoarding.imageURL {
            let imageStorageRef = Storage.storage().reference(forURL: imageURL)
            
            imageStorageRef.getData(maxSize: 2 * 1024 * 1024) { (data, error) in
                if let error = error {
                    print("Error get URL image \(error)")
                } else {
                    if let imgData = data {
                        DispatchQueue.main.async {
                            let image = UIImage(data: imgData)
                            self.boardingImageView.image = image
                        }
                    }
                }
            }
        }
    }
    
}
