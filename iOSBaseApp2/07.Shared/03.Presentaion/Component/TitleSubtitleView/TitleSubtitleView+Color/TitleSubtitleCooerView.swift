//
//  TitleSubtitleColerView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 19/10/2025.
//

import SwiftUI

struct TitleSubtitleColorView: View {
    let titleKey: String
    let subtitleKey: String?
    var subtitle: String?
    var table: LocalizationFiles = .startupFlow
    var textAlignment: TextAlignment = .center
    var highlightedKeys: [String]? = nil
    var titleHighlightedKeys: [String]? = nil // ✅ جديد
    var spacing: CGFloat? = 10
    var titleFontSize: CGFloat = 22
    var subtitleFontSize: CGFloat = 14
    
    var body: some View {
        VStack(alignment: textAlignment.asHorizontalAlignment, spacing: spacing) {
            
            TitleColorTextView(
                key: titleKey,
                table: table,
                fontSizeDelta: titleFontSize,
                textAlignment: textAlignment,
                highlightedKeys: titleHighlightedKeys // ✅ نمرّر الكلمات الملوّنة
            )
            
            if let subtitleKey {
                let localizedSubtitle = (subtitle ?? "") + " " + subtitleKey.localized(from: table)
                let highlightWords = highlightedKeys?.map { $0.localized(from: table) } ?? []
                let highlightText = TextRenderingUtils.buildHighlightedText(from: localizedSubtitle, highlights: highlightWords)
                highlightText
                    .multilineTextAlignment(textAlignment)
                    .font(.primary(weight: .regular, size: subtitleFontSize))
                    .lineSpacing(5)
                    .frame(maxWidth: .infinity, alignment: textAlignment.asAlignment)
            }
        }
        .frame(maxWidth: .infinity, alignment: textAlignment.asAlignment)
        .padding(.horizontal, 16)
    }
}
