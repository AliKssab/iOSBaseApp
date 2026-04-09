//
//  PaddedScrollView.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 21/07/2025.
//


import SwiftUI

struct PaddedScrollView<Content: View>: View {
    let top: CGFloat
    let bottom: CGFloat
    let spacing: CGFloat
    let content: () -> Content

    init(
        top: CGFloat = 16,
        bottom: CGFloat = 16,
        spacing: CGFloat = 18,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.top = top
        self.bottom = bottom
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: spacing) {
                ClearSpacerView(height: top)
                content()
                ClearSpacerView(height: bottom)
            }
        }
    }
}
