//
//  LoadingViewModifier.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 20/06/2025.
//


import SwiftUI

struct LoadingViewModifier: ViewModifier {
    @ObservedObject var loading = LoadingState.shared

    func body(content: Content) -> some View {
        ZStack {
            content
            if loading.isLoading {
                LoadingOverlay(withBackground: loading.withBackground)
            }
        }
    }
}

extension View {
    func loadingView() -> some View {
        self.modifier(LoadingViewModifier())
    }
}
