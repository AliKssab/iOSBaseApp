//
//  TextRenderingUtils.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 24/06/2025.
//

import SwiftUI

enum TextRenderingUtils {

    static func buildHighlightedText(
        from fullText: String,
        highlights: [String],
        fullTextColor: AppColor = .subtitle,
        highlightColor: AppColor = .primaryPurple
    ) -> Text {
        var result = Text("")
        var remainingText = fullText[...]

        print(highlights)
        while let range = highlights
            .compactMap({ word in remainingText.range(of: word) })
            .sorted(by: { $0.lowerBound < $1.lowerBound })
            .first
        {
            let prefix = String(remainingText[..<range.lowerBound])
            let word = String(remainingText[range])
            print(word)

            result = result + Text(prefix).foregroundColor(fullTextColor.color)
            result = result + Text(word)
                .foregroundColor(highlightColor.color)
                .underline()
            

            remainingText = remainingText[range.upperBound...]
        }

        result = result + Text(String(remainingText)).foregroundColor(fullTextColor.color)
        return result
    }

    
    static func buildTextWithPhone(
        segments: [String],
        phone: String,
        insertPhoneAfter index: Int,
        normalColor: AppColor = .subtitle,
        phoneColor: AppColor = .primaryPurple
    ) -> Text {
        var result = Text("")

        for i in 0..<segments.count {
            result = result + Text(segments[i]).foregroundColor(normalColor.color)

            if i == index {
                let needsPrefix = !segments[i].hasSuffix(" ")
                let needsSuffix = (i + 1 < segments.count) && !segments[i + 1].hasPrefix(" ")

                if needsPrefix {
                    result = result + Text("  ").foregroundColor(normalColor.color)
                }

                result = result + Text(formatAsLTR(phone))
                    .foregroundColor(phoneColor.color)
                    .underline()
                    .fontWeight(.bold)

                if needsSuffix {
                    result = result + Text("  ").foregroundColor(normalColor.color)
                }
            }
        }

        if index == segments.count {
            result = result + Text(" ") + Text(phone)
                .foregroundColor(phoneColor.color)
                .underline()
                .fontWeight(.bold)
        }

        return result
    }

    static func formatAsLTR(_ text: String) -> String {
        return "\u{200E}\(text)"
    }

}
