//
//  RegularTextView.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 24/06/2025.
//


import SwiftUI

struct RegularTextView: View, FontStyleProtocol, ColorStyleProtocol, LocalizationTextProtocol, LineStyleProtocol {
    var key: String
    var table: LocalizationFiles = .authentication
    var fontSizeDelta: CGFloat = 0
    var foregroundColor: AppColor = .deepVioletBlack
    var textAlignment: TextAlignment = .center

    var fontWeight: FontWeight = .regular

    var lineLimit: Int? = nil
    var lineSpacing: CGFloat = 3
    
    var body: some View {
        Text(localizedText)
            .font(font)
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(textAlignment)
            .lineLimit(lineLimit)
            .lineSpacing(lineSpacing)
    }
}
