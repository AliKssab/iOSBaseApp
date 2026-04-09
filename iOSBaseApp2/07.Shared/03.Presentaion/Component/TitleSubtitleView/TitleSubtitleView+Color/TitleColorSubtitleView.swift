//
//  TitleColerSubtitleView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 19/10/2025.
//

 import SwiftUI

struct TitleColorTextView: View, FontStyleProtocol, ColorStyleProtocol, LocalizationTextProtocol {
    
    var key: String
    var table: LocalizationFiles
    
    var fontSizeDelta: CGFloat = 0
    var fontWeight: FontWeight = .bold
    var foregroundColor: AppColor = .black
    var textAlignment: TextAlignment = .center
    
    var highlightedKeys: [String]? = nil
    
    var highlightColor: AppColor = AppColor.primaryPurple
    
    var body: some View {
        let text = localizedText
        let highlightWords = highlightedKeys?.map { $0.localized(from: table) } ?? []
        
         let highlightedText = TextRenderingColorUtils.buildHighlightedText(
            from: text,
            highlights: highlightWords,
            highlightColor: highlightColor
        )
        
        highlightedText
            .font(font)
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(textAlignment)
            .lineSpacing(3)
    }
}
