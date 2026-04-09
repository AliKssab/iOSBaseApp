//
//  UnderlinedTappableTextWithLottie.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 23/06/2025.
//

import SwiftUI

struct UnderlinedTappableTextWithLottie: View {

    // MARK: - Required
    var key: String
    var table: LocalizationFiles
    var action: (() -> Void)?

    // MARK: - Icon
    var iconName: AppLottie?
    var iconSize: CGFloat = 26

    // MARK: - Text Style + Underline
    var fontSizeDelta: CGFloat = -2
    var fontWeight: FontWeight = .medium
    var foregroundColor: AppColor = .black
    var underlineThickness: CGFloat = 0.9
    var underlineOffsetFromText: CGFloat = 1
    var horizontalPadding: CGFloat = 16

    var body: some View {
            HStack(spacing: 4) {
                UnderlinedTappableText(
                    key: key,
                    table: table,
                    action: action,
                    fontSizeDelta: fontSizeDelta,
                    fontWeight: fontWeight,
                    foregroundColor: foregroundColor,
                    underlineThickness: underlineThickness,
                    underlineOffsetFromText: underlineOffsetFromText
                )

                if let iconName {
                    LottieView(filename: iconName, size: iconSize)
                }
            }
            .frame(height: 40)
            .padding(.horizontal, horizontalPadding)
    }
}

#Preview {
    UnderlinedTappableTextWithLottie(key: "onboarding_continue_as_guest", table: .authentication, iconName: .auth(.guestEyes))
}
