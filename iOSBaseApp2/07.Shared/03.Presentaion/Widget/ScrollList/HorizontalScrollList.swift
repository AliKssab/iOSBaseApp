//
//  HorizontalScrollList.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 7/5/25.
//

import SwiftUI

struct HorizontalScrollList<Item, Content>: View
where Item: Identifiable, Item.ID: Hashable, Content: View {

    let items: [Item]
    var spacing: CGFloat = 14
    var horizontalPadding: CGFloat = 16

    // New binding that enables true restoration
    @Binding var scrollToId: Item.ID?

    let content: (Item) -> Content

    init(
        items: [Item],
        spacing: CGFloat = 14,
        horizontalPadding: CGFloat = 16,
        scrollToId: Binding<Item.ID?> = .constant(nil),
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        self._scrollToId = scrollToId
        self.content = content
    }

    init(
        items: [Item],
        spacing: CGFloat = 14,
        horizontalPadding: CGFloat = 16,
        selectedId: Item.ID? = nil,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        self._scrollToId = .constant(selectedId)
        self.content = content
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: spacing) {
                    ForEach(items) { item in
                        content(item)
                            .id(item.id) 
                    }
                }
                .padding(.horizontal, horizontalPadding)
            }
            .onAppear {
                if let id = scrollToId {
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut) { proxy.scrollTo(id, anchor: .center) }
                    }
                }
            }
            .onChange(of: scrollToId) { _, newId in
                if let id = newId {
                    withAnimation(.easeInOut) { proxy.scrollTo(id, anchor: .center) }
                }
            }
        }
    }
}
