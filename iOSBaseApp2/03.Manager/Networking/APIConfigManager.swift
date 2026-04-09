//
//  APIConfigManager.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 17/07/2025.
//

import Alamofire
import UIKit
import Combine
enum APIConfigManager {
    private static var _baseURL = "https://speaker-sa.com/api"
    private static var _version = "v1"
    private static var _headers: HTTPHeaders = [
        "Accept": "application/json",
        "Content-Type": "application/json" 

    ]
    
    private static let keychain = KeychainManager.shared

    // MARK: - Getters
    static var baseURL: String { _baseURL }
    static var version: String { _version }
    static var headers: HTTPHeaders {
        var currentHeaders = _headers
        if let tokenData = try? keychain.read(for: "access_token", service: "com.myapp.auth"),
           let token = String(data: tokenData, encoding: .utf8) {
            currentHeaders["Authorization"] = "Bearer \(token)"
        }
        return currentHeaders
    }
    
    // MARK: - Setters
    static func setBaseURL(_ url: String) {
        _baseURL = url
    }
    
    static func setVersion(_ version: String) {
        _version = version
    }
    
    static func setAuthorizationToken(_ token: String) {
        if let data = token.data(using: .utf8) {
            try? keychain.save(data, for: "access_token", service: "com.myapp.auth")
        }
    }
    
    static func clearAuthorizationToken() {
        do {
            try keychain.delete(for: "access_token", service: "com.myapp.auth")
        } catch {
            print("❌ Keychain delete failed:", error)
        }
        _headers.remove(name: "Authorization") // ✅ امسح أي Authorization مخزّن
    }

    
    static func setLng(_ lng: String) {
        _headers["locale"] = lng
    }
    
    static func addHeader(key: String, value: String) {
        _headers[key] = value
    }
}
