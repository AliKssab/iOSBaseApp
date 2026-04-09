//
//  EmptyTitlContentView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 31/07/2025.
//


import SwiftUI

struct EmptyTitlContentView: View {
    let title: String
    let table: LocalizationFiles  

    var body: some View {
        VStack(spacing: 8) {
            RegularTextView(
                key: title,
                table:table,
                fontSizeDelta: 0,
                foregroundColor: .underlineTextDarkBlue
            )
        }
    }
}
