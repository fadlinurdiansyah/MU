//
//  PlayerPresenter.swift
//  MU
//
//  Created by NDS on 25/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol PlayerViewPresenter: class {
    init(view: PlayerView)
    func loadPage()
    func getPlayerItem() -> [Player]
}

protocol PlayerView: class {
    func getListPlayerSuccess()
}

class PlayerPresenter: PlayerViewPresenter {
    
    static func config(withPlayerViewController viewController: PlayerViewController) {
        let presenter = PlayerPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: PlayerView
    let team = "Man United"
    var listPlayerItems: [Player] = []
    
    required init(view: PlayerView) {
        self.view = view
    }
    
    func loadPage() {
        getListPlayer()
    }
    
    func getListPlayer() {
        let playerRequest = PlayerRequest()
        playerRequest.team = team
        
        MUAPI.instance.request(ApiPlayer.getListPlayer(request: playerRequest), success: { (json) in
            let listPlayerDAO = ListPlayerDAO(json: json)
            
            if let listPlayer = listPlayerDAO.listPlayers {
                
                self.listPlayerItems.append(contentsOf: listPlayer.player)
                self.view.getListPlayerSuccess()
            } else {
                
                print("Error append list player")
            }
            
        }) { (error) in
            print("\(error)")
        }
    }
    
    func getPlayerItem() -> [Player] {
        return listPlayerItems
    }
}
