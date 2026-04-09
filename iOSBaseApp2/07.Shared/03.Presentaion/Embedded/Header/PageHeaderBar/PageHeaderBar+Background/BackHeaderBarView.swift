//
//  BackHeaderBarView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct BackHeaderBarView: View {
    @EnvironmentObject var nav: NavigationManager

    var titleKey: String
    var subtitleKey: String? = nil
    var table: LocalizationFiles = .startupFlow
    var topPadding: CGFloat = 0
    var showDivider: Bool = false

    var body: some View {
        BackgroundHeaderBarView(
            titleKey: titleKey,
            subtitleKey: subtitleKey,
            table: table,
            leftButtons: [
                CircleIconButton(iconName: .header(.whiteArrowBack), style: .borderWhite) {
                    nav.pop()
                }
            ],
            titleAlignment: .center,
            showDivider: showDivider
        )
        .padding(.top, topPadding)
    }
}
