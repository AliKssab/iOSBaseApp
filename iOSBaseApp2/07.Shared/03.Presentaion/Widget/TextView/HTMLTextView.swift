//
//  HTMLTextView.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 27/07/2025.
//


import SwiftUI

struct HTMLTextView: UIViewRepresentable {
    let html: String
    var fontSizeDelta: CGFloat = 0
    var foregroundColor: UIColor = .label
    var alignment: NSTextAlignment = .center
    var lineSpacing: CGFloat = 3
    var fontWeight: FontWeight = .regular
    var lineLimit: Int? = nil
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }

    func updateUIView(_ label: UILabel, context: Context) {
        let baseFont = Font.primary(weight: fontWeight, size: 16 + fontSizeDelta)
        let htmlStyle = """
        <style>
        body {
            margin: 0;
            padding: 0;
            font-family: \(baseFont);
        }
        p {
            margin: 0;
            padding: 0;
        }
        </style>
        """
        let fullHTML = htmlStyle + html

        if let data = fullHTML.data(using: .utf8),
           let attributedString = try? NSAttributedString(
               data: data,
               options: [.documentType: NSAttributedString.DocumentType.html,
                         .characterEncoding: String.Encoding.utf8.rawValue],
               documentAttributes: nil
           ) {
            label.attributedText = attributedString
            label.font = .primary(size: 16 + fontSizeDelta)
            label.numberOfLines = lineLimit ?? 0
            label.textAlignment = alignment
            
        }
    }
}
