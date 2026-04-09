//
//  SubtitleTextView.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 03/06/2025.
//


import SwiftUI

struct SubtitleTextView: View,FontStyleProtocol, ColorStyleProtocol, LocalizationTextProtocol {
    
    var key: String
    var table: LocalizationFiles = .authentication
    
    var fontSizeDelta: CGFloat = -2
    var fontWeight: FontWeight = .regular
    
    var foregroundColor: AppColor = .subtitle
    
    var textAlignment: TextAlignment = .center
    
    var body: some View {
        Text(localizedText)
            .font(font)
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(textAlignment)
            .lineSpacing(4)
    }
}
