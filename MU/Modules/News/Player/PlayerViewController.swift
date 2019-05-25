//
//  PlayerViewController.swift
//  MU
//
//  Created by NDS on 25/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum Player {
        // TODO: Add segue ids
    }
}

class PlayerViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var playerCollectionView: UICollectionView!
    
    var presenter: PlayerPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        PlayerPresenter.config(withPlayerViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        
        playerCollectionView.register(PlayerCell.nib, forCellWithReuseIdentifier: PlayerCell.identifier)
    }
}

extension PlayerViewController: PlayerView {
    // TODO: implement view methods
}

extension PlayerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = playerCollectionView.dequeueReusableCell(withReuseIdentifier: PlayerCell.identifier, for: indexPath) as? PlayerCell {
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
}
