//
//  ListPlayerDAO.swift
//  MU
//
//  Created by NDS on 26/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListPlayerDAO: BaseDAO {
    
    var listPlayers: ListPlayer?
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        self.listPlayers = ListPlayer(json: json)
    }
}
