//
//   Double+Round.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 08/07/2025.
//

import Foundation
extension Double {
    func removingTrailingZeros() -> String {
            return self.truncatingRemainder(dividingBy: 1) == 0
                ? String(format: "%.0f", self)
                : String(self)
        }
}

extension Double {
    func addCurrency(
        fractionDigits: Int = 2
    ) -> String {
        let value = String(format: "%.\(fractionDigits)f", self)
        return "\(value) \("SAR".localized(from: .homeProvider))"
    }
}
