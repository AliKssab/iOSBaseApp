//
//  LineSeparator.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 17/06/2025.
//


import SwiftUI

struct LineSeparator: View {
    var thickness: CGFloat = 1
    var color: AppColor = .lightGray

    var body: some View {
        Rectangle()
            .fill(color.color)
            .frame(height: thickness)
            .padding(.vertical,0)
    }
}

#Preview {
    LineSeparator(thickness: 10)
}
