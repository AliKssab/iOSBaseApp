//
//  StoreNavigator.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 19/08/2025.
//


import UIKit

class StoreNavigator {
    /// Opens the App Store page for the given app.
    /// - Parameter appId: The App Store ID of the app.
    static func goToAppStore(appId: String) {
        let appStoreURL = "https://apps.apple.com/app/id\(appId)"
        guard let url = URL(string: appStoreURL), UIApplication.shared.canOpenURL(url) else {
            print("Invalid URL or unable to open App Store.")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
