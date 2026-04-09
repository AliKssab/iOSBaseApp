//
//  CheckBoxComponent.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 30/11/2025.
//


import SwiftUI

struct CheckBoxComponent: View {

    @Binding var isChecked: Bool
    var size: CGFloat = 22
    var cornerRadius: CGFloat = 6
    var checkedColor: Color = .red
    var uncheckedColor: Color = .gray
    var disabled: Bool = false
    var onSelect: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: size/2)
                .strokeBorder(borderColor, lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: size/2)
                        .fill(isChecked ? checkedColor : .clear)
                )
                .frame(width: size, height: size)

            if isChecked {
                Image(systemName: "checkmark")
                    .font(.system(size: size * 0.6, weight: .bold))
                    .foregroundColor(.white)
                    .transition(.scale.combined(with: .opacity))
            }
        }
       
        .animation(.spring(response: 0.25, dampingFraction: 0.7), value: isChecked)
        .onTapGesture {
            guard !disabled else { return }
            onSelect()
            isChecked.toggle()
        }
        .opacity(disabled ? 0.5 : 1)
    }

    private var borderColor: Color {
        if disabled { return .gray.opacity(0.3) }
        return isChecked ? checkedColor : uncheckedColor
    }
}
