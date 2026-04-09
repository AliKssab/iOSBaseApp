//
//  AspectFillImageView.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 29/06/2025.
//


import SwiftUI

struct AspectFillImageView: View {
    var imageName: AppIcon? = nil
    var imageUrl: String? = nil
    var selectedImage: UIImage? = nil
    var background: AppColor = .clear
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var isCircular: Bool = false
    var cornerRadius: CGFloat = 3
//    var imageFail :String = "ic_auth_header_logo"
    var body: some View {
        Group {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .background(background.color)
                    .clipShape(isCircular ? AnyShape(Circle()) : AnyShape(RoundedRectangle(cornerRadius: cornerRadius)))
                    .clipped()
            }
            else if let imageUrl = imageUrl, !imageUrl.isEmpty {
                RemoteImageView(
                    urlString: imageUrl,
                    contentMode: .fill,
                    width: width,
                    height: height,
                    isCircular: isCircular,
                    background: background,
                    cornerRadius: cornerRadius
//                   , imagePlacholder: imageFail
                )
            }
            else if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .background(background.color)
                    .clipShape(isCircular ? AnyShape(Circle()) : AnyShape(RoundedRectangle(cornerRadius: cornerRadius)))
                    .clipped()
                //                            .contentShape(Rectangle())
            } else {
                placeholderView
            }
        }
    }
    
    private var placeholderView: some View {
        Color.gray.opacity(0.2)
            .frame(width: width, height: height)
            .clipShape(isCircular ? AnyShape(Circle()) : AnyShape(RoundedRectangle(cornerRadius: cornerRadius)))
    }
}
