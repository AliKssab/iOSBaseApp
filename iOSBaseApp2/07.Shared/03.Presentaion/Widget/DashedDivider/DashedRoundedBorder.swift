//
//  DashedRoundedBorder.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

// MARK: Dashed rounded border helper
struct DashedRoundedBorder: ViewModifier {
    var color: Color
    var lineWidth: CGFloat = 2
    var cornerRadius: CGFloat = 18
    var dash: [CGFloat] = [3,3]
    var visible: Bool = true

    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    color.opacity(visible ? 1 : 0),
                    style: StrokeStyle(lineWidth: lineWidth,
                                       lineCap: .round,
                                       lineJoin: .round,
                                       dash: dash)
                )
        )
    }
}
extension View {
    func dashedBorder(color: Color,
                      lineWidth: CGFloat = 2,
                      cornerRadius: CGFloat = 18,
                      dash: [CGFloat] = [3,3],
                      visible: Bool = true) -> some View {
        modifier(DashedRoundedBorder(color: color,
                                     lineWidth: lineWidth,
                                     cornerRadius: cornerRadius,
                                     dash: dash,
                                     visible: visible))
    }
}
