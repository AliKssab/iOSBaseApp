//
//  String+Extension.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 15/09/2025.
//

import SwiftUI

extension String {
    func matches(_ regex: String) -> Bool {
        range(of: regex, options: .regularExpression) != nil
    }
}
