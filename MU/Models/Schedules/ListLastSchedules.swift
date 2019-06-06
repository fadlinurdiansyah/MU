//
//  ListLastSchedules.swift
//  MU
//
//  Created by NDS on 02/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListLastSchedules {
    
    var events: [Results] = []
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        events = json["results"].arrayValue.map { Results(json: $0)! }
    }
}

class Results {
    
    let idEvent: String?
    let idSoccerXML: String?
    let strEvent: String?
    let strFilename: String?
    let strSport: String?
    let idLeague: String?
    let strLeague: String?
    let strSeason: String?
    let strDescriptionEN: Any?
    let strHomeTeam: String?
    let strAwayTeam: String?
    let intHomeScore: String?
    let intRound: String?
    let intAwayScore: String?
    let intSpectators: Any?
    let strHomeGoalDetails: String?
    let strHomeRedCards: String?
    let strHomeYellowCards: String?
    let strHomeLineupGoalkeeper: String?
    let strHomeLineupDefense: String?
    let strHomeLineupMidfield: String?
    let strHomeLineupForward: String?
    let strHomeLineupSubstitutes: String?
    let strHomeFormation: String?
    let strAwayRedCards: String?
    let strAwayYellowCards: String?
    let strAwayGoalDetails: String?
    let strAwayLineupGoalkeeper: String?
    let strAwayLineupDefense: String?
    let strAwayLineupMidfield: String?
    let strAwayLineupForward: String?
    let strAwayLineupSubstitutes: String?
    let strAwayFormation: String?
    let intHomeShots: String?
    let intAwayShots: String?
    let dateEvent: String?
    let datetimeEventUTC: Any?
    let strDate: String?
    let strTime: String?
    let strTVStation: Any?
    let idHomeTeam: String?
    let idAwayTeam: String?
    let strResult: Any?
    let strCircuit: Any?
    let strCountry: Any?
    let strCity: Any?
    let strPoster: Any?
    let strFanart: String?
    let strThumb: String?
    let strBanner: Any?
    let strMap: Any?
    let strTweet1: Any?
    let strTweet2: Any?
    let strTweet3: Any?
    let strVideo: Any?
    let strLocked: String?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        
        idEvent = json["idEvent"].stringValue
        idSoccerXML = json["idSoccerXML"].stringValue
        strEvent = json["strEvent"].stringValue
        strFilename = json["strFilename"].stringValue
        strSport = json["strSport"].stringValue
        idLeague = json["idLeague"].stringValue
        strLeague = json["strLeague"].stringValue
        strSeason = json["strSeason"].stringValue
        strDescriptionEN = json["strDescriptionEN"].stringValue
        strHomeTeam = json["strHomeTeam"].stringValue
        strAwayTeam = json["strAwayTeam"].stringValue
        intHomeScore = json["intHomeScore"].stringValue
        intRound = json["intRound"].stringValue
        intAwayScore = json["intAwayScore"].stringValue
        intSpectators = json["intSpectators"].stringValue
        strHomeGoalDetails = json["strHomeGoalDetails"].stringValue
        strHomeRedCards = json["strHomeRedCards"].stringValue
        strHomeYellowCards = json["strHomeYellowCards"].stringValue
        strHomeLineupGoalkeeper = json["strHomeLineupGoalkeeper"].stringValue
        strHomeLineupDefense = json["strHomeLineupDefense"].stringValue
        strHomeLineupMidfield = json["strHomeLineupMidfield"].stringValue
        strHomeLineupForward = json["strHomeLineupForward"].stringValue
        strHomeLineupSubstitutes = json["strHomeLineupSubstitutes"].stringValue
        strHomeFormation = json["strHomeFormation"].stringValue
        strAwayRedCards = json["strAwayRedCards"].stringValue
        strAwayYellowCards = json["strAwayYellowCards"].stringValue
        strAwayGoalDetails = json["strAwayGoalDetails"].stringValue
        strAwayLineupGoalkeeper = json["strAwayLineupGoalkeeper"].stringValue
        strAwayLineupDefense = json["strAwayLineupDefense"].stringValue
        strAwayLineupMidfield = json["strAwayLineupMidfield"].stringValue
        strAwayLineupForward = json["strAwayLineupForward"].stringValue
        strAwayLineupSubstitutes = json["strAwayLineupSubstitutes"].stringValue
        strAwayFormation = json["strAwayFormation"].stringValue
        intHomeShots = json["intHomeShots"].stringValue
        intAwayShots = json["intAwayShots"].stringValue
        dateEvent = json["dateEvent"].stringValue
        datetimeEventUTC = json["datetimeEventUTC"].stringValue
        strDate = json["strDate"].stringValue
        strTime = json["strTime"].stringValue
        strTVStation = json["strTVStation"].stringValue
        idHomeTeam = json["idHomeTeam"].stringValue
        idAwayTeam = json["idAwayTeam"].stringValue
        strResult = json["strResult"].stringValue
        strCircuit = json["strCircuit"].stringValue
        strCountry = json["strCountry"].stringValue
        strCity = json["strCity"].stringValue
        strPoster = json["strPoster"].stringValue
        strFanart = json["strFanart"].stringValue
        strThumb = json["strThumb"].stringValue
        strBanner = json["strBanner"].stringValue
        strMap = json["strMap"].stringValue
        strTweet1 = json["strTweet1"].stringValue
        strTweet2 = json["strTweet2"].stringValue
        strTweet3 = json["strTweet3"].stringValue
        strVideo = json["strVideo"].stringValue
        strLocked = json["strLocked"].stringValue
        
    }
}
