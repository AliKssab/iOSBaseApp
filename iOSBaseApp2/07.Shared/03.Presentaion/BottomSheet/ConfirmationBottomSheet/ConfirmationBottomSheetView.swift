//
//  ConfirmationBottomSheetView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct ConfirmationBottomSheetView: View {
    var imageName: AppIcon
    var titleKey: String
    var subtitleKey: String
    var table: LocalizationFiles = .shared

    // Primary Button
    var primaryButtonKey: String
    var primaryAction: () -> Void
    var primaryButtonColor: AppColor = .primaryPurple

    // Secondary Button
    var secondaryButtonKey: String
    var secondaryAction: () -> Void
    var secondaryIsOutlined: Bool = true
    var secondaryForegroundColor: AppColor? = nil
    var secondaryBorderColor: AppColor? = nil
    var lottieName:String? = nil
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 40) {
            
            if lottieName == nil {
                ScaledFitImageView(imageName: imageName, width: 65, height: 65)
            } else {
//                GIFView(gifName: lottieName ?? "logout")
//                    .frame(width: 120, height: 120)
            }
            
           TitleSubtitleView(
               titleKey: titleKey,
               subtitleKey: subtitleKey,
               table: table
           )
           .multilineTextAlignment(.center)

            HStack(spacing: 12) {
                SolidButton(
                    key: primaryButtonKey,
                    table: .buttonTitles,
                    action: {
                        primaryAction()
                        dismiss()
                    },
                    isOutlined: false,
                    foregroundColor: .pureWhite,
                    backgroundColor: primaryButtonColor
                )
                
                SolidButton(
                    key: secondaryButtonKey,
                    table: .buttonTitles,
                    action: {
                        secondaryAction()
                        dismiss()
                    },
                    isOutlined: secondaryIsOutlined,
                    foregroundColor: secondaryForegroundColor,
                    borderColor: secondaryBorderColor
                )
            }
            .padding(.horizontal, 16)
        }
    }
}
