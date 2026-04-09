//
//  QueryParameter.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 6/14/25.
//

import Foundation


struct QueryParameter {
    let name: String
    let value: String?

    var asURLQueryItem: URLQueryItem {
        .init(name: name, value: value)
    }
}
