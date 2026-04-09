//
//  ErrorStateScreen.swift
//  LavanderLandClinic
//
//  Created by Sana on 26/08/2025.
//



import SwiftUI

struct ErrorStateScreen: View {
    let titleKey: String
    let subtitleKey: String
    let table: LocalizationFiles
    let image: AppIcon
    var retryKey: String = "btn_retry"
    var retryIcon: AppIcon = .shared(.refresh)
    var onRetry: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            ScaledFitImageView(imageName: image, width: 160, height: 160)

            TitleSubtitleView(
                titleKey: titleKey,
                subtitleKey: subtitleKey,
                table: table,
                titleFontSize: 0
            )
            .multilineTextAlignment(.center)

            SolidButton(
                key: retryKey,
                action: onRetry,
                iconName: retryIcon,
                iconPositionLeading: false,
                cornerRadius: 28
            )
            .padding(.horizontal, 70)
        }
    }
}
