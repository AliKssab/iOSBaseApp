//
//  ScaledFillAsyncImage.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct ScaledFillAsyncImage: View {
    let urlString: String?
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var cornerRadius: CGFloat = 10
    var showsActivity: Bool = true
    var cropAlignment: Alignment = .center   

    private var url: URL? {
        guard let s = urlString, let u = URL(string: s) else { return nil }
        return u
    }

    var body: some View {
        AsyncImage(url: url, transaction: .init(animation: .easeInOut)) { phase in
            switch phase {
            case .empty:
                ZStack {
                    Rectangle().fill(Color(.systemGray5))
                    if showsActivity { ProgressView() }
                }
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))

            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height, alignment: cropAlignment) // <- alignment controls visible area
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))

            case .failure:
                Image("ic auth header logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .foregroundColor(.gray)
                    .background(Color(.white))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            @unknown default:
                Image("ic auth header logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .foregroundColor(.gray)
                    .background(Color(.white))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            }
        }
    }
}
