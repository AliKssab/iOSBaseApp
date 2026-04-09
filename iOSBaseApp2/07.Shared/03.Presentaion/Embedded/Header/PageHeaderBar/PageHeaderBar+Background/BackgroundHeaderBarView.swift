//
//  BackgroundHeaderBarView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct BackgroundHeaderBarView: View {
    var titleKey: String
    var subtitleKey: String? = nil
    var table: LocalizationFiles = .startupFlow

    var leftButtons: [CircleIconButton]? = nil
    var rightButtons: [CircleIconButton]? = nil

    var titleAlignment: TextAlignment = .center
    var showDivider: Bool = false
    var backgroundHeight: CGFloat = 129

    var body: some View {
        ZStack {
            AspectFillImageView(
                imageName: .header(.backgroundPattern),
                background: .primaryPurple,
                cornerRadius: 0
            )
            .frame(height: backgroundHeight)
            .clipped()

            VStack(spacing: 16) {
                PageHeaderBar(
                    titleKey: titleKey,
                    subtitleKey: subtitleKey,
                    table: table,
                    titleForegroundColor: .pureWhite,
                    leftButtons: leftButtons,
                    rightButtons: rightButtons,
                    titleAlignment: titleAlignment
                )
            }.padding(.top, 54)
        }
        .frame(maxWidth: .infinity)
    }
}
