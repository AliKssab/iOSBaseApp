//
//  CosmosRatingView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI
import Cosmos

struct CosmosRatingView: UIViewRepresentable {
    var rating: Double
    var totalStars: Int = 5
    var starSize: CGFloat = 18
    var starSpacing: Double = 4
    var filledStarImage: String = "ic_star_fill_white"
    var emptyStarImage: String =  "ic_star_white"
    
    func makeUIView(context: Context) -> CosmosView {
        let view = CosmosView()
        view.settings.totalStars = totalStars
        view.settings.updateOnTouch = false
        view.settings.fillMode = .full
        view.rating = rating
        view.settings.starSize = starSize
        view.settings.starMargin = starSpacing

        // Custom star images
        view.settings.filledImage = UIImage(named: filledStarImage)
        view.settings.emptyImage = UIImage(named: emptyStarImage)

        // Optional colors (can be overridden by images)
        view.settings.filledColor = .clear
        view.settings.emptyColor = .clear
        view.settings.emptyBorderColor = .clear
        view.settings.filledBorderColor = .clear

        return view
    }

    func updateUIView(_ uiView: CosmosView, context: Context) {
        uiView.rating = rating
    }
}

#Preview() {
    CosmosRatingView(rating: 4.6,starSize:10)
}
