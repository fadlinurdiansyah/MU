//
//  ListSchedulesDAO.swift
//  MU
//
//  Created by NDS on 01/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListSchedulesDAO: BaseDAO {
    
    var listSchedules: ListSchedules?
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        self.listSchedules = ListSchedules(json: json)
    }
}
