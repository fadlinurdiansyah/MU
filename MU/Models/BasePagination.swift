//
//  BasePagination.swift
//  MU
//
//  Created by NDS on 19/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON


class BasePagination {
    
    let previous: Any?
    let next: String?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        
        previous = json["previous"]
        next = json["next"].stringValue
    }
}
