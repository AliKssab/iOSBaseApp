//
//  DashedActionButton.swift
//  AseerAlKotobSwiftUI
//
//  Created by Mohamed Ali on 22/12/2025.
//

import SwiftUI


struct DashedActionButton: View, FontStyleProtocol {

    // MARK: - Font
    var fontSizeDelta: CGFloat = -4
    var fontWeight: FontWeight  =  .bold 
    var foregroundColor: AppColor = .black

    // MARK: - Content
    var titleKey: String
    var table: LocalizationFiles = .bookDetails
    var iconName: String
    var iconSize : CGFloat = 16

    // MARK: - Colors
    var backgroudColor: AppColor = .lightGray2
    var dashedColor: AppColor = .black
    var height : CGFloat = 46
    var cornerRadius : CGFloat = 6
    // MARK: - Action
    var action: () -> Void
    var textAlignment: TextAlignment = .center

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {

                AspectFillImageView(
                                  selectedImage: UIImage(named: iconName),
                                  width: iconSize,
                                  height: iconSize
                              )

                SemiBoldTextView(
                    key: titleKey,
                    table: table,
                    fontSizeDelta: fontSizeDelta,
                    foregroundColor: foregroundColor
                )
                Spacer()

            }
            .padding(.horizontal,24)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(textAlignment)
            .frame(height: height)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroudColor.color)
                    .dashedBorder(
                        color: dashedColor.color,
                        lineWidth: 1,
                        cornerRadius: cornerRadius,
                        dash: [4, 4]
                )
            )
        }
    }
}
