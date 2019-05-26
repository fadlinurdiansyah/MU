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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.setColors(backgroundWithColor: ColorConstants.primaryRed, textWithColor: UIColor.white)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        presenter.loadPage()
    }
    
    func setupCollectionView() {
        playerCollectionView.register(PlayerCell.nib, forCellWithReuseIdentifier: PlayerCell.identifier)
    }
    
    @IBAction func backBarButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("Tess Back")
    }
}

extension PlayerViewController: PlayerView {
    
    func getListPlayerSuccess() {
        playerData = presenter.getPlayerItem()
        playerCollectionView.reloadData()
    }
}

extension PlayerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
    
}
