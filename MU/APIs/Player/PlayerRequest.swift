//
//  PlayerRequest.swift
//  MU
//
//  Created by NDS on 26/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

class PlayerRequest {
    
    var team: String?
    
    func buildForParameters() -> [String: AnyObject] {
        var parameters: [String: AnyObject] = [:]
        parameters["t"] = team as AnyObject
        return parameters
    }
}
