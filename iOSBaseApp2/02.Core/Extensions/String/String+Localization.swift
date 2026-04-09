//
//  String+Localization.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 26/05/2025.
//

import Foundation

enum LocalizationFiles: String {
    case startupFlow = "StartupFlow"
    case onboarding = "Onboarding"
    case authentication = "Authentication"
    case home = "Home"
    case profile = "Profile"
    case doctorDetails = "DoctorDetails"
    case buttonTitles = "ButtonTitles"
    case validationMessages = "ValidationMessages"
    case formFields = "FormFields"
    case notification = "Notification"
    case shared = "Shared"
    case booking = "Booking"
    case search = "Search"
    case offers = "Offers"
    case favorite = "Favorite"
    case topChoice = "TopChoice"
    case freeLibrary = "FreeLibrary"
    case accessoris = "AccessoriesFroBook"
    case specialOffers = "SpecialOffers"
    case games = "Games"
    case soundBook = "SoundBooks"
    case profileSetting = "ProfileSetting"
    case myPlan = "MyPlan"
    case paperBook = "PaperBook"
    case bookDetails = "BookDetail"
    case myCart = "MyCart"
    case guest = "Guest"
    case bookPublish = "BookPublish"
    case bookLibrary = "BookLibrary"
    case myRequest = "MyRequest"
    case bookSubscription = "BookSubscription"
    case subscriber = "Subscriber"
    case userProfile = "UserProfile"
    case homeProvider = "HomeProvider"
    case subcategories = "SubCategories"
    case request = "CreateRequest"
    case orderDetailsProvider = "OrderDetailsProvider"
    case fAQ = "FAQ"
}

extension String {
    
    func trim() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func localized(from tableName: LocalizationFiles = .startupFlow, in bundle: Bundle = .main) -> String {
        NSLocalizedString(self, tableName: tableName.rawValue, bundle: bundle, comment: "")
    }
    
    func localized(with args: CVarArg..., from tableName: LocalizationFiles = .startupFlow) -> String {
        String(format: self.localized(from: tableName), arguments: args)
    }
}
