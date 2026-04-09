//
//  TappableCosmosRatingView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Mohamed Ali on 23/12/2025.
//


import SwiftUI
import Cosmos

// Interactive Cosmos Rating View
struct TappableCosmosRatingView: UIViewRepresentable {
    @Binding var rating: Double
    var totalStars: Int = 5
    var starSize: CGFloat = 18
    var starSpacing: Double = 4
    var filledStarImage: String = "ic_star_fill"
    var emptyStarImage: String = "ic_grayStar"
    
    func makeUIView(context: Context) -> CosmosView {
        let view = CosmosView()
        view.settings.totalStars = totalStars
        view.settings.updateOnTouch = true
        view.settings.fillMode = .full
        view.rating = rating
        view.settings.starSize = starSize
        view.settings.starMargin = starSpacing
        view.settings.filledImage = UIImage(named: filledStarImage)
        view.settings.emptyImage = UIImage(named: emptyStarImage)
        view.settings.filledColor = .clear
        view.settings.emptyColor = .clear
        view.settings.emptyBorderColor = .clear
        view.settings.filledBorderColor = .clear
        
        // Update binding on tap
        view.didFinishTouchingCosmos = { newRating in
            self.rating = newRating
        }
        
        return view
    }
    
    func updateUIView(_ uiView: CosmosView, context: Context) {
        uiView.rating = rating
    }
}
