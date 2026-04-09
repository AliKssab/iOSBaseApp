//
//  RatingSummaryView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct RatingSummaryView: View {
    var rating: Double
    var reviewsCount: Int
    var totalStars: Int = 5
    var starSize: CGFloat = 12.5
    var starSpacing: CGFloat = 4.5
    var textColor: AppColor = .iconBorderBlueGray
    var filledStarImage: String = "ic_star_fill"
    var emptyStarImage: String =  "ic_star"
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            CosmosRatingView(rating: rating,
                             totalStars: totalStars,
                             starSize: starSize,
                             starSpacing: starSpacing,
                             filledStarImage: filledStarImage,
                             emptyStarImage: emptyStarImage)
            .frame(width: starSize * totalStars.floatValue + starSpacing + 12, height: starSize)
            .background(Color.clear)
            
            HStack(spacing: 4) {
                SemiBoldTextView(
                    key: "(\(String(format: "%.1f", rating)))",
                    table: .doctorDetails,
                    fontSizeDelta: -4,
                    foregroundColor: textColor
                )
                
                SemiBoldTextView(
                    key: "\(reviewsCount) " + "rate_title".localized(from: .shared),
                    table: .doctorDetails,
                    fontSizeDelta: -4,
                    foregroundColor: textColor
                )
            }
        }
    }
}