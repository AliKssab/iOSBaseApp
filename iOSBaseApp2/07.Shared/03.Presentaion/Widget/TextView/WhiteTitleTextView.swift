//
//  WhiteTitleTextView.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 03/06/2025.
//


import SwiftUI

struct WhiteTitleTextView: View,FontStyleProtocol, ColorStyleProtocol, LocalizationTextProtocol {
    
    var key: String
    var table: LocalizationFiles
    
    var fontSizeDelta: CGFloat = 0
    var fontWeight: FontWeight = .bold

    var foregroundColor: AppColor = .pureWhite

    var body: some View {
        Text(localizedText)
            .font(font)
            .foregroundColor(foregroundColor)
    }
}
