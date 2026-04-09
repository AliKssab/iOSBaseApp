//
//  View+LayoutDirection.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 27/06/2025.
//

import SwiftUI

extension View {
    func forceLeftToRight() -> some View {
        self.environment(\.layoutDirection, .leftToRight)
    }
}
