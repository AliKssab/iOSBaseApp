//
//  UnderlinedTappableTextWithIcon.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 23/06/2025.
//


import SwiftUI

struct UnderlinedTappableTextWithIcon: View {

    // MARK: - Required
    var key: String
    var table: LocalizationFiles
    var action: (() -> Void)?

    // MARK: - Icon
    var iconName: AppIcon?
    var iconColor: AppColor? = nil
    var iconSize: CGFloat = 26

    // MARK: - Text Style + Underline
    var fontSizeDelta: CGFloat = -2
    var fontWeight: FontWeight = .medium
    var foregroundColor: AppColor = .primaryPurple
    var underlineThickness: CGFloat = 0.9
    var underlineOffsetFromText: CGFloat = 1

    var body: some View {
            HStack(spacing: 4) {
                UnderlinedTappableText(
                    key: key,
                    table: table,
                    action: action,
                    fontSizeDelta: fontSizeDelta,
                    fontWeight: fontWeight,
                    foregroundColor: foregroundColor,
                    underlineThickness: underlineThickness,
                    underlineOffsetFromText: underlineOffsetFromText
                )

                if let iconName {
                    ScaledFitImageView(imageName: iconName, size: iconSize, color: iconColor)
                }
            }
            .frame(height: 40)
            .padding(.horizontal, 16)
    }
}
