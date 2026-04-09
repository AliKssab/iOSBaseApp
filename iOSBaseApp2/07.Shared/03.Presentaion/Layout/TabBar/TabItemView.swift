//
//  TabItemView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct TabItemView: View {
    let item: TabItem
    let isSelected: Bool
    let index: Int
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                ZStack(alignment: .bottom) {
//                    if isSelected {
//                        ScaledFitImageView(
//                            imageName: .tabbar(.activeDot),
//                            width: 16,
//                            height: 16
//                        )
//                        .offset(x: 8, y: -10)
//                    }
                    
                    ScaledFitImageView(
                        imageName: isSelected ? item.focusedIcon : item.icon,
                        width: index == 2 ? 54 : 24,   // ← هنا التغيير
                        height: index == 2 ? 54 : 24   // ← هنا التغيير
                    )
                }
                
                if item.titleKey != "" {
                    SemiBoldTextView(
                        key: item.titleKey,
                        table: .home,
                        fontSizeDelta: -4,
                        foregroundColor: isSelected ? .primaryPurple : .darkGray,
                        textAlignment: .center
                    )
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
