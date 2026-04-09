//
//  TextRenderingUtils.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 19/10/2025.
//


import SwiftUI

enum TextRenderingColorUtils {
    static func buildHighlightedText(
        from text: String,
        highlights: [String],
        highlightColor: AppColor
    ) -> Text {
        guard !highlights.isEmpty else {
            return Text(text)
        }
        
        var result = Text("")
        var remainingText = text
        
        // هنمشي على الكلمات المطلوب تلوينها بالترتيب
        for word in highlights {
            if let range = remainingText.range(of: word) {
                // الجزء اللي قبل الكلمة
                let before = String(remainingText[..<range.lowerBound])
                if !before.isEmpty {
                    result = result + Text(before)
                        .foregroundColor(highlightColor.color == .red ? .primary : .primary)
                }
                
                // الكلمة الملوّنة
                result = result + Text(word)
                    .foregroundColor(highlightColor.color)
                
                // باقي النص بعد الكلمة
                remainingText = String(remainingText[range.upperBound...])
            }
        }
        
        // نضيف اللي باقي بعد آخر كلمة ملوّنة
        if !remainingText.isEmpty {
            result = result + Text(remainingText)
        }
        
        return result
    }
}
