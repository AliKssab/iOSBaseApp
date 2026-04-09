//
//  BaseState.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 03/11/2024.
//

import Foundation

enum BaseState<T> {
    case idle
    case loading
    case success(T)
    case error(String)
}


extension BaseState {
    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }
}
