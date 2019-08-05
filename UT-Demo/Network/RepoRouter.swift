//
//  RepoRouter.swift
//  UT-Demo
//
//  Created by maithigiang on 8/4/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Alamofire

enum RepoRouter: URLRequestConvertible {
    case getRepos(parameters: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .getRepos:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getRepos :
            return "/search/repositories"
        }
    }
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Config.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getRepos(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
