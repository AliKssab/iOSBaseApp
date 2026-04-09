//
//  HTTPRequestMethod.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 6/14/25.
//

import Alamofire
import Foundation

enum HTTPRequestMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
    case patch   = "PATCH"
}

extension HTTPRequestMethod {
    var asAlamofireMethod: HTTPMethod {
        switch self {
        case .get: return .get
        case .post: return .post
        case .put: return .put
        case .delete: return .delete
        case .patch: return .patch
        }
    }
}
