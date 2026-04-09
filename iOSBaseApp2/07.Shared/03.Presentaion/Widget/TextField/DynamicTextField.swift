//
//  DynamicTextField.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct DynamicTextField: View, FontStyleProtocol {
    
    // MARK: - Bindings
    @Binding var text: String
    
    // MARK: - Configuration
    var placeholder: String = ""
    var localizationTable: LocalizationFiles? = nil
    var keyboardType: UIKeyboardType = .default
    var textAlignment: TextAlignment = .trailing
    var autocapitalization: TextInputAutocapitalization = .never
    var fontSizeDelta: CGFloat = -2
    var fontWeight: FontWeight = .medium
    var maxCharacters: Int? = nil
    // MARK: - Layout
    var height: CGFloat = 130
    var maxLines: Int? = nil
    var cornerRadius: CGFloat = 12
    
    var body: some View {
        TextField(placeholder, text: $text, axis: .vertical)
            .keyboardType(keyboardType)
            .textInputAutocapitalization(autocapitalization)
            .font(font)
        //            .multilineTextAlignment(textAlignment)
            .lineLimit(maxLines)
            .foregroundColor(.appColor(.deepVioletBlack))
            .padding()
            .frame(height: height, alignment: .top)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(AppColor.inputSeparatorGray.color, lineWidth: 1)
            )
            .cornerRadius(cornerRadius)
            .onChange(of: text) { oldValue, newValue in
                text = String(text.prefix(maxCharacters ?? 2))
             }
    }
}
