//
//  ListNews.swift
//  MU
//
//  Created by fadielse on 19/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListNews {
    
    var data: [NewsData] = []
    let message: String?
    let success: Bool?
    let paging: Paging?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        
        data = json["data"].arrayValue.map { NewsData(json: $0)! }
        message = json["message"].stringValue
        success = json["success"].boolValue
        paging = Paging(json: json["paging"])
    }
    
    func hasNext() -> Bool {
        return (paging?.next != nil)
    }
}

class NewsData {
    
    let idNews: String?
    let createdTime: String?
    let message: String?
    let fullPicture: String?
    let heightPicture: Int?
    let widthPicture: Int?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        
        idNews = json["id"].stringValue
        createdTime = json["created_time"].stringValue
        message = json["message"].stringValue
        fullPicture = json["full_picture"].stringValue
        heightPicture = json["height_picture"].intValue
        widthPicture = json["width_picture"].intValue
    }
}

class Paging {
    
    let previous: Any?
    let next: String?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        
        previous = json["previous"].string
        next = json["next"].string
    }
}
