//
//  ListNewsDAO.swift
//  MU
//
//  Created by fadielse on 19/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListNewsDAO: BaseDAO {
    
    var listNews: ListNews?
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        
        self.listNews = ListNews(json: json)
    }
}
