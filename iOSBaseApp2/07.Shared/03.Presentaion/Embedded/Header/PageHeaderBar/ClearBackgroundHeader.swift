//
//  ClearBackgroundHeader.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 30/07/2025.
//

import SwiftUI

struct ClearBackgroundHeader: View {
    var titleKey: String? = nil
    var subtitleKey: String? = nil
    var table: LocalizationFiles? = nil
    var topPadding: CGFloat = 0
    var showDivider: Bool = true
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        PageHeaderBar(
            titleKey: titleKey,
            subtitleKey: subtitleKey,
            table: table,
            titleForegroundColor: .white,
            leftButtons: [
                CircleIconButton(
                    iconName: .header(.whiteArrowBack),
                    style: .blur(material: .ultraThin),
                    action: { dismiss() }
                )
            ],
            titleAlignment: .center
         )
        .padding(.top, topPadding)
        .background(AppColor.clear.color)
    }
}

//
//#Preview {
//    ClearBackgroundHeader(titleKey:"offer_lbl_description",table: .offers)
//        .environmentObject(NavigationManager())
//}
