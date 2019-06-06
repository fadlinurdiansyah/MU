//
//  LastSchedulesRequest.swift
//  MU
//
//  Created by NDS on 02/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

class LastSchedulesRequest {
    
    var teamId: String?
    
    func buildForParameters() -> [String: AnyObject] {
        var parameters: [String: AnyObject] = [:]
        parameters["id"] = teamId as AnyObject
        return parameters
    }
}
