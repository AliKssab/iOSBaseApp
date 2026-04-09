//
//  StackedTappableTextView.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 24/06/2025.
//


import SwiftUI

struct StackedTappableTextView: View {

    // MARK: - Required
    var subtitleKey: String
    var mainKey: String
    var table: LocalizationFiles = .authentication
    var action: (() -> Void)?

    // MARK: - Text Style
    var subtitleColor: AppColor = .darkGray
    var subtitleFontSizeDelta: CGFloat = -2
    var subtitleFontWeight: FontWeight = .regular

    var mainFontSizeDelta: CGFloat = -2
    var mainFontWeight: FontWeight = .medium
    var mainColor: AppColor = .primaryPurple
    var underlineThickness: CGFloat = 0.9
    var underlineOffsetFromText: CGFloat = 1
    var showUnderline: Bool = true

    var body: some View {
        VStack(spacing: 2) {
            SubtitleTextView(
                key: subtitleKey,
                table: table,
                fontSizeDelta: subtitleFontSizeDelta,
                fontWeight: subtitleFontWeight,
                foregroundColor: subtitleColor
            )
            
            UnderlinedTappableText(
                key: mainKey,
                table: table,
                action: action,
                fontSizeDelta: mainFontSizeDelta,
                fontWeight: mainFontWeight,
                foregroundColor: mainColor,
                underlineThickness: underlineThickness,
                underlineOffsetFromText: underlineOffsetFromText,
                showUnderline: showUnderline
            )
        }
        .frame(minHeight: 40)
        .padding(.horizontal, 16)
        .contentShape(Rectangle())
    }
}
#Preview("") {
    StackedTappableTextView(subtitleKey: "subtitle", mainKey: "33")
}
