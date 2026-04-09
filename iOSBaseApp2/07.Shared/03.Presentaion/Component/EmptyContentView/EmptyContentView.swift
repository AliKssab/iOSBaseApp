//
//  EmptyContentView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 13/07/2025.
//

import SwiftUI

struct EmptyContentView: View {
    // MARK: - Properties
    let title: String
    let subTitle: String
    let table: LocalizationFiles
    var titleFontSize: CGFloat = 2
    let imageName: AppIcon
    var imageWidth: CGFloat = 100
    var imageHeight: CGFloat = 100
    var spacing :CGFloat? = 16
    // NEW
    var ctaKey: String? = nil
    var onCTATap: (() -> Void)? = nil
    var topPadding: CGFloat? = nil
    
    // MARK: - View
    var body: some View {
        VStack(spacing:30) {
            ScaledFitImageView(imageName: imageName, width: imageWidth, height: imageHeight)

            TitleSubtitleView(
                titleKey: title,
                subtitleKey: subTitle,
                table: table,
                spacing:spacing,
                titleFontSize: titleFontSize
            )
            .multilineTextAlignment(.center)

            // NEW: optional CTA
            if let ctaKey, let onCTATap {
                SolidButton(key: ctaKey) {
                    onCTATap()
                }
                .padding(.horizontal, 16)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding(.top, topPadding ?? 0)
        .padding()
    }
}
