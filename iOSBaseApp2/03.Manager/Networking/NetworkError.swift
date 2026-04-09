//
//  NetworkError.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 6/14/25.
//

import Foundation

enum NetworkError: LocalizedError, Sendable {
    
    case invalidURL
    case unauthorized
    case noData(message: String?)
    case server(message: String?)
    case decoding(Error)
    case underlying(Error)
    case unknown
    
    // MARK: - User Friendly Message
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
            
        case .unauthorized:
            return "Session expired. Please login again."
            
        case .noData(let message):
            return message ?? "No data available."
            
        case .server(let message):
            return message ?? "Server error occurred."
            
        case .decoding:
            return "Failed to parse response."
            
        case .underlying(let error):
            return error.localizedDescription
            
        case .unknown:
            return "Something went wrong."
        }
    }
}

