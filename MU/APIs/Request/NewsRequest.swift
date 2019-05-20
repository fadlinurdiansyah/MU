//
//  NewsRequest.swift
//  MU
//
//  Created by fadielse on 19/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

class NewsRequest {
    
    var offset: Int?
    var limit: Int?
       
    func buildForParameters() -> [String: AnyObject] {
        var parameters: [String: AnyObject] = [:]
        parameters["offset"] = offset as AnyObject
        parameters["limit"] = limit as AnyObject
        return parameters
    }
}
