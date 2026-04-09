//
//  RadioCircle.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct RadioCircle: View {
    var isSelected: Bool
    var diameter: CGFloat = 18
    var lineWidth: CGFloat = 1
    var selectedFill: Color = Color.appColor(.primaryPurple)
    var borderSelected: Color = Color.appColor(.primaryPurple)
    var borderUnselected: Color = Color.appColor(.backgroundGray)

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(isSelected ? borderSelected : borderUnselected,
                              lineWidth: lineWidth)
                .frame(width: diameter, height: diameter)

            Circle()
                .fill(selectedFill)
                .frame(width: isSelected ? diameter * 0.5 : 0,
                       height: isSelected ? diameter * 0.5 : 0)
                .animation(.easeOut(duration: 0.15), value: isSelected)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text(isSelected ? "Selected" : "Not selected"))
    }
}
