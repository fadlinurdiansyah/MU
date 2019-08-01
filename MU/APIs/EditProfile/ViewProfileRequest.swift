//
//  ViewProfileRequest.swift
//  MU
//
//  Created by NDS on 06/07/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

class ViewProfileRequest {
    
    var type: String?
    var userId: Int?
    
    func buildForParameters() -> [String: AnyObject] {
        var parameters: [String: AnyObject] = [:]
        parameters["type"] = type as AnyObject
        parameters["user_id"] = userId as AnyObject
        return parameters
    }
}
