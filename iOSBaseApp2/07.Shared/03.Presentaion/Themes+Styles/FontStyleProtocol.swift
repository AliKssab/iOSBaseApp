//
//  FontStyleProtocol.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 6/7/25.
//

import SwiftUI

protocol FontStyleProtocol {
    var fontSizeDelta: CGFloat { get }
    var fontWeight: FontWeight { get }
}

extension FontStyleProtocol {
    var baseFontSize: CGFloat { 16 }
}

extension FontStyleProtocol {
    var calculatedFontSize: CGFloat {
        baseFontSize + fontSizeDelta
    }
    
    var font: Font {
        .primary(weight: fontWeight, size: calculatedFontSize)
    }
}
