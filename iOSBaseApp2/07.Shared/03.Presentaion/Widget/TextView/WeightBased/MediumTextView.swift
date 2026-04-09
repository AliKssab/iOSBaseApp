//
//  MediumTextView.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 24/06/2025.
//


import SwiftUI

struct MediumTextView: View, FontStyleProtocol, ColorStyleProtocol, LocalizationTextProtocol, LineStyleProtocol {
    var key: String
    var table: LocalizationFiles = .authentication
    var fontSizeDelta: CGFloat = 0
    var foregroundColor: AppColor = .deepVioletBlack
    var textAlignment: TextAlignment = .center

    var fontWeight: FontWeight { .medium }

    var lineLimit: Int? = nil
    var lineSpacing: CGFloat = 3
    var customFont: Font? = nil

    var body: some View {
        Text(localizedText)
            .font(customFont ?? font)
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(textAlignment)
            .lineLimit(lineLimit)
            .lineSpacing(lineSpacing)
        
    }
}
