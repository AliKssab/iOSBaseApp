//
//  ColorStyleProtocol.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 6/7/25.
//

import SwiftUI

protocol ColorStyleProtocol {
    var foregroundColor: AppColor { get }
}

extension ColorStyleProtocol {
    var foregroundColor: Color {
        foregroundColor.color
    }
}
