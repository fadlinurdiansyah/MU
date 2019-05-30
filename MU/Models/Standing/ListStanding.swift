//
//  Standing.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListStanding {
    
    var table: [Table] = []
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        table = json["table"].arrayValue.map { Table(json: $0)! }
    }
}

class Table {
    
    let name: String?
    let teamid: String?
    let played: Int?
    let goalsfor: Int?
    let goalsagainst: Int?
    let goalsdifference: Int?
    let win: Int?
    let draw: Int?
    let loss: Int?
    let total: Int?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        name = json["name"].stringValue
        teamid = json["teamid"].stringValue
        played = json["played"].intValue
        goalsfor = json["goalsfor"].intValue
        goalsagainst = json["goalsagainst"].intValue
        goalsdifference = json["goalsdifference"].intValue
        win = json["win"].intValue
        draw = json["draw"].intValue
        loss = json["loss"].intValue
        total = json["total"].intValue
    }
}
