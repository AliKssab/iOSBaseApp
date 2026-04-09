//
//  ToastView.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 23/06/2025.
//


import SwiftUI

struct ToastView: View {
    let message: String
        let buttonTitle: String
        let onTap: () -> Void
        let onDismiss: () -> Void

        @GestureState private var dragOffset = CGSize.zero

        var body: some View {
            VStack(spacing: 0) {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.orange)

                    Text(message)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.orange)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)

                    Spacer()

                    Button(action: onTap) {
                        Text(buttonTitle)
                            .underline()
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.orange)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 12)
                .padding(.top, 50) // for status bar space
            }
            .frame(maxWidth: .infinity)
            .background(Color(hex: "#FFF7E7"))
            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
            .offset(y: dragOffset.height)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        if value.translation.height < 0 {
                            state = value.translation
                        }
                    }
                    .onEnded { value in
                        if value.translation.height < -50 {
                            onDismiss()
                        }
                    }
            )
        }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(
            RoundedCorner(radius: radius, corners: corners)
        )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
