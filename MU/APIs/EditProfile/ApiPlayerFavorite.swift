//
//  ApiPlayerFavorite.swift
//  MU
//
//  Created by NDS on 24/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import Alamofire

enum ApiPlayerFavorite: URLRequestConvertible {
    
    case getListPlayerFavorite(request: PlayerFavoriteRequest)
    
    var path: String {
        switch self {
        case .getListPlayerFavorite:
            return "searchplayers.php"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getListPlayerFavorite:
            return .get
        }
    }
    
    var parameter: [String: AnyObject] {
        switch self {
        case .getListPlayerFavorite(let request):
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
