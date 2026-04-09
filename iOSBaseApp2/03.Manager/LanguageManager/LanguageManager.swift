//
//  LanguageManager.swift
//  LavanderLandClinic
//
//  Created by Ali Mostafa on 19/08/2025.
//

import SwiftUI
import Combine

class LanguageManager: ObservableObject {
    
    static let shared = LanguageManager()
    
    @AppStorage("app_language") private var storedLanguage: String?
    @Published var currentLocale: Locale
    @Published var appLanguage: String
    
    init() {
        let savedLang = UserDefaults.standard.string(forKey: "app_language")
        let initialLang = savedLang ?? Locale.preferredLanguages.first?.prefix(2).description ?? "en"
        
        self.appLanguage = initialLang
        self.currentLocale = Locale(identifier: initialLang)
        
        self.storedLanguage = initialLang
    }
    
    func setLanguage(lang: String) {
        self.appLanguage = lang
        self.currentLocale = Locale(identifier: lang)
        storedLanguage = lang
        APIConfigManager.setLng(lang)
        objectWillChange.send()
        currentLocale = Locale(identifier: lang)
        UserDefaults.standard.set([lang], forKey: "AppleLanguages") // optional
        UserDefaults.standard.synchronize()
    }
    
    func getStoredLanguage() -> String {
        return storedLanguage ?? "en"
    }
    
    func refresh() {
        let lang = getStoredLanguage()
        self.appLanguage = lang
        self.currentLocale = Locale(identifier: lang)
        objectWillChange.send()
    }
    
    func openLanguageSettings() {
        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(settingsURL) {
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    func restartApp() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            exit(0)
        }
    }
}
