//
//  TagButton.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 21/07/2025.
//

import SwiftUI

  struct TagButton: View {
    let title: String
    let isSelected: Bool
    let onTap: () -> Void
    let table: LocalizationFiles

    var body: some View {
        MediumTextView(
            key: title,
            table: table,
            fontSizeDelta: -6,
            foregroundColor: isSelected ? .pureWhite : .deepVioletBlack
        )
        .frame(height: 26)
        .padding(.horizontal, 14)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(
                    isSelected ? AppColor.primaryPurple.color : AppColor.subtitle.color,
                    lineWidth: 0.8
                )
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(isSelected ? AppColor.primaryPurple.color : .clear)
                )
        )
        .onTapGesture {
            onTap()
        }
    }
}
