//
//  SchedulesRequest.swift
//  MU
//
//  Created by NDS on 01/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

class SchedulesRequest {
    
    var idLeague: String?
    var seasonLeague: String?
    
    func buildForParameters() -> [String: AnyObject] {
        var parameters: [String: AnyObject] = [:]
        parameters["id"] = idLeague as AnyObject
        parameters["s"] = seasonLeague as AnyObject
        return parameters
    }
}
