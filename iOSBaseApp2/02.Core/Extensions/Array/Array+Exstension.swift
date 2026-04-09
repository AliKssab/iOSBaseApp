//
//  Array+Exstension.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 16/11/2025.
//


// MARK: - Array Safe Access
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}