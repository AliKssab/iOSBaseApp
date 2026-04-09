//
//  ActivityIndicatorView.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 20/06/2025.
//


import SwiftUI
import NVActivityIndicatorView

struct ActivityIndicatorView: UIViewRepresentable {
    var type: NVActivityIndicatorType = .circleStrokeSpin
    var color: AppColor = .primaryPurple
    var size: CGSize = CGSize(width: 50, height: 50)
    
    func makeUIView(context: Context) -> NVActivityIndicatorView {
        let indicator = NVActivityIndicatorView(frame: CGRect(origin: .zero, size: size), type: type, color: .appColor(color), padding: nil)
        indicator.startAnimating()
        return indicator
    }

    func updateUIView(_ uiView: NVActivityIndicatorView, context: Context) {}
}
