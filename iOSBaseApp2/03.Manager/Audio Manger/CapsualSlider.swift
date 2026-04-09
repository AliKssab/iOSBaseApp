//
//  CapsualSlider.swift
//  Sound
//
//  Created by Sanour on 06/01/2026.
//
import SwiftUI

struct CapsualSlider: View {
    @Binding var progress: CGFloat
    var onSeek: ((CGFloat) -> Void)?
    
    @Environment(\.layoutDirection) private var layoutDirection
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                
                Capsule()
                    .fill(.white.opacity(0.15))
                    .frame(height: 2)
                
                Capsule()
                    .fill(.white.opacity(0.6))
                    .frame(
                        width: geo.size.width * progress,
                        height: 3.5
                    )
                
                Circle()
                    .fill(AppColor.white.color)
                    .frame(width: 12, height: 12)
                    .offset(x: geo.size.width * progress - 6)
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let x = min(max(0, value.location.x), geo.size.width)
                        let percent = x / geo.size.width
                        
                        let newProgress =
                        layoutDirection == .rightToLeft
                        ? 1 - percent
                        : percent
                        
                        progress = newProgress
                        onSeek?(newProgress)
                    }
            )
        }
        .frame(height: 20)
    }
}




