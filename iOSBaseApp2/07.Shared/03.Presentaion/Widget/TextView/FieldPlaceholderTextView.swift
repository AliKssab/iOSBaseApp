//
//  FieldPlaceholderTextView.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 19/06/2025.
//


import SwiftUI

struct FieldPlaceholderTextView: View, FontStyleProtocol, ColorStyleProtocol, LocalizationTextProtocol {
    var key: String
    var table: LocalizationFiles

    var fontSizeDelta: CGFloat = -2
    var fontWeight: FontWeight = .regular
    var foregroundColor: AppColor = .darkGray

    var body: some View {
        Text(localizedText)
            .font(font)
            .foregroundColor(foregroundColor)
    }
}
