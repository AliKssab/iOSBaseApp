//
//  UIApplication.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 20/06/2025.
//

import UIKit

extension UIApplication {
    var statusBarHeight: CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows.first { $0.isKeyWindow }
        return keyWindow?.safeAreaInsets.top ?? 44
    }
}
