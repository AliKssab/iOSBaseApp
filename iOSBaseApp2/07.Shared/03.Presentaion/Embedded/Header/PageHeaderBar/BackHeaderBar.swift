//
//  BackHeaderBar.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct BackHeaderBar: View {
    @EnvironmentObject var nav: NavigationManager
    
    var titleKey: String? = nil
    var subtitleKey: String? = nil
    var table: LocalizationFiles? = nil
    var topPadding: CGFloat = 0
    var showDivider: Bool = true
    var titleAlignment : TextAlignment? = nil
    var backgroundcolor : AppColor? = nil
    var titleForegroundColor : AppColor? = nil
    var subTitleForegroundColor : AppColor? = nil
    var onBack: (() -> Void)? = nil
    var body: some View {
        PageHeaderBar(
            titleKey: titleKey,
            subtitleKey: subtitleKey,
            table: table,
            titleForegroundColor: titleForegroundColor,
            subTitleForegroundColor: subTitleForegroundColor,
            leftButtons: [
                CircleIconButton(
                    iconName: .header(.arrowBack),
                    style: .custom(borderColor: .inputSeparatorGray, background: .clear),
                    action: onBack ?? { nav.pop() }
                )
            ],
            titleAlignment:titleAlignment ?? .leading,
            showDivider: showDivider
        )
        .background(backgroundcolor?.color)
        .padding(.top, topPadding)
    }
}


#Preview {
    BackHeaderBar()
        .environmentObject(NavigationManager())
}
