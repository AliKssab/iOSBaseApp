//
//  BackgroundStatusBar.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 20/06/2025.
//


import SwiftUI

struct BackgroundStatusBar<Content: View>: View {
    @EnvironmentObject var nav: NavigationManager

    var color: AppColor = .pureWhite
    let content: (_ nav: NavigationManager) -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    content(nav)
                    Spacer()
                }.navigationBarHidden(true).hideKeyboardWhenTappedAround()
                color.color
                    .frame(height: geometry.safeAreaInsets.top)
                    .ignoresSafeArea(edges: .top)
            }
        }
    }
}
