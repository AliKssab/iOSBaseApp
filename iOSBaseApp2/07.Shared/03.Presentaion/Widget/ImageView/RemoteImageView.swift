//
//  RemoteImageView.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 29/06/2025.
//


import SwiftUI
import Kingfisher

struct RemoteImageView: View {
    let urlString: String?
    var contentMode: SwiftUI.ContentMode = .fit
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var isCircular: Bool = false
    var placeholder: AnyView = AnyView(Color.gray.opacity(0.2))
    var background: AppColor = .clear
    var cornerRadius: CGFloat = 12
    var borderColor : AppColor = .clear
    var borderWidth : CGFloat = 0
    var showProgree : Bool? = true
//    var imagePlacholder : String? = nil
    var body: some View {
           let url = URL(string: urlString ?? "")
        
           ZStack {
               background.color
               if let url = url/*,let image = imagePlacholder */{
                   KFImage(url)
                       .resizable()
                       .placeholder { p in
                           
                           ProgressView()
                               .progressViewStyle(.circular)
                               .frame(width: 30, height: 30)
                       }
                       .onFailureImage(UIImage(named: "ic_auth_header_logo"))

                       .cancelOnDisappear(true)
                       .aspectRatio(contentMode: contentMode)
                       
               } else {
                   placeholder
               }
               if let url = url {
                   KFImage(url)
                       .resizable()
                       .placeholder {
                           ProgressView()
                               .progressViewStyle(.circular)
                               .frame(width: 30, height: 30)
                       }
                       .onFailureImage(UIImage(named: "ic_auth_header_logo"))
                       .cancelOnDisappear(true)
                       .aspectRatio(contentMode: contentMode)
               } else {
                   Image("ic_auth_header_logo")
                       .resizable()
                       .aspectRatio(contentMode: contentMode)
               }
           }
           .frame(width: width, height: height)
           .clipShape(
               isCircular ? AnyShape(Circle()) : AnyShape(RoundedRectangle(cornerRadius: cornerRadius))
           )
           .overlay(RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(borderColor.color,lineWidth: borderWidth)
           )
       }
    
    
}
