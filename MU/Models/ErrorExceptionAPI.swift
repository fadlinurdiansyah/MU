//
//  ErrorExceptionAPI.swift
//  MU
//
//  Created by fadielse on 11/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ErrorExceptionAPI {
    
    enum TypeValue {
        static let noInternetConnection = "no.internet.connection"
        static let internetServerError = "internal.server.error"
        static let errorConvertingJson = "error.converting.json"
    }
    
    static internal let kCodeKey = "code"
    static internal let kTitleKey = "title"
    static internal let kReasonKey = "reason"
    static internal let kMessageKey = "message"
    static internal let kTypeKey = "type"
    static internal let kTypeField = "field"
    
    var code: Int?
    var title: String?
    var reason: String?
    var message: String?
    var type: String?
    
    init(json: JSON? = nil) {
        if let json = json {
            code = json[ErrorExceptionAPI.kCodeKey].int
            title = json[ErrorExceptionAPI.kTitleKey].string
            reason = json[ErrorExceptionAPI.kReasonKey].string
            message = json[ErrorExceptionAPI.kMessageKey].string
            type = json[ErrorExceptionAPI.kTypeKey].string
        }
    }
    
    func isTypeNoInternetConnection() -> Bool {
        return TypeValue.noInternetConnection == type
    }
    
    func isTypeInternalServerError() -> Bool {
        return TypeValue.internetServerError == type
    }
    
    func isTypeErrorConvertingJson() -> Bool {
        return TypeValue.errorConvertingJson == type
    }
}
