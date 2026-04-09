//
//  ScaledFitImageView.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 03/06/2025.
//

import SwiftUI

struct ScaledFitImageView: View {
    var imageName: AppIcon? = nil
    var imageUrl: String? = nil
    var size: CGFloat? = nil
    var width: CGFloat = 180
    var height: CGFloat = 180
    var color: AppColor? = nil
    var isCircular: Bool = false
    var borderColor : AppColor = .clear
    var borderWidth : CGFloat = 0
    var cornerRadius : CGFloat = 0
    var body: some View {
        let size = size != nil ? size! : nil
        
        Group {
            if let imageUrl = imageUrl, !imageUrl.isEmpty {
                RemoteImageView(
                    urlString: imageUrl,
                    contentMode: .fit,
                    width: size ?? width,
                    height: size ?? height,
                    isCircular: isCircular,
                    cornerRadius: cornerRadius,
                    borderColor: borderColor,
                    borderWidth: borderWidth
                )
            } else if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .applyIf(color != nil) {
                        $0
                        .renderingMode(.template)
                        .foregroundColor(color?.color)
                    }
                    .scaledToFit()
                    .frame(
                        width: size ?? width,
                        height: size ?? height)
                
                    .applyIf(isCircular) { $0.clipShape(Circle()) }
            } else {
                placeholderView
            }
        }
    }
    
    private var placeholderView: some View {
        Color.gray.opacity(0.2)
            .frame(width: width, height: height)
            .applyIf(isCircular) { $0.clipShape(Circle()) }
    }
}
