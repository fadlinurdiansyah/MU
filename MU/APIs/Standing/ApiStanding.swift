//
//  ApiStanding.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import Alamofire

enum ApiStanding: URLRequestConvertible {
    
    case getListStanding(request: StandingRequest)
    
    var path: String {
        switch self {
        case .getListStanding:
            return "lookuptable.php"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getListStanding:
            return .get
        }
    }
    
    var parameter: [String: AnyObject] {
        switch self {
        case .getListStanding(let request):
            return request.buildForParameters()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try MUAPI.Endpoint.sportsDBUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        urlRequest.httpMethod = method.rawValue
        return try URLEncoding.default.encode(urlRequest, with: self.parameter)
    }
}
