//
//  GIFView.swift
//  SPEAKER
//
//  Created by Ali Mostafa on 07/01/2026.
//


//
//  GIFView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sanour on 04/11/2025.
//

import SwiftUI
import WebKit

struct GIFView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        // تحميل ملف الـ GIF
        if let path = Bundle.main.path(forResource: gifName, ofType: "gif") {
            let url = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: url) {
                webView.load(
                    data,
                    mimeType: "image/gif",
                    characterEncodingName: "UTF-8",
                    baseURL: url.deletingLastPathComponent()
                )
            }
        }
        
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        webView.scrollView.isScrollEnabled = false

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
