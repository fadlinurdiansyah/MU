//
//  ApiSchedules.swift
//  MU
//
//  Created by NDS on 01/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import Alamofire

enum ApiSchedules: URLRequestConvertible {
    
    case getListSchedules(request: SchedulesRequest)
    case getLastSchedules(request: LastSchedulesRequest)
    case getNextSchedules(request: NextSchedulesRequest)
    
    var path: String {
        switch self {
        case .getListSchedules:
            return "eventsseason.php"
        case .getLastSchedules:
            return "eventslast.php"
        case .getNextSchedules:
            return "eventsnext.php"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getListSchedules:
            return .get
        case .getLastSchedules:
            return .get
        case .getNextSchedules:
            return .get
        }
    }
    
    var parameter: [String: AnyObject] {
        switch self {
        case .getListSchedules(let request):
            return request.buildForParameters()
        case .getLastSchedules(let request):
            return request.buildForParameters()
        case .getNextSchedules(let request):
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
