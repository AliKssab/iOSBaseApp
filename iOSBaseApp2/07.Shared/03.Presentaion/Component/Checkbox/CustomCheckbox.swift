//
//  CustomCheckbox.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 15/10/2025.
//



import SwiftUI
struct CustomCheckbox: View {
    
    @Binding var isSelected: Bool
    var size: CGFloat = 24
    var cornerRadius: CGFloat = 6
    var borderColor: AppColor = .lightGray
    var borderWidth: CGFloat = 1
    var fillColor: AppColor = .primaryPurple
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor.color, lineWidth: borderWidth)
                .frame(width: size, height: size)

            if isSelected {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(fillColor.color)
                    .frame(width: size, height: size)

                Image(systemName: "checkmark")
                    .foregroundColor(.white)
                    .font(.system(size: size * 0.6, weight: .bold))
            }
        }
         .onTapGesture {
            isSelected.toggle()
        }
    }
}


 
