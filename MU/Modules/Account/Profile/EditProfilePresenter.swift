//
//  EditProfilePresenter.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol EditProfileViewPresenter: class {
    init(view: EditProfileView)
    func loadListPlayerFavorite()
    func getListGender() -> [String]
    func getCountListGender() -> Int
    func getCountListPlayerFavorite() -> Int
    func getPlayerFavoriteItems() -> [PlayerFavorite]
    func getListPlayerFavorite()
}

protocol EditProfileView: class {
    func getListPlayerFavoriteSuccess()
    func getListPlayerFavoriteFailed(withErrorException error: ErrorExceptionAPI)
}

class EditProfilePresenter: EditProfileViewPresenter {
    
    static func config(withEditProfileViewController viewController: EditProfileViewController) {
        let presenter = EditProfilePresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: EditProfileView
    let listGender = ["Pria", "Wanita"]
    let team = "Man United"
    var listPlayerFavoriteItems: [PlayerFavorite] = []
    
    required init(view: EditProfileView) {
        self.view = view
    }
    
    func loadListPlayerFavorite() {
        getListPlayerFavorite()
    }
    
    func getListPlayerFavorite() {
        let playerFavoriteRequest = PlayerFavoriteRequest()
        playerFavoriteRequest.team = team
        
        MUAPI.instance.request(ApiPlayerFavorite.getListPlayerFavorite(request: playerFavoriteRequest), success: { (json) in
            
            let listPlayerFavoriteDAO = ListPlayerFavoriteDAO(json: json)
            
            if let listPlayerFavorite = listPlayerFavoriteDAO.listPlayerFavorite {
                
                self.listPlayerFavoriteItems.append(contentsOf: listPlayerFavorite.playerFavorite)
                self.view.getListPlayerFavoriteSuccess()
                
            } else {
                
                self.view.getListPlayerFavoriteFailed(withErrorException: InternalServerErrorException())
            }
            
        }, exception: { (error) in
            self.view.getListPlayerFavoriteFailed(withErrorException: error)
            }
        )
    }
    
    func getCountListGender() -> Int {
        return listGender.count
    }
    
    func getListGender() -> [String] {
        return listGender
    }
    
    func getCountListPlayerFavorite() -> Int {
        return listPlayerFavoriteItems.count
    }
    
    func getPlayerFavoriteItems() -> [PlayerFavorite] {
        return listPlayerFavoriteItems
    }
}
