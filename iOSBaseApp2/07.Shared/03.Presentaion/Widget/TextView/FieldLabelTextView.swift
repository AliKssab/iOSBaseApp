//
//  FieldLabelTextView.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 19/06/2025.
//


import SwiftUI

struct FieldLabelTextView: View, FontStyleProtocol, ColorStyleProtocol, LocalizationTextProtocol {
    var key: String
    var table: LocalizationFiles

    var isOptional: Bool = false
    var fontSizeDelta: CGFloat = -2
    var fontWeight: FontWeight = .medium
    var foregroundColor: AppColor = .primaryPurple

    var body: some View {
        HStack(spacing: 4) {
            Text(localizedText )
                .font(font)
                .foregroundColor(foregroundColor)

            if isOptional {
                Text("optional_field".localized(from: .formFields))
                    .font(font)
                    .foregroundColor(.appColor(.optionalLabelBlueGray))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


#Preview("Custom Colors") {
    FieldLabelTextView(key: "Title",
                      table: .startupFlow)
}
