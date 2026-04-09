//
//  BoldTextView.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 24/06/2025.
//


import SwiftUI

struct BoldTextView: View, FontStyleProtocol, ColorStyleProtocol, LocalizationTextProtocol {
    var key: String
    var table: LocalizationFiles = .authentication
    var fontSizeDelta: CGFloat = 0
    var foregroundColor: AppColor = .deepVioletBlack
    var textAlignment: TextAlignment = .center

    var fontWeight: FontWeight { .bold }
    var lineLimit: Int? = nil
    var body: some View {
        Text(localizedText)
            .font(font)
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(textAlignment)
            .lineSpacing(3)
            .lineLimit(lineLimit)
    }
}

#Preview {
    BoldTextView(
        key: "doctor_details_header",
        table: .doctorDetails, // or the appropriate table you use
        fontSizeDelta: 2,
        foregroundColor: .deepVioletBlack,
        textAlignment: .trailing
    )
}
