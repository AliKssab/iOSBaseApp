//
//  SolidButton.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct SolidButton: View, FontStyleProtocol, LocalizationTextProtocol {
    // MARK: - Required
    var key: String
    var table: LocalizationFiles = .buttonTitles
    var isEnabled: Bool = true
    var horizontalPadding: CGFloat = 0

    let action: () -> Void

    // MARK: - Optional Icon
    var iconName: AppIcon? = nil
    var iconPositionLeading: Bool = false
    var iconSize : CGFloat = 20
    
    // MARK: - Typography
    var fontSizeDelta: CGFloat = 0
    var fontWeight: FontWeight = .bold

    // MARK: - Layout
    var cornerRadius: CGFloat = 16
    var height: CGFloat = 56
    var width : CGFloat = .infinity
    // MARK: - Outlined Mode
    var isOutlined: Bool = false

    // MARK: - Custom Styling
    var foregroundColor: AppColor? = nil
    var backgroundColor: AppColor? = nil
    var borderColor: AppColor? = nil
    var borderWidth: CGFloat? = nil


    // MARK: - Computed Resolved Styles
    private var resolvedForeground: Color {
        if let fg = foregroundColor { return Color.appColor(fg)  }
        return isOutlined ? Color.appColor(.primaryPurple) : .white
    }

    private var resolvedBackground: Color {
        if let bg = backgroundColor { return Color.appColor(bg) }
        return isOutlined ? .white : Color.appColor(.primaryPurple)
    }

    private var resolvedBorderColor: Color {
        if let bc = borderColor { return Color.appColor(bc) }
        return isOutlined ? Color.appColor(.primaryPurple) : .clear
    }

    private var resolvedBorderWidth: CGFloat {
        if let bw = borderWidth { return bw }
        return isOutlined ? 1 : 0
    }
    
    private var effectiveBackground: Color {
        isEnabled ? resolvedBackground : resolvedBackground.opacity(0.4)
    }

    private var effectiveForeground: Color {
        isEnabled ? resolvedForeground : resolvedForeground.opacity(0.6)
    }

    // MARK: - View
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let iconName, iconPositionLeading {
                    ScaledFitImageView(imageName: iconName, size: iconSize)
//                    Image(systemName: iconName)
//                        .foregroundColor(effectiveForeground)
//                        .font(.primary(weight: .medium, size: 16))
                }
                if key != ""{
                    Text(localizedText)
                        .font(font)
                        .foregroundColor(effectiveForeground)
                }
                if let iconName, !iconPositionLeading {
                    ScaledFitImageView(imageName: iconName, size: iconSize)
//                    Image(systemName: iconName)
//                        .foregroundColor(effectiveForeground)
//                        .font(.primary(weight: .medium, size: 16))
                }
            }
            .foregroundColor(resolvedForeground)
            .frame(maxWidth: width)
            .frame(height: height)
            .background(effectiveBackground)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(resolvedBorderColor, lineWidth: resolvedBorderWidth)
            )
        }
        .disabled(!isEnabled)
        .padding(.horizontal, horizontalPadding)
    }
}


#Preview {
    VStack(spacing: 20) {
        SolidButton(key: "btn_next",isEnabled:false) {
            print("Primary tapped")
        }
        
        SolidButton(key: "btn_next") {
            print("Primary tapped")
        }
        
        SolidButton(
            key: "Continue as guest",
            action: { print("guest") },
            isOutlined: true
        )

        // Outlined style with icon
        SolidButton(
            key: "Sign in as Doctor",
            action: { print("Tapped") },
            iconName: .home(.arrowLeft),
            iconPositionLeading: true,
            isOutlined: true,
            foregroundColor: .darkRed,
            borderColor: .darkRed
        )
        
        SolidButton(
            key: "Custom Button",
            horizontalPadding: 32,
            action: { print("Tapped") },
            fontSizeDelta: 2,
            fontWeight: .medium,
            cornerRadius: 28,
            height: 48,
            isOutlined: true,
            foregroundColor: .darkGray,
            borderColor: .countryCodeBlueGray
        )

    }
}
