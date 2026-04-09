//
//  LabeledDivider.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 23/06/2025.
//


import SwiftUI

struct LabeledDivider: View, FontStyleProtocol, LocalizationTextProtocol {
    // MARK: - Required
    var key: String
    var table: LocalizationFiles = .authentication

    // MARK: - Style
    var fontSizeDelta: CGFloat = -2
    var fontWeight: FontWeight = .medium
    var textColor: AppColor = .iconBorderBlueGray

    // MARK: - Layout
    var lineColor: AppColor = .inputSeparatorGray
    var lineThickness: CGFloat = 0.7
    var horizontalSpacing: CGFloat = 8

    // MARK: - View
    var body: some View {
        HStack {
            Rectangle()
                .fill(lineColor.color)
                .frame(height: lineThickness)

            Text(localizedText)
                .font(font)
                .foregroundColor(textColor.color)
                .padding(.horizontal, horizontalSpacing)

            Rectangle()
                .fill(lineColor.color)
                .frame(height: lineThickness)
        }
        .padding(.horizontal, 16)
    }
}
