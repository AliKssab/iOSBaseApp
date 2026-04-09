//
//  AppLottie.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 22/06/2025.
//


enum AppLottie {
    case splash(Splash)
    case onboarding(Onboarding)
    case auth(Auth)
    case dialog(Dialog)
    case search(Search)

    enum Splash: String {
        case loading = "lottie_splash_loading"
        case logo = "lottie_splash_logo"
    }

    enum Onboarding: String {
        case onboarding1_ar = "lottie_onboarding1_ar"
        case onboarding1_en = "lottie_onboarding1_en" 
        case onboarding2_ar = "lottie_onboarding2_ar"
        case onboarding2_en = "lottie_onboarding2_en"
        case onboarding3_ar = "lottie_onboarding3_ar"
        case onboarding3_en = "lottie_onboarding3_en"
    }
    
    enum Auth: String {
        case medicalTeamBanner = "lottie_medical_team_banner"
        case guestEyes = "lottie_auth_guest_eyes"
    }
    
    enum Search : String{
        case scanLine = "scan_lottie"
    }
    
    enum Dialog: String {
        case success = "lottie_dialog_success"
        case fail = "lottie_dialog_fail"
        case successGreen = "lottie_success_green"
    }


    var filename: String {
        switch self {
        case .splash(let value): return value.rawValue
        case .onboarding(let value): return value.rawValue
        case .auth(let value): return value.rawValue
        case .dialog(let value): return value.rawValue
        case .search(let value): return value.rawValue
        }
    }
}
