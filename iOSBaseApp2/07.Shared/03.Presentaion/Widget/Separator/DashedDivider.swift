//
//  DashedDivider.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sanour on 24/12/2025.
//


import SwiftUI

struct DashedDivider: View {
    
    var color: AppColor = .inputSeparatorGray
    var lineWidth: CGFloat = 1
    var dash: [CGFloat] = [5, 5]
    var cornerRadius: CGFloat = 0
    var height: CGFloat = 1
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(
                color.color,
                style: StrokeStyle(
                    lineWidth: lineWidth,
                    dash: dash
                )
            )
            .frame(height: height)
    }
}
#Preview{
    DashedDivider()
}
