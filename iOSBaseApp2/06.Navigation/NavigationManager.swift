//
//  NavigationManager.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 7/6/25.
//

import Foundation
import SwiftUI
import Combine

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
        
    }
    
    func reset() {
        path = NavigationPath()
    }
    
    func setStack(_ routes: [AppRoute]) {
        reset()
        routes.forEach { path.append($0) }
    }
    
    func setRoot(_ route: AppRoute) {
        reset()
        push(route)
    }
    
    func setNewRoot(_ route: AppRoute) {
        setStack([route])
    }
}


