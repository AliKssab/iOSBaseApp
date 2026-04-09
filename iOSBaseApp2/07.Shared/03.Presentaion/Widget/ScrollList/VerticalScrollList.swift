//
//  VerticalScrollList.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct VerticalScrollList<Item, Content>: View where Item: Identifiable, Content: View {
    let items: [Item]
    var spacing: CGFloat = 14
    var verticalPadding: CGFloat = 0
    var padding : CGFloat = 16
    let content: (Item) -> Content

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: spacing) {
                ForEach(items) { item in
                    content(item)
                }
            }
            .padding(.vertical, verticalPadding)
        }
        .padding(.horizontal, padding)
    }
}
