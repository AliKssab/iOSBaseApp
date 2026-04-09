//
//  backGroundView.swift
//  SPEAKER
//
//  Created by Ali Mostafa on 10/01/2026.
//
import SwiftUI

extension View {
    func screenBackground(_ color: Color) -> some View {
        ZStack {
            color.ignoresSafeArea()
            self
        }
    }
}
