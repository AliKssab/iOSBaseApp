//
//  NoInternetScreen.swift
//  LavanderLandClinic
//
//  Created by Sana on 26/08/2025.
//

import SwiftUI

// MARK: - No Internet
struct NoInternetScreen: View {
    var onRetry: () -> Void
    var body: some View {
        ErrorStateScreen(
            titleKey: "no_internet_title",
            subtitleKey: "no_internet_subtitle",
            table: .shared,
            image: .shared(.noInternet),
            onRetry: onRetry
        )
    }
}

// MARK: - Generic Error
struct GenericErrorScreen: View {
    var onRetry: () -> Void
    var body: some View {
        ErrorStateScreen(
            titleKey: "generic_error_title",
            subtitleKey: "generic_error_subtitle",
            table: .shared,
            image: .shared(.errorOccured),
            onRetry: onRetry
        )
        .padding(.top, 150)
        .padding(.horizontal, 16)

    }
}

#Preview("No Internet") {
    NoInternetScreen(onRetry: { print("retry") })
        .environmentObject(NavigationManager())
}

#Preview("Something wrong") {
    GenericErrorScreen(onRetry: { print("retry") })
        .environmentObject(NavigationManager())
}
