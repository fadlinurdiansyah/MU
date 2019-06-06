//
//  ListLastSchedulesDAO.swift
//  MU
//
//  Created by NDS on 02/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListLastSchedulesDAO: BaseDAO {
    
    var listLastSchedules: ListLastSchedules?
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        self.listLastSchedules = ListLastSchedules(json: json)
    }
}
