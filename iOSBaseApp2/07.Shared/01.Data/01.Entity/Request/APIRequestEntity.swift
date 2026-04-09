//
//  APIRequestEntity.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 6/14/25.
//


import Foundation
import Alamofire

struct APIRequestEntity {
    let endpoint: APIEndpoint
    let body: Encodable?
    let queryParameters: [QueryParameter]?
    let bodyType: RequestBodyType
    
    init(
        endpoint: APIEndpoint,
        queryParameters: [QueryParameter]? = nil,
        body: Encodable? = nil,
        bodyType: RequestBodyType = .json
    ) {
        self.endpoint = endpoint
        self.body = body
        self.queryParameters = queryParameters
        self.bodyType = bodyType
    }
    
    var url: String {
        guard var components = URLComponents(string: endpoint.fullURL) else {
            assertionFailure("❌ Invalid URL: \(endpoint.fullURL)")
            return ""
        }

        if let queryParameters = queryParameters {
            components.queryItems = queryParameters.map { $0.asURLQueryItem }
        }

        guard let finalUrl = components.string else {
            assertionFailure("❌ Failed to construct full URL with query parameters")
            return ""
        }

        return finalUrl
    }

    var method: HTTPMethod {
        endpoint.method.asAlamofireMethod
    }
    
    var headers: HTTPHeaders {
        endpoint.headers
    }
    
    var bodyData: Data? {
        guard let body = body else { return nil }
        
        switch bodyType {
        case .json:
            return try? JSONEncoder().encode(body)
        case .multipart:
            return encodeAsMultipartFormData(body)
        }
    }
}


extension APIRequestEntity {
    
    private func encodeAsMultipartFormData(_ body: Encodable) -> Data? {
        let boundary = "Boundary-\(UUID().uuidString)"
        var bodyData = Data()

        let mirror = Mirror(reflecting: body)
        for child in mirror.children {
            guard let key = child.label else { continue }

            let valueString: String
            if let value = child.value as? CustomStringConvertible {
                valueString = value.description
            } else {
                continue
            }

            bodyData.append("--\(boundary)\r\n".data(using: .utf8)!)
            bodyData.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            bodyData.append("\(valueString)\r\n".data(using: .utf8)!)
        }

        bodyData.append("--\(boundary)--\r\n".data(using: .utf8)!)
        return bodyData
    }
}
