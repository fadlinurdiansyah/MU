//
//  ApiNews.swift
//  MU
//
//  Created by fadielse on 19/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import Alamofire

enum ApiNews: URLRequestConvertible {
    
    case getListNews(request: NewsRequest)
    
    var path: String {
        switch self {
        case .getListNews:
            return "/YOUR_PATH"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getListNews:
            return .get
        }
    }
    
    var parameter: [String: AnyObject] {
        switch self {
        case .getListNews(let request):
            return request.buildForParameters()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try MUAPI.Endpoint.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        urlRequest.httpMethod = method.rawValue
        return try URLEncoding.default.encode(urlRequest, with: self.parameter)
    }
}
