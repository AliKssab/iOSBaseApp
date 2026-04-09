//
//  TitleSubtitleView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct TitleSubtitleView: View {
    let titleKey: String
    let subtitleKey: String?
    var subtitle: String?
    var table: LocalizationFiles = .startupFlow
    var textAlignment: TextAlignment = .center
    var highlightedKeys: [String]? = nil
    var spacing:CGFloat?
    var titleFontSize:CGFloat = 2
    var subtitleFontSize:CGFloat = 14
    var horizontalPadding:CGFloat = 16
    var body: some View {
        VStack(alignment: textAlignment.asHorizontalAlignment, spacing: spacing) {
            TitleTextView(key: titleKey, table: table, fontSizeDelta: titleFontSize, textAlignment: textAlignment)
            
            if let subtitleKey {
                let localizedSubtitle =  (subtitle ?? "")  + subtitleKey.localized(from: table)
                let highlightWords = highlightedKeys?.map { $0.localized(from: table) } ?? []
                let highlightText = TextRenderingUtils.buildHighlightedText(from: localizedSubtitle, highlights: highlightWords)
                highlightText
//                RegularTextView(key: subtitleKey, table: table, fontSizeDelta: subtitleFontSize, foregroundColor: .subtitle, textAlignment: textAlignment, lineSpacing: 2)
                    .multilineTextAlignment(textAlignment)
                    .font(.primary(weight: .regular, size: subtitleFontSize))
                    .lineSpacing(2)
                    .fixedSize(horizontal: false, vertical: true)   // ⭐ يلفّ وياخد ارتفاعه الطبيعي

                    .frame(maxWidth: .infinity, alignment: textAlignment.asAlignment)
            }
        }
        .frame(maxWidth: .infinity, alignment: textAlignment.asAlignment)
//        .padding(.horizontal, horizontalPadding)
    }
    
}

#Preview("Custom Colors") {
    TitleSubtitleView(titleKey: "onboarding_2_title",
                      subtitleKey: "onboarding_2_subtitle",
                      table: .startupFlow,textAlignment: .center, highlightedKeys: ["aa"])
    
    
}
