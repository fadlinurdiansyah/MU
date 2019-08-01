//
//  ApiSaveProfile.swift
//  MU
//
//  Created by NDS on 01/07/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import Alamofire

enum ApiSaveProfile: URLRequestConvertible {
    
    case saveProfile
    case viewProfile(request: ViewProfileRequest)
    
    var path: String {
        switch self {
        case .saveProfile:
            return "update-profile/"
        case .viewProfile:
            return "profile/"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .saveProfile:
            return .post
        case .viewProfile:
            return .get
        }
    }
    
    var parameter: [String: AnyObject] {
        switch self {
        case .viewProfile(let request):
            return request.buildForParameters()
        case .saveProfile:
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try MUAPI.Endpoint.localUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        urlRequest.httpMethod = method.rawValue
        return try URLEncoding.default.encode(urlRequest, with: self.parameter)
    }
}
