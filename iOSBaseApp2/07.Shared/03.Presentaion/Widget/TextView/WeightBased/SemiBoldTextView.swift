//
//  SemiBoldTextView.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 24/06/2025.
//


import SwiftUI

struct SemiBoldTextView: View, FontStyleProtocol, ColorStyleProtocol, LocalizationTextProtocol, LineStyleProtocol {
    var key: String
    var table: LocalizationFiles = .authentication
    var fontSizeDelta: CGFloat = 0
    var foregroundColor: AppColor = .deepVioletBlack
    var textAlignment: TextAlignment = .center

    var fontWeight: FontWeight { .semiBold }

    var lineLimit: Int? = nil
    var lineSpacing: CGFloat = 3

    var body: some View {
        Text(localizedText)
            .font(font)
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(textAlignment)
            .lineLimit(lineLimit)
            .lineSpacing(lineSpacing)
    }
}

#Preview {
    VStack{
        BoldTextView(
            key: "doctor_details_header",
            table: .doctorDetails,
            fontSizeDelta: 2,
            foregroundColor: .deepVioletBlack,
            textAlignment: .trailing
        )
        
        SemiBoldTextView(
            key: "doctor_details_header",
            table: .doctorDetails,
            fontSizeDelta: 2,
            foregroundColor: .deepVioletBlack,
            textAlignment: .trailing
        )
    }
}
