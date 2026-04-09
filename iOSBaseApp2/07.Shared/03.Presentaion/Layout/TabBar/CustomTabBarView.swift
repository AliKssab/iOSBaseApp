//
//  CustomTabBarView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct CustomTabBarView: View {
    let items: [TabItem]
    @Binding var selectedIndex: Int
    
    let tabViewBuilder: (Int) -> AnyView
    private let tabBarHeight: CGFloat = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            tabViewBuilder(selectedIndex)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.bottom, tabBarHeight)
            
            HStack(spacing: 0) {
                ForEach(items.indices, id: \.self) { index in
                    TabItemView(
                        item: items[index],
                        isSelected: selectedIndex == index ,
                        index: index   // ← أضف هذا
                    ) {
                        selectedIndex = index
                    }
                }
            }
            .padding(.top, 20)
            .background(
                ZStack {
                    BlurView(style: .systemUltraThinMaterial)
                        .background(Color.white.opacity(0.1))
                    
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(Color.appColor(.backgroundGray), lineWidth: 1)
                }
                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                    .ignoresSafeArea(edges: .bottom)
            )
            .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: -2)
        }
    }
}
 
