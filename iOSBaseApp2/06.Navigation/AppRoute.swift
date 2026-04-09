//
//  AppRoute.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 7/6/25.
//

enum AppRoute: Hashable {
    
    // MARK: - Intro
    enum StartupRoute: Hashable {
        case splash
        case onboarding
    }
    
   
    // MARK: - Master Router
    case startup(StartupRoute)
    
}

