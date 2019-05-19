//
//  NewsModel.swift
//  MU
//
//  Created by NDS on 19/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class NewsModel {
    
    let data: [Data]?
    let message: String?
    let success: Bool?
    let paging: Paging?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        
        data = json["data"].arrayValue.map { Data(json: $0)! }
        message = json["message"].stringValue
        success = json["success"].boolValue
        paging = Paging(json: json["paging"])
    }
}

class Data {
    
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

class Paging: BasePagination {
    
}
