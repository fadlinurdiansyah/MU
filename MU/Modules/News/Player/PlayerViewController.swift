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
    
    var playerData: [Player] = []
    
    var presenter: PlayerPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        PlayerPresenter.config(withPlayerViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        presenter.loadPage()
    }
    
    func setupCollectionView() {
        playerCollectionView.register(PlayerCell.nib, forCellWithReuseIdentifier: PlayerCell.identifier)
    }
}

extension PlayerViewController: PlayerView {
    
    func getListPlayerSuccess() {
        playerData = presenter.getPlayerItem().sorted { $0.strPosition < $1.strPosition }
        playerCollectionView.reloadData()
    }
    
    func showLoading() {
        self.showBlockLoading(withView: self.view)
    }
    
    func hideLoading() {
        self.stopBlockLoading()
    }
    
    func getListPlayerFailed(withErrorException error: ErrorExceptionAPI) {
        if error.isTypeErrorConvertingJson() {
            self.showShowServerError(withView: self.view)
        } else if error.isTypeInternalServerError() {
            self.showShowServerError(withView: self.view)
        } else if error.isTypeNoInternetConnection() {
            self.showErrorConnection(withView: self.view)
        }
    }
}

extension PlayerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let playerCell = playerCollectionView.dequeueReusableCell(withReuseIdentifier: PlayerCell.identifier, for: indexPath) as? PlayerCell {
            
            if self.playerData.indices.contains(indexPath.row) {
                let data = playerData[indexPath.row]
                playerCell.playerData = data
                playerCell.updateUI()
                
            }
            return playerCell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftSpace = 16
        let rightSpace = 16
        let centerSpace = 0
        let frameWidth = self.view.frame.width
        let cellWidth = ((frameWidth / 2) - CGFloat(leftSpace + centerSpace + rightSpace))
        let cellHeight = cellWidth
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
