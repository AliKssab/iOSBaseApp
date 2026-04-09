//
//  String+Formatting.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 15/09/2025.
//

import Foundation

extension String {
    func removingTrailingZeros() -> String {
        if let doubleValue = Double(self) {
            return doubleValue.truncatingRemainder(dividingBy: 1) == 0
                ? String(format: "%.0f", doubleValue)
                : String(doubleValue)
        }
        return self
    }
}
