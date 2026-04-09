//
//  StatusBarBackground.swift
//  Lavander
//
//  Created by SamOur on 28/07/2025.
//
import SwiftUI

struct StatusBarBackground: View {
    var color: Color
    
    var body: some View {
        color
            .frame(height: 54)
            .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    VStack(spacing: 0) {
        StatusBarBackground(color: AppColor.black.color)
        Spacer()
    }
}

