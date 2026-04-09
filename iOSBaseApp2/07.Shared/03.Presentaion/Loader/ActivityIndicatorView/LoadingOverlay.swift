//
//  LoadingOverlay.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 20/06/2025.
//

import SwiftUI

struct LoadingOverlay: View {
    var withBackground: Bool = true
    var color: AppColor = .primaryPurple

    var body: some View {
        ZStack {
//            if withBackground {
//                Color.black.opacity(0.3).ignoresSafeArea()
//            }

            ZStack {
                //                RoundedRectangle(cornerRadius: 8)
                //                    .fill(withBackground ? Color.white : .clear)
                //                    .frame(width: 90, height: 90)
                VStack{
                    Spacer()
                    ActivityIndicatorView(color: color)
                        .frame(width: 50, height: 50) // Important for centering
                    Spacer()
                }
            }
        }
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.25), value: withBackground)
    }
}
