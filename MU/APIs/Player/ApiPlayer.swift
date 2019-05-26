//
//  ApiPlayer.swift
//  MU
//
//  Created by NDS on 26/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import Alamofire

enum ApiPlayer: URLRequestConvertible {
    
    case getListPlayer(request: PlayerRequest)
    
    var path: String {
        switch self {
        case .getListPlayer:
            return "searchplayers.php"
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .getListPlayer:
            return .get
        }
        
    }
    
    var parameter: [String: AnyObject] {
        switch self {
        case .getListPlayer(let request):
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
