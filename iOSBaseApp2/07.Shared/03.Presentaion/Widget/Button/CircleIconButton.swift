//
//  CircleIconButton.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI
import Foundation

enum BlurMaterial: CaseIterable {
    case ultraThin, thin, regular, thick, ultraThick

    func toUIBlurStyle() -> UIBlurEffect.Style {
        switch self {
        case .ultraThin: return .systemUltraThinMaterial
        case .thin: return .systemThinMaterial
        case .regular: return .systemMaterial
        case .thick: return .systemThickMaterial
        case .ultraThick: return .systemChromeMaterial
        }
    }
}

struct CircleIconButton: View {
    
    enum Style {
        case borderWhite
        case borderPrimary
        case borderBlueGray
        case filledPrimaryAlpha
        case filledGrayBlur
        case filledLavenderGrayBordered
        case filledDarkArrow
        case chat
        case custom(borderColor: AppColor, background: AppColor)
        case blur(material: BlurMaterial = .ultraThin)
        
        var borderColor: AppColor {
            switch self {
            case .blur: return .clear
            case .borderWhite: return .whiteGray
            case .borderPrimary: return .primaryPurple
            case .borderBlueGray: return .iconBorderBlueGray
            case .filledLavenderGrayBordered: return .backgroundGray
            case .filledPrimaryAlpha, .filledGrayBlur: return .clear
            case .custom(let border, _): return border
            case .filledDarkArrow: return .backgroundLightGray
          
            case .chat: return .yellow
                
            }
        }
        
        var borderWidth: CGFloat {
            switch self {
            case .blur: return 0
            case .borderWhite, .borderPrimary, .borderBlueGray, .filledLavenderGrayBordered, .custom: return 1
            default: return 0
            }
        }
        
        var foregroundColor: AppColor {
            switch self {
            case .borderWhite,.filledDarkArrow,.blur: return .white
            default: return .darkGray
            }
        }
        
        @ViewBuilder
        var background: some View {
            switch self {
            case .filledLavenderGrayBordered:
                Circle().fill(Color(.appColor(.backgroundSoftLavender)))
            case .filledGrayBlur:
                Circle().fill(.ultraThinMaterial)
            case .filledPrimaryAlpha:
                Circle().fill(Color.appColor(.palePurple))
            case .custom(_, let background):
                Circle().fill(background.color)
            case .filledDarkArrow:
                Circle().fill(Color.appColor(.backgroundLightGray))
            case .blur(let material):
                ZStack {
                    Circle().fill(Color.clear)
                    BlurView(style: material.toUIBlurStyle())
                        .clipShape(Circle())
                    Circle().fill(Color.black.opacity(0.05))
                }

            default:
                Color.clear
            }
        }
    }
    
    var iconName: AppIcon? = nil
    var imageUrl: String? = nil
    var style: Style = .borderBlueGray
    var buttonSize: CGFloat = 38
    var iconSize: CGFloat = 20
    var action: (() -> Void)? = nil
    
    // MARK: - Environment
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Computed
    private var resolvedAction: () -> Void {
        if let action = action {
               return action
           }
//        guard let iconName = iconName else {
//            return { action?() }
//        }
        
        switch iconName {
        case .header(.arrowBack):
            return { action?() ?? dismiss() }
            
        case .header(.share):
            return { /* handle share if needed */ }
            
        case .header(.favFilled): // as example
            return { /* handle favorite */ }
            
        case .system(.eyes): // or any other fallback
            return { action?() }
            
        case .header(let headerIcon) where headerIcon.rawValue.contains("notification"):
            return { /*notificationAction?() ?? {}*/ }
            
        default:
            return { action?() }
        }
    }
    
    var body: some View {
        Button(action: resolvedAction) {
            Group {
                if let imageUrl = imageUrl, !imageUrl.isEmpty {
                    RemoteImageView(
                        urlString: imageUrl,
                        contentMode: .fit,
                        width: iconSize,
                        height: iconSize,
                        isCircular: false
                    )
                } else if let iconName = iconName {
                    Image(iconName)
                        .resizable()
//                        .renderingMode(.template)
                        .foregroundColor(style.foregroundColor.color)
                        .scaledToFit()
                } else {
                    placeholderView
                }
            }
            .frame(width: iconSize, height: iconSize)
            .padding((buttonSize - iconSize) / 2)
            .background(style.background)
            .clipShape(Circle())
            .overlay(Circle().stroke(style.borderColor.color, lineWidth: style.borderWidth))
        }
        .frame(width: buttonSize, height: buttonSize)
    }
    
    private var placeholderView: some View {
        Circle()
            .fill(Color.gray.opacity(0.2))
            .frame(width: iconSize, height: iconSize)
    }
    
    
}


#Preview {
    VStack(spacing: 20) {
        CircleIconButton(
            iconName: .home(.offerCategory),
            style: .filledGrayBlur,
            buttonSize: 64,
            iconSize: 40
        )
        
        CircleIconButton(iconName: .header(.favFilled), style: .borderPrimary)
        
        CircleIconButton(iconName: .header(.arrowBack), style: .borderWhite)
        
        CircleIconButton(iconName: .header(.arrowBack), style: .borderBlueGray)
        CircleIconButton(iconName: .header(.whiteArrowBack), style: .filledDarkArrow)

        CircleIconButton(iconName: .header(.share), style: .borderWhite){
            
        }
    }
}
