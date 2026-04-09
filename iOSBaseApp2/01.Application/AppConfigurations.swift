//
//  AppConfigurations.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 23/06/2025.
//
//
import UIKit

class AppConfigurations {
    
    struct ToastConfig {
        static func configure() {
            AJMessageConfig.shared.titleFont = .primary(weight: .medium, size: 12)
            AJMessageConfig.shared.titleColor = .white
            AJMessageConfig.shared.messageFont = .primary(weight: .bold, size: 12)
            AJMessageConfig.shared.messageColor = .appColor(.white)
            
            AJMessageConfig.shared.backgrounColors = [
                .success:UIColor.appColor(.successGreen),
                .error: UIColor.appColor(.primaryPurple),
                .info: UIColor.appColor(.goldenYellow)
            ]
            
            AJMessageConfig.shared.images = [
                .success: UIImage(named: "ic_alert_warning")!,
                .error: UIImage(named: "ic_alert_warning")!,
                .info: UIImage(named: "ic_alert_warning")!
            ]
        }
    }
    
    static func applyConfigurations() {
        ToastConfig.configure()
    }
    
}
