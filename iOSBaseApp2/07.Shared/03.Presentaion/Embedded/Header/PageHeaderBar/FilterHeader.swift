//
//  FilterHeader.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 11/08/2025.
//

import SwiftUI

struct FilterHeader: View {
    
    var onClearAll: (() -> Void)? = nil
    var onBack: (() -> Void)? = nil

    var body: some View {
        HStack(alignment: .center){
            PageHeaderBar(
                titleKey: "filter_heder_title",
                table: .search,
                titleForegroundColor: .pureBlack,
                leftButtons: [CircleIconButton(iconName: .header(.arrowBack),action: {
                    onBack?()
                })],
                titleAlignment: .leading
            )
            
            Spacer()
            
            Button {
                onClearAll?()
            } label: {
                MediumTextView(
                    key: "clear_all_button",
                    table: .doctorDetails,
                    fontSizeDelta: -2,
                    foregroundColor: .subtitle
                ).padding(.horizontal, 16)
            }
         }
        
        LineSeparator(thickness: 1.1, color: .separatorGray)
    }
}

#Preview {
    FilterHeader()
}
