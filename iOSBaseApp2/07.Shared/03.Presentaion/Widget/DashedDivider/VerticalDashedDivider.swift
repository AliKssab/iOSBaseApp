//
//  VerticalDashedDivider.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct VerticalDashedDivider: View, ColorStyleProtocol {
    
    var foregroundColor: AppColor = .inputSeparatorGray
    var lineWidth: CGFloat = 0.5
    var dashPattern: [CGFloat] = [5, 4]
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: .zero)
                path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
            }
            .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dashPattern))
            .foregroundColor(foregroundColor)
            .frame(width: lineWidth)
        }
        .frame(width: lineWidth)
    }
}
#Preview {
    VerticalDashedDivider(foregroundColor: .darkRed, lineWidth: 0.5, dashPattern: [5,4])
}
