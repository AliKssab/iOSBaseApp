//
//  String+Attributes.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 19/10/2025.
//

import UIKit

extension String {
    func coloredText(wordsWithColors: [UIColor: [String]]) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for (color, words) in wordsWithColors {
            for word in words {
                let range = (self as NSString).range(of: word)
                if range.location != NSNotFound {
                    attributedString.addAttribute(.foregroundColor, value: color, range: range)
                }
            }
        }
        return attributedString
    }
}
