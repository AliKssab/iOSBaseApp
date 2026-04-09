//
//  OTPDigitBox.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 24/06/2025.
//

import SwiftUI

struct OTPDigitBox: View {
    let character: String
    let isFilled: Bool
    let isCurrent: Bool
    let isSecure: Bool
    let hasError: Bool
    let size: CGSize
    let textColor: AppColor
    let font: Font
    let backgroundColorFilled: AppColor
    let backgroundColorEmpty: AppColor
    let borderColorFilled: AppColor
    let borderColorEmpty: AppColor
    let borderColorError: AppColor
    let borderWidthFilled: CGFloat
    let borderWidthEmpty: CGFloat
    let cornerRadius: CGFloat

    var body: some View {
        let borderColor = hasError ? borderColorError : (isFilled || isCurrent ? borderColorFilled : borderColorEmpty)
        let borderWidth = isFilled || isCurrent ? borderWidthFilled : borderWidthEmpty
        let background = isFilled ? backgroundColorFilled : backgroundColorEmpty

        return ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(background.color)
                .frame(width: size.width, height: size.height)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor.color, lineWidth: borderWidth)
                )

            if isFilled {
                Text(isSecure ? "•" : character)
                    .font(font)
                    .foregroundColor(textColor.color)
            }
        }
    }
}
