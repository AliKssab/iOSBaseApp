//
//  NetworkError.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 6/14/25.
//

import Foundation
enum NetworkError: Error {
    case noData(message: String?)
    case serverError(message: String)
    case invalidURL
    case unauthorized
    case unknown
}

