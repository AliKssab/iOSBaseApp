//
//  CarouselView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct CarouselView<Content: View>: View {
    
    @Environment(\.layoutDirection) var layoutDirection
    
    // MARK: - Gesture & State
    @GestureState private var dragState = DragState.inactive
    @Binding var currentIndex: Int
    @State private var carouselLocation = 0
    @State private var timer: Timer? = nil
    
    // MARK: - Configuration
    var itemHeight: CGFloat = 250
    var itemWidth: CGFloat = 315
    var contentViews: [Content]
    var autoScroll: Bool = false

    // MARK: - RTL Support
    private var isRTL: Bool {
        layoutDirection == .rightToLeft
    }

    private var directionMultiplier: CGFloat {
        isRTL ? -1 : 1
    }
    private var step: CGFloat {
        itemWidth + 15
    }

    // MARK: - Repeated Views
    private var views: [Content] {
        repeatedToFill(contentViews, count: 7)
    }

    // MARK: - Body
    var body: some View {
        VStack {
            ZStack {
                ForEach(views.indices, id: \.self) { i in
                    VStack {
                        Spacer()
                        views[i]
                            .frame(width: itemWidth, height: height(for: i))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .cornerRadius(10)
                            .opacity(opacity(for: i))
                            .offset(x: offset(for: i))
                            .animation(.interpolatingSpring(stiffness: 300, damping: 30), value: dragState.translation)
                        Spacer()
                    }
                }
            }
        }
        .gesture(
            DragGesture()
                .updating($dragState) { value, state, _ in
                    state = .dragging(translation: value.translation)
                    stopAutoScroll()
                }
                .onEnded {
                    handleDragEnded($0)
                    startAutoScrollIfNeeded()
                }
        )
        .onAppear {
            startAutoScrollIfNeeded()
        }
        .onDisappear {
            stopAutoScroll()
        }
    }
    
    func syncIndex() {
        let index = ((carouselLocation % contentViews.count) + contentViews.count) % contentViews.count
        currentIndex = index
    }

}

// MARK: - Helpers
private extension CarouselView {
    
    func repeatedToFill(_ views: [Content], count: Int) -> [Content] {
        var result = views
        while result.count < count {
            result += views
        }
        return Array(result.prefix(count))
    }

    func relativeLoc() -> Int {
        let index = ((views.count * 10_000) + carouselLocation) % views.count
        return isRTL ? (views.count - index) % views.count : index
    }

    func height(for i: Int) -> CGFloat {
        i == relativeLoc() ? itemHeight : itemHeight - 20
    }

    func opacity(for i: Int) -> Double {
        let r = relativeLoc()
        let idx = [r, r + 1, r - 1, r + 2, r - 2].map { ($0 + views.count) % views.count }
        return idx.contains(i) ? 1 : 0
    }

    func offset(for i: Int) -> CGFloat {
        let r = relativeLoc()
        let diff = (i - r + views.count) % views.count
        let maxOffset = 3

        if diff <= maxOffset {
            return (dragState.translation.width + CGFloat(diff) * step) * directionMultiplier
        } else if views.count - diff <= maxOffset {
            return (dragState.translation.width - CGFloat(views.count - diff) * step) * directionMultiplier
        } else {
            return 10_000
        }
    }

    func handleDragEnded(_ drag: DragGesture.Value) {
        let threshold: CGFloat = 100

        if isRTL {
            if drag.translation.width > threshold {
                carouselLocation += 1
            } else if drag.translation.width < -threshold {
                carouselLocation -= 1
            }
        } else {
            if drag.translation.width > threshold {
                carouselLocation -= 1
            } else if drag.translation.width < -threshold {
                carouselLocation += 1
            }
        }

        syncIndex()
    }


    func startAutoScrollIfNeeded() {
        guard autoScroll, timer == nil else { return }
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            withAnimation {
                carouselLocation += isRTL ? 1 : -1
                syncIndex()
            }
        }
    }


    func stopAutoScroll() {
        timer?.invalidate()
        timer = nil
    }
}

// MARK: - Drag State Enum

private enum DragState {
    case inactive
    case dragging(translation: CGSize)

    var translation: CGSize {
        switch self {
        case .inactive: return .zero
        case .dragging(let t): return t
        }
    }

    var isDragging: Bool {
        switch self {
        case .inactive: return false
        case .dragging: return true
        }
    }
}

// MARK: - Preview
//#Preview {
//    @State var index = 0
//
//    let bannerImages: [AppIcon] = [
//        .home(.banner),
//        .home(.banner1),
//        .home(.banner2),
//        .home(.banner3)
//    ]
//
//    CarouselView(
//        currentIndex: $index,
//        itemHeight: 150,
//        contentViews: bannerImages.map {
//            AspectFillImageView(
//                imageName: $0,
//                width: 315,
//                height: 150,
//                cornerRadius: 16
//            )
//        },
//        autoScroll: true
//    )
//}
