//
//  LottieView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI
import Lottie

struct LottieView: View {
    var filename: AppLottie
    var size: CGFloat = 40
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var fillsAvailableSpace: Bool = false
    var padding: CGFloat = 0
    var speed: CGFloat = 1.0
    var loopMode: LottieLoopMode = .loop
    var contentMode: UIView.ContentMode = .scaleAspectFit
    var delay: TimeInterval = 0.0
    
    var body: some View {
        let view = LottieUIViewRepresentable(
            filename: filename.filename,
            speed: speed,
            loopMode: loopMode,
            contentMode: contentMode,
            delay: delay
        )
        
        Group {
            if fillsAvailableSpace {
                view
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(padding)
            } else if let width, let height {
                view
                    .frame(width: width, height: height)
                    .padding(padding)
            } else {
                view
                    .frame(width: size, height: size)
                    .padding(padding)
            }
        }
    }
}

struct LottieUIViewRepresentable: UIViewRepresentable {
    var filename: String
    var speed: CGFloat = 1.0
    var loopMode:LottieLoopMode = .loop
    var contentMode: UIView.ContentMode = .scaleAspectFit
    var delay: TimeInterval = 0.0
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        
        let animationView = LottieAnimationView(name: filename)
        animationView.loopMode = loopMode
        animationView.animationSpeed = speed
        animationView.contentMode = contentMode
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: view.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            animationView.play()
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
