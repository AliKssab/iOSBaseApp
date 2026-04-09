//
//  ClearSpacerView.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 21/07/2025.
//


import SwiftUI

struct ClearSpacerView: View {
    var height: CGFloat = 20

    var body: some View {
        Spacer().frame(height: height)
            .background(.clear)
    }
}
