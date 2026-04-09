//
//  hideKeyboard.swift
//  SPEAKER
//
//  Created by Ali Mostafa on 24/01/2026.
//

import SwiftUI
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
