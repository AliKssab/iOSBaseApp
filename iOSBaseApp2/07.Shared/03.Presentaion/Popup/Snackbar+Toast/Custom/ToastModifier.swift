//
//  ToastModifier.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 23/06/2025.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    let message: String
    let iconName: String?
    let backgroundColor: Color

    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            if isPresented {
//                ToastView(
//                    message: message,
//                    backgroundColor: backgroundColor,
//                    iconName: iconName
//                )
//                .transition(.move(edge: .top).combined(with: .opacity))
//                .zIndex(1)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isPresented)
    }
}

extension View {
    func toastMessage(
        isPresented: Binding<Bool>,
        message: String,
        iconName: String? = "exclamationmark.triangle.fill",
        backgroundColor: Color = Color.yellow.opacity(0.95)
    ) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, iconName: iconName, backgroundColor: backgroundColor))
    }
}
