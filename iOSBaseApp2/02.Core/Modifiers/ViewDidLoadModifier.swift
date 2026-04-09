//
//  ViewDidLoadModifier.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 12/07/2025.
//


import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    @State private var didLoad = false
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                guard !didLoad else { return }
                didLoad = true
                action()
            }
    }
}
