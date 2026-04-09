//
//  CommunicationUtil.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 14/11/2023.
//

import Foundation
import UIKit


class CommunicationUtil {
    
  
    static func callPhoneNumber(_ phoneNumber: String?) {
        guard let phoneNumber, !phoneNumber.isEmpty else { return }
        let cleaned = phoneNumber.filter { $0.isNumber || $0 == "+" }
        guard let url = URL(string: "tel://\(cleaned)"),
              UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    static func sendEmail(to emailAddress: String?) {
        guard let emailAddress, !emailAddress.isEmpty else { return }
        guard let url = URL(string: "mailto:\(emailAddress)"),
              UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    static func openWebURL(_ urlString: String?) {
        guard let urlString, !urlString.isEmpty,
              let url = URL(string: urlString),
              UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    static func openWhatsApp(to phoneNumber: String?, message: String? = nil) {
        guard let phoneNumber, !phoneNumber.isEmpty else { return }
        let cleaned = phoneNumber.filter { $0.isNumber || $0 == "+" }

        let encoded = (message ?? "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = message == nil || message == ""
        ? "https://wa.me/\(cleaned)"
        : "https://wa.me/\(cleaned)?text=\(encoded)"

        openWebURL(urlString)
    }
    // Function to share text outside the app (SwiftUI / UIKit friendly)
    static func shareText(_ text: String) {
        guard let topVC = topViewController() else {
            print("Error: Cannot find top view controller.")
            return
        }

        let activityVC = UIActivityViewController(
            activityItems: [text],
            applicationActivities: nil
        )

        // iPad support
        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = topVC.view
            popover.sourceRect = CGRect(
                x: topVC.view.bounds.midX,
                y: topVC.view.bounds.midY,
                width: 0,
                height: 0
            )
            popover.permittedArrowDirections = []
        }

        topVC.present(activityVC, animated: true)
    }
    private static func topViewController(
        base: UIViewController? =
            UIApplication.shared
                .connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }?
                .rootViewController
    ) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }

        if let tab = base as? UITabBarController {
            return topViewController(base: tab.selectedViewController)
        }

        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }

        return base
    }

}

