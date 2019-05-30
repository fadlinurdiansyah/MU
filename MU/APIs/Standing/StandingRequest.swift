//
//  StandingRequest.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

class StandingRequest {
    
    var idLeague: String?
    var seasonLeague: String?
    
    func buildForParameters() -> [String: AnyObject] {
        var parameters: [String: AnyObject] = [:]
        parameters["l"] = idLeague as AnyObject
        parameters["s"] = seasonLeague as AnyObject
        return parameters
    }
}
