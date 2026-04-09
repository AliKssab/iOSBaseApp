//
//  Int+Extension.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 15/09/2025.
//


import Foundation

extension Int {
    func toDuration() -> String {
        let hours = self / 60
        let minutes = self % 60
        if hours > 0 {
            return "\(minutes) :\(hours) د"
        } else {
            return "\(minutes) د"
        }
    }
}
