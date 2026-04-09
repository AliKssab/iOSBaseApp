//
//  APIEndpoint.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 6/14/25.
//

import Alamofire

protocol APIEndpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPRequestMethod { get }
    var headers: HTTPHeaders { get }
    var fullURL: String { get }
}

extension APIEndpoint {
    var baseURL: String {
        APIConfigManager.baseURL
    }
    
    var version: String {
        "v1"
    }
    
    var fullURL: String {
        return baseURL + path
    }

    var headers: HTTPHeaders {
        APIConfigManager.headers
    }
}
