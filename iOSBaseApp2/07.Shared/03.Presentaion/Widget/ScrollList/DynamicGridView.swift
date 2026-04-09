import SwiftUI

/// Reusable dynamic grid component
struct DynamicGridView<Item: Hashable, Content: View>: View {
    let items: [Item]
    let columnsCount: Int
    /// Can be fractional (e.g. 2.5 rows)
    let rowsCount: Double
    let spacing: CGFloat
    let content: (Item) -> Content

    init(
        items: [Item],
        columnsCount: Int,
        rowsCount: Double,
        spacing: CGFloat = 16,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.columnsCount = columnsCount
        self.rowsCount = rowsCount
        self.spacing = spacing
        self.content = content
    }

    private var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: spacing), count: columnsCount)
    }

    /// Limit items based on rows * columns
    /// Limit items based on rows * columns (supports fractional rows)
    private var visibleItems: [Item] {
        let maxItems = Int(ceil(Double(columnsCount) * rowsCount))
        return Array(items.prefix(maxItems))
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: spacing) {
            ForEach(visibleItems, id: \.self) { item in
                content(item)
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Example Usage
struct DynamicGridExampleView: View {
    let data = Array(1...20)

    var body: some View {
        DynamicGridView(
            items: data,
            columnsCount: 2,
            rowsCount: 3
        ) { item in
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue.opacity(0.2))
                .frame(height: 120)
                .overlay(Text("Item \(item)"))
        }
    }
}
