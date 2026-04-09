//
//  TitleWithIconSubtitleView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 26/10/2025.
//


import SwiftUI

struct TitleWithIconSubtitleView: View {
    let titleKey: String
    let subtitleKey: String?
    var subtitle: String?
    var table: LocalizationFiles = .startupFlow
    var textAlignment: TextAlignment = .center
    var highlightedKeys: [String]? = nil
    var spacing:CGFloat? = 10
    var titleFontSize:CGFloat = 2
    var subtitleFontSize:CGFloat = 14
    var imageWidth:CGFloat = 28
    var imagehHeight:CGFloat = 28
    var imageName:AppIcon = .auth(.welcome)
    var body: some View {
        VStack(alignment: textAlignment.asHorizontalAlignment, spacing: spacing) {
            HStack{
                TitleTextView(key: titleKey, table: table, fontSizeDelta: titleFontSize, textAlignment: textAlignment)
                ScaledFitImageView(imageName:imageName, width: imageWidth, height: imagehHeight)

            }
     
            if let subtitleKey {
                let localizedSubtitle =  (subtitle ?? "") +   subtitleKey.localized(from: table)
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

#Preview("Custom Colors") {
    TitleWithIconSubtitleView(titleKey: "onboarding_2_title",
                      subtitleKey: "onboarding_2_subtitle",
                      table: .startupFlow,textAlignment: .center, highlightedKeys: ["aa"])
    
    
}
