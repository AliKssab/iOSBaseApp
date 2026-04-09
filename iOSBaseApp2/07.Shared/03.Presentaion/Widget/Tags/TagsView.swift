//
//  TagsView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 31/07/2025.
//

import SwiftUI

struct TagsView<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    var items: Data
    var spacing: CGFloat = 8
    var alignment: HorizontalAlignment = .leading
    var content: (Data.Element) -> Content

    @State private var totalHeight: CGFloat = .zero

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        let containerWidth = g.size.width
        var x: CGFloat = 0
        var y: CGFloat = 0

        return ZStack(alignment: Alignment(horizontal: alignment, vertical: .top)) {
            ForEach(Array(items), id: \.self) { item in
                content(item)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 4)
                    .alignmentGuide(.leading) { d in
                        if x + d.width > containerWidth {
                            x = 0
                            y -= (d.height + spacing)
                        }
                        let result = x
                        x += (d.width + spacing)
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        y
                    }
            }
        }
        .background(viewHeightReader())
    }

    private func viewHeightReader() -> some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
        .onPreferenceChange(HeightPreferenceKey.self) { self.totalHeight = $0 }
    }
}

private struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
