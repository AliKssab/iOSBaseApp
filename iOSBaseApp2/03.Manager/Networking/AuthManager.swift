//
//  AuthManager.swift
//  AseerAlKotobSwiftUI
//
//  Created by Mohamed Ali on 30/12/2025.
//

import SwiftUI
import Combine

class AuthManager: ObservableObject {
    static let shared = AuthManager()
    
    @Published var isLoggedIn: Bool = true
    
    @MainActor
    func markUnauthorized() {
        APIConfigManager.clearAuthorizationToken()
        isLoggedIn = false
    }
}
