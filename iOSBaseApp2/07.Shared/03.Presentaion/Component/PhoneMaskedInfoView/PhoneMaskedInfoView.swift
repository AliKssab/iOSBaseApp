//
//  PhoneMaskedInfoView.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 24/06/2025.
//


import SwiftUI

struct PhoneMaskedInfoView: View {
    
    let titleKey: String
    let subtitleSegments: [String]
    var table: LocalizationFiles = .authentication

    let phone: String
    var phoneSegmentIndex: Int = 0
    
    var subtitleColor: AppColor = .subtitle
    var phoneColor: AppColor = .primaryPurple
    
    var textAlignment: TextAlignment = .center

    var body: some View {
        VStack(alignment: textAlignment.asHorizontalAlignment, spacing: 10) {
            HStack {
                
                TitleTextView(key: titleKey, table: table, fontSizeDelta: 2, textAlignment: textAlignment)

                ScaledFitImageView(imageName:.auth(.welcome), width: 28, height: 28)
                
            }
          
            TextRenderingUtils.buildTextWithPhone(
                segments: subtitleSegments.map { $0.localized(from: table) },
                phone: phone,
                insertPhoneAfter: phoneSegmentIndex,
                normalColor: subtitleColor,
                phoneColor: phoneColor
            )
            .multilineTextAlignment(textAlignment)
            .font(.primary(weight: .regular, size: 14))
            .lineSpacing(5)
        }
        .frame(maxWidth: .infinity, alignment: textAlignment.asAlignment)
        .padding(.horizontal, 16)
    }
}


#Preview {
    PhoneMaskedInfoView(titleKey: "onboarding_2_title", subtitleSegments: ["onboarding_2_title","onboarding_2_title","onboarding_2_title"], table: .startupFlow, phone: "30933303333", phoneSegmentIndex: 0, textAlignment: .center)
}
