//
//  OutlinedButton.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 23/06/2025.
//


import SwiftUI

struct OutlinedButton: View {
    var key: String
    var table: LocalizationFiles = .buttonTitles
    var isEnabled: Bool = false

    var action: () -> Void

    // Optional customizations
    var iconName: AppIcon? = nil
    var iconPositionLeading: Bool = false
    var fontSizeDelta: CGFloat = 0
    var fontWeight: FontWeight = .bold
    var cornerRadius: CGFloat = 16
    var height: CGFloat = 56
    var horizontalPadding: CGFloat = 0

    var foregroundColor: AppColor? = nil
    var borderColor: AppColor? = nil
    var borderWidth: CGFloat? = nil

    var body: some View {
        SolidButton(
            key: key,
            table: table,
            isEnabled:isEnabled,
            horizontalPadding: horizontalPadding,
            action: action,
            iconName: iconName,
            iconPositionLeading: iconPositionLeading,
            fontSizeDelta: fontSizeDelta,
            fontWeight: fontWeight,
            cornerRadius: cornerRadius,
            height: height,
            isOutlined: true,
            foregroundColor: foregroundColor,
            backgroundColor: .white,
            borderColor: borderColor,
            borderWidth: borderWidth
        )
    }
}
