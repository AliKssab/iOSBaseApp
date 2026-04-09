//
//  TitleTextView.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 03/06/2025.
//


import SwiftUI

struct TitleTextView: View,FontStyleProtocol, ColorStyleProtocol, LocalizationTextProtocol {
    
    var key: String
    var table: LocalizationFiles = .authentication
    
    var fontSizeDelta: CGFloat = 0
    var fontWeight: FontWeight = .bold
    
    var foregroundColor: AppColor = .deepVioletBlack
    
    var textAlignment: TextAlignment = .center
    
    var highlightedKeys: [String]? = nil
    
    var highlightColor: Color = .red
    
    var body: some View {
        Text(localizedText)
            .font(font)
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(textAlignment)
            .lineSpacing(3)
    }
}
