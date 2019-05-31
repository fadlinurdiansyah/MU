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
    func getListPlayerFailed(withErrorException error: ErrorExceptionAPI)
    func showLoading()
    func hideLoading()
}

class PlayerPresenter: PlayerViewPresenter {
    
    static func config(withPlayerViewController viewController: PlayerViewController) {
        let presenter = PlayerPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: PlayerView
    let team = "Man United"
    var listPlayerItems: [Player] = []
    var isShowLoading = false
    
    required init(view: PlayerView) {
        self.view = view
    }
    
    func loadPage() {
        isShowLoading = true
        getListPlayer()
    }
    
    func getListPlayer() {
        let playerRequest = PlayerRequest()
        playerRequest.team = team
        
        if isShowLoading {
            view.showLoading()
        }
        
        MUAPI.instance.request(ApiPlayer.getListPlayer(request: playerRequest), success: { (json) in
            let listPlayerDAO = ListPlayerDAO(json: json)
            
            if let listPlayer = listPlayerDAO.listPlayers {
                
                self.listPlayerItems.append(contentsOf: listPlayer.player)
                self.view.hideLoading()
                self.view.getListPlayerSuccess()
            } else {
                
                self.view.getListPlayerFailed(withErrorException: InternalServerErrorException())
            }
            
        }, exception: { (error) in
            self.view.hideLoading()
            self.view.getListPlayerFailed(withErrorException: error)
            }
        )
    }
    
    func getPlayerItem() -> [Player] {
        return listPlayerItems
    }

}
