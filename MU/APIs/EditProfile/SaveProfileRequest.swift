//
//  SaveProfileRequest.swift
//  MU
//
//  Created by NDS on 01/07/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

class SaveProfileRequest {
    
    var userId: Int?
    var name: String?
    var gender: String?
    var birthday: String?
    var favoritePlayer: String?
    
    func buildForParameters() -> [String: AnyObject] {
        var parameters: [String: AnyObject] = [:]
        parameters["user_id"] = userId as AnyObject
        parameters["name"] = name as AnyObject
        parameters["gender"] = gender as AnyObject
        parameters["birthday"] = birthday as AnyObject
        parameters["favorite_player"] = favoritePlayer as AnyObject
        return parameters
    }
}
