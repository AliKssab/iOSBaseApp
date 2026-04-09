//
//  QuickCommentResponse.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 21/07/2025.
//


import Foundation

struct QuickCommentResponse: Identifiable, Equatable {
    let id: Int
    let title: String
}

extension QuickCommentResponse {
    static let `default` = QuickCommentResponse(id: .defaultValue, title: .defaultValue)
}
