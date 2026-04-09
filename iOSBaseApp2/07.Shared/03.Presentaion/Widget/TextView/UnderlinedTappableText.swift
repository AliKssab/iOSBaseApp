//
//  UnderlinedTappableText.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 20/06/2025.
//


import SwiftUI

struct UnderlinedTappableText: View, FontStyleProtocol, ColorStyleProtocol, LocalizationTextProtocol {

    // MARK: - Required
    var key: String
    var table: LocalizationFiles = .authentication
    var action: (() -> Void)?

    // MARK: - Style
    var fontSizeDelta: CGFloat = -4
    var fontWeight: FontWeight = .medium
    var foregroundColor: AppColor = .underlineTextDarkBlue

    // MARK: - Underline
    var underlineThickness: CGFloat = 0.9
    var underlineOffsetFromText: CGFloat = 1
    var showUnderline: Bool = true

    var body: some View {
        let label = Text(localizedText)
            .font(font)
            .foregroundColor(foregroundColor)
            .padding(.bottom, showUnderline ? underlineOffsetFromText : 0)
            .overlay(alignment: .bottom) {
                if showUnderline {
                    LineSeparator(
                        thickness: underlineThickness,
                        color: foregroundColor
                    )
                }
            }

        return Group {
            if let action {
                Button(action: action) {
                    label
                }
                .buttonStyle(.plain)
            } else {
                label
            }
        }
        .frame(height: 20, alignment: .center)
    }

}

#Preview {
    UnderlinedTappableText(key: "Continue as guest",table: .authentication){
        print("ddddd")
    }
}
