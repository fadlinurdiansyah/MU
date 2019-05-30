//
//  ListStandingDAO.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListStandingDAO: BaseDAO {
    
    var listStandings: ListStanding?
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        self.listStandings = ListStanding(json: json)
    }
}
