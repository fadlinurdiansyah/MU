//
//  ListPlayer.swift
//  MU
//
//  Created by NDS on 26/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListPlayer {
    
    var player: [Player] = []
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        
        player = json["player"].arrayValue.map { Player(json: $0)! }
    }
}

class Player {
    
    let idPlayer: String?
    let idTeam: String?
    let idTeamNational: Any?
    let idSoccerXML: String?
    let idPlayerManager: Any?
    let strNationality: String?
    let strPlayer: String?
    let strTeam: String?
    let strTeamNational: Any?
    let strSport: String?
    let intSoccerXMLTeamID: String?
    let dateBorn: String?
    let strNumber: String?
    let dateSigned: String?
    let strSigning: String?
    let strWage: String?
    let strOutfitter: String?
    let strKit: String?
    let strAgent: String?
    let strBirthLocation: String?
    let strDescriptionEN: String?
    let strDescriptionDE: Any?
    let strDescriptionFR: Any?
    let strDescriptionCN: Any?
    let strDescriptionIT: Any?
    let strDescriptionJP: Any?
    let strDescriptionRU: Any?
    let strDescriptionES: Any?
    let strDescriptionPT: Any?
    let strDescriptionSE: Any?
    let strDescriptionNL: Any?
    let strDescriptionHU: Any?
    let strDescriptionNO: Any?
    let strDescriptionIL: Any?
    let strDescriptionPL: Any?
    let strGender: String?
    let strSide: String?
    let strPosition: String?
    let strCollege: Any?
    let strFacebook: String?
    let strWebsite: String?
    let strTwitter: String?
    let strInstagram: String?
    let strYoutube: String?
    let strHeight: String?
    let strWeight: String?
    let intLoved: String?
    let strThumb: String?
    let strCutout: String?
    let strRender: String?
    let strBanner: Any?
    let strFanart1: String?
    let strFanart2: String?
    let strFanart3: String?
    let strFanart4: String?
    let strCreativeCommons: Any?
    let strLocked: String?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        
        idPlayer = json["idPlayer"].stringValue
        idTeam = json["idTeam"].stringValue
        idTeamNational = json["idTeamNational"]
        idSoccerXML = json["idSoccerXML"].stringValue
        idPlayerManager = json["idPlayerManager"].stringValue
        strNationality = json["strNationality"].stringValue
        strPlayer = json["strPlayer"].stringValue
        strTeam = json["strTeam"].stringValue
        strTeamNational = json["strTeamNational"].stringValue
        strSport = json["strSport"].stringValue
        intSoccerXMLTeamID = json["intSoccerXMLTeamID"].stringValue
        dateBorn = json["dateBorn"].stringValue
        strNumber = json["strNumber"].stringValue
        dateSigned = json["dateSigned"].stringValue
        strSigning = json["strSigning"].stringValue
        strWage = json["strWage"].stringValue
        strOutfitter = json["strOutfitter"].stringValue
        strKit = json["strKit"].stringValue
        strAgent = json["strAgent"].stringValue
        strBirthLocation = json["strBirthLocation"].stringValue
        strDescriptionEN = json["strDescriptionEN"].stringValue
        strDescriptionDE = json["strDescriptionDE"].stringValue
        strDescriptionFR = json["strDescriptionFR"].stringValue
        strDescriptionCN = json["strDescriptionCN"].stringValue
        strDescriptionIT = json["strDescriptionIT"].stringValue
        strDescriptionJP = json["strDescriptionJP"].stringValue
        strDescriptionRU = json["strDescriptionRU"].stringValue
        strDescriptionES = json["strDescriptionES"].stringValue
        strDescriptionPT = json["strDescriptionPT"].stringValue
        strDescriptionSE = json["strDescriptionSE"].stringValue
        strDescriptionNL = json["strDescriptionNL"].stringValue
        strDescriptionHU = json["strDescriptionHU"].stringValue
        strDescriptionNO = json["strDescriptionNO"].stringValue
        strDescriptionIL = json["strDescriptionIL"].stringValue
        strDescriptionPL = json["strDescriptionPL"].stringValue
        strGender = json["strGender"].stringValue
        strSide = json["strSide"].stringValue
        strPosition = json["strPosition"].stringValue
        strCollege = json["strCollege"].stringValue
        strFacebook = json["strFacebook"].stringValue
        strWebsite = json["strWebsite"].stringValue
        strTwitter = json["strTwitter"].stringValue
        strInstagram = json["strInstagram"].stringValue
        strYoutube = json["strYoutube"].stringValue
        strHeight = json["strHeight"].stringValue
        strWeight = json["strWeight"].stringValue
        intLoved = json["intLoved"].stringValue
        strThumb = json["strThumb"].stringValue
        strCutout = json["strCutout"].stringValue
        strRender = json["strRender"].stringValue
        strBanner = json["strBanner"].stringValue
        strFanart1 = json["strFanart1"].stringValue
        strFanart2 = json["strFanart2"].stringValue
        strFanart3 = json["strFanart3"].stringValue
        strFanart4 = json["strFanart4"].stringValue
        strCreativeCommons = json["strCreativeCommons"].stringValue
        strLocked = json["strLocked"].stringValue
    }
}
