//
//  NewsRequest.swift
//  MU
//
//  Created by fadielse on 19/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

class NewsRequest {
    
    //contoh
    var pageNo: Int?
    var pageSize: Int?
    
    func buildForParameters() -> [String: AnyObject] {
        var parameters: [String: AnyObject] = [:]
        parameters["pageNo"] = pageNo as AnyObject
        parameters["pageSize"] = pageSize as AnyObject
        return parameters
    }
}
