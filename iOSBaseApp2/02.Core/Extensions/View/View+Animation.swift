//
//  View+Animation.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 22/06/2025.
//

import SwiftUI

enum SimpleAnimationEdge {
    case none, top, bottom, left, right
}

// MARK: - Slide In Modifier
struct SlideInModifier: ViewModifier {
    var edge: SimpleAnimationEdge
    var x: CGFloat
    var y: CGFloat
    var delay: Double
    var duration: Double
    var completion: (() -> Void)?
    
    @State private var isVisible = false
    
    func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 1 : 0)
            .offset(isVisible ? .zero : initialOffset())
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation(.interpolatingSpring(stiffness: 200, damping: 20)) {
                        isVisible = true
                    }
                    if let completion = completion {
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            completion()
                        }
                    }
                }
            }
    }
    
    private func initialOffset() -> CGSize {
        switch edge {
        case .top: return CGSize(width: x, height: -UIScreen.main.bounds.height / 2 + y)
        case .bottom: return CGSize(width: x, height: UIScreen.main.bounds.height / 2 + y)
        case .left: return CGSize(width: -UIScreen.main.bounds.width / 2 + x, height: y)
        case .right: return CGSize(width: UIScreen.main.bounds.width / 2 + x, height: y)
        case .none: return CGSize(width: x, height: y)
        }
    }
}

// MARK: - Slide Out Modifier
struct SlideOutModifier: ViewModifier {
    var edge: SimpleAnimationEdge
    var x: CGFloat
    var y: CGFloat
    var delay: Double
    var duration: Double
    var completion: (() -> Void)?
    
    @State private var isHidden = false
    
    func body(content: Content) -> some View {
        content
            .opacity(isHidden ? 0 : 1)
            .offset(isHidden ? targetOffset() : .zero)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation(.easeInOut(duration: duration)) {
                        isHidden = true
                    }
                    if let completion = completion {
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            completion()
                        }
                    }
                }
            }
    }
    
    private func targetOffset() -> CGSize {
        switch edge {
        case .top: return CGSize(width: x, height: -UIScreen.main.bounds.height / 2 + y)
        case .bottom: return CGSize(width: x, height: UIScreen.main.bounds.height / 2 + y)
        case .left: return CGSize(width: -UIScreen.main.bounds.width / 2 + x, height: y)
        case .right: return CGSize(width: UIScreen.main.bounds.width / 2 + x, height: y)
        case .none: return CGSize(width: x, height: y)
        }
    }
}

// MARK: - Pop Modifier
struct PopModifier: ViewModifier {
    var appear: Bool
    var delay: Double
    var duration: Double
    var completion: (() -> Void)?
    
    @State private var scale: CGFloat = 0.5
    @State private var isVisible = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isVisible ? 1 : scale)
            .opacity(isVisible ? 1 : 0)
            .onAppear {
                if appear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        withAnimation(.interpolatingSpring(stiffness: 170, damping: 6)) {
                            isVisible = true
                        }
                        if let completion = completion {
                            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                                completion()
                            }
                        }
                    }
                }
            }
    }
}

// MARK: - Bounce Modifier
struct BounceModifier: ViewModifier {
    var appear: Bool
    var delay: Double
    var duration: Double
    var completion: (() -> Void)?
    
    @State private var scale: CGFloat = 0.3
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .onAppear {
                if appear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        withAnimation(.interpolatingSpring(stiffness: 200, damping: 5)) {
                            scale = 1.0
                        }
                        if let completion = completion {
                            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                                completion()
                            }
                        }
                    }
                }
            }
    }
}

// MARK: - Shake Modifier
struct ShakeModifier: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let translation = amount * sin(animatableData * .pi * CGFloat(shakesPerUnit))
        return ProjectionTransform(CGAffineTransform(translationX: translation, y: 0))
    }
}

// MARK: - Fade Modifier
struct FadeModifier: ViewModifier {
    var show: Bool
    var delay: Double
    var duration: Double
    
    func body(content: Content) -> some View {
        content
            .opacity(show ? 1 : 0)
            .animation(.easeInOut(duration: duration).delay(delay), value: show)
    }
}

// MARK: - Flip Modifier
struct FlipModifier: ViewModifier {
    var delay: Double
    var duration: Double
    var completion: (() -> Void)?
    
    @State private var flipped = false
    
    func body(content: Content) -> some View {
        content
            .rotation3DEffect(
                .degrees(flipped ? 0 : -180),
                axis: (x: 0, y: 1, z: 0)
            )
            .opacity(flipped ? 1 : 0)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation(.easeInOut(duration: duration)) {
                        flipped = true
                    }
                    if let completion = completion {
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            completion()
                        }
                    }
                }
            }
    }
}


// MARK: - View Extension
extension View {
    func slideIn(from edge: SimpleAnimationEdge = .none,
                 x: CGFloat = 0,
                 y: CGFloat = 0,
                 duration: Double = 0.7,
                 delay: Double = 0,
                 completion: (() -> Void)? = nil) -> some View {
        self.modifier(SlideInModifier(edge: edge, x: x, y: y, delay: delay, duration: duration, completion: completion))
    }
    
    func slideOut(to edge: SimpleAnimationEdge = .none,
                  x: CGFloat = 0,
                  y: CGFloat = 0,
                  duration: Double = 0.7,
                  delay: Double = 0,
                  completion: (() -> Void)? = nil) -> some View {
        self.modifier(SlideOutModifier(edge: edge, x: x, y: y, delay: delay, duration: duration, completion: completion))
    }
    
    func popIn(delay: Double = 0, duration: Double = 0.4, completion: (() -> Void)? = nil) -> some View {
        self.modifier(PopModifier(appear: true, delay: delay, duration: duration, completion: completion))
    }
    
    func bounceIn(delay: Double = 0, duration: Double = 0.4, completion: (() -> Void)? = nil) -> some View {
        self.modifier(BounceModifier(appear: true, delay: delay, duration: duration, completion: completion))
    }
    
    func shake(times: Int = 3, amount: CGFloat = 10) -> some View {
        self.modifier(ShakeModifier(amount: amount, shakesPerUnit: times, animatableData: 1))
    }
    
    func fadeInOut(show: Bool, delay: Double = 0, duration: Double = 0.4) -> some View {
        self.modifier(FadeModifier(show: show, delay: delay, duration: duration))
    }
    
    func flipHorizontal(delay: Double = 0, duration: Double = 0.6, completion: (() -> Void)? = nil) -> some View {
        self.modifier(FlipModifier(delay: delay, duration: duration, completion: completion))
    }
}
