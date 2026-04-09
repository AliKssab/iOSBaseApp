//
//  ImageBadgeBackground.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

extension View {
    func imageBadgeBackground(
        _ icon: AppIcon,
        padH: CGFloat = 0, padV: CGFloat = 6,
        insets: EdgeInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    ) -> some View {
        self
            .padding(.horizontal, padH)
            .padding(.vertical, padV)
            .background(
                Image(icon)
                    .resizable(capInsets: insets, resizingMode: .stretch)
            )
            .fixedSize()
    }
}