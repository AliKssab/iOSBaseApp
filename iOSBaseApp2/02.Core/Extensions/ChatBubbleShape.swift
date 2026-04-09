//
//  ChatBubbleShape.swift
//  SPEAKER
//
//  Created by Ali Mostafa on 23/02/2026.
//


import SwiftUI

struct ChatBubbleShape: Shape {
    
    var topLeft: CGFloat = 0
    var topRight: CGFloat = 0
    var bottomLeft: CGFloat = 0
    var bottomRight: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        // Start top-left
        path.move(to: CGPoint(x: topLeft, y: 0))
        
        // Top edge
        path.addLine(to: CGPoint(x: width - topRight, y: 0))
        
        // Top-right corner
        path.addQuadCurve(
            to: CGPoint(x: width, y: topRight),
            control: CGPoint(x: width, y: 0)
        )
        
        // Right edge
        path.addLine(to: CGPoint(x: width, y: height - bottomRight))
        
        // Bottom-right corner
        path.addQuadCurve(
            to: CGPoint(x: width - bottomRight, y: height),
            control: CGPoint(x: width, y: height)
        )
        
        // Bottom edge
        path.addLine(to: CGPoint(x: bottomLeft, y: height))
        
        // Bottom-left corner
        path.addQuadCurve(
            to: CGPoint(x: 0, y: height - bottomLeft),
            control: CGPoint(x: 0, y: height)
        )
        
        // Left edge
        path.addLine(to: CGPoint(x: 0, y: topLeft))
        
        // Top-left corner
        path.addQuadCurve(
            to: CGPoint(x: topLeft, y: 0),
            control: CGPoint(x: 0, y: 0)
        )
        
        return path
    }
}
