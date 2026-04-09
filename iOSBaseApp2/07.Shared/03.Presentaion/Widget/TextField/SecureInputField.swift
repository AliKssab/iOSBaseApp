//
//  SecureInputField.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 19/06/2025.
//

import SwiftUI

struct SecureInputField: View {

    // MARK: - Bindings
    @Binding var text: String

    // MARK: - Configuration
    var placeholder: String = ""
    var keyboardType: UIKeyboardType = .asciiCapable
    var font: Font = .primary(weight: .medium, size: 14)
    var textAlignment: TextAlignment = .leading

    var body: some View {
        SecureField(placeholder, text: $text)
            .keyboardType(keyboardType)
            .font(font)
            .multilineTextAlignment(textAlignment)
    }
}
