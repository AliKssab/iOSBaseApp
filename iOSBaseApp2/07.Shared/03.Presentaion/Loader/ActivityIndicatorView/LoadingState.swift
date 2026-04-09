//
//  LoadingState.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 20/06/2025.
//

import SwiftUI
import Combine

class LoadingState: ObservableObject {
    static let shared = LoadingState()
    
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var withBackground: Bool = true
    
    private let lock = NSLock()
    private init() {}
    
    func show(background: Bool = true) {
        DispatchQueue.main.async {
            self.lock.lock()
            defer { self.lock.unlock() }
            
            if !self.isLoading {
                self.withBackground = background
                self.isLoading = true
            }
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.lock.lock()
            defer { self.lock.unlock() }
            
            self.isLoading = false
        }
    }
}
