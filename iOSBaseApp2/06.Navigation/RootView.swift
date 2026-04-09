//
//  RootView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI
struct RootView: View {
    @StateObject private var nav = NavigationManager()
    @ObservedObject var authManager = AuthManager.shared
    
    var body: some View {
        Group {
            if authManager.isLoggedIn {
                NavigationStack(path: $nav.path) {
                    ContentView()
                        .navigationDestination(for: AppRoute.self) { route in
                            destination(for: route)
                        }
                }
                .environmentObject(nav)
            } else {
                NavigationStack {
//                    AuthSelectionView()
                }
            }
        }
    }
    
    @ViewBuilder
    private func destination(for route: AppRoute) -> some View {
        switch route {
        case .startup(.onboarding):
            ContentView()
        case .startup(.splash):
            ContentView()
        
        }
    }
}
