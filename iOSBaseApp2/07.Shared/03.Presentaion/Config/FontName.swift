//
//  FontName.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 26/05/2025.
//

import SwiftUI

enum FontName: String {
    case urwDinArabic = "URWDINArabic"
}

enum FontWeight: String {
    case regular = "Regular"
    case medium = "Medium"
    case semiBold = "Demi"
    case bold = "Bold"
}

extension Font {
    static func primary(weight: FontWeight = .regular, size: CGFloat) -> Font {
        let fontName = "\(FontName.urwDinArabic.rawValue)-\(weight.rawValue)"
        return Font.custom(fontName, size: size + 1)
    }
}

extension UIFont {
    static func primary(weight: FontWeight = .regular, size: CGFloat) -> UIFont {
        let fontName = "\(FontName.urwDinArabic.rawValue)-\(weight.rawValue)"
        return UIFont(name: fontName, size: size + 1)!
    }
}
