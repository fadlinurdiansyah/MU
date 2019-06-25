//
//  ListPlayerFavoriteDAO.swift
//  MU
//
//  Created by NDS on 24/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListPlayerFavoriteDAO: BaseDAO {
    
    var listPlayerFavorite: ListPlayerFavorite?
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        self.listPlayerFavorite = ListPlayerFavorite(json: json)
    }
}
