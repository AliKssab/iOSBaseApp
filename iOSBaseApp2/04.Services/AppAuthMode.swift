//
//  AppAuthMode.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 17/07/2025.
//

import Foundation
import SwiftUI
import Combine

enum AppAuthMode: String {
    case loggedOut
    case guest
    case authorized
    case subscriber
}

final class AuthCachingService: ObservableObject {
    
    static let shared = AuthCachingService()
    
    // MARK: - Storage Keys
    private enum Keys {
        static let token = "auth_token"
        static let userID = "auth_userID"
        static let isLoggedIn = "auth_isLoggedIn"
        static let authMode = "auth_mode"
        static let hasSeenOnboarding = "has_seen_onboarding"
        static let userImageUrl = "auth_userImageUrl"
        static let userPhoneNamber = "auth_phoneNamber"
        static let isSubscriberg = "auth_subscriberg"
        static let userType = "auth_userType"
        static let fcmToken = "auth_fcmToken"
        static let userResponse = "auth_userResponse"
        
    }
    
    
    // MARK: - Static AppStorage Access
    private static var userResponseStorage: UserResponse? {
        get {
            guard let data = UserDefaults.standard.data(forKey: Keys.userResponse) else {
                return nil
            }
            
            do {
                return try JSONDecoder().decode(UserResponse.self, from: data)
            } catch {
                print("❌ Failed to decode UserResponse from storage: \(error)")
                return nil
            }
        }
        set {
            guard let newValue else {
                UserDefaults.standard.removeObject(forKey: Keys.userResponse)
                return
            }
            
            do {
                let data = try JSONEncoder().encode(newValue)
                UserDefaults.standard.set(data, forKey: Keys.userResponse)
            } catch {
                print("❌ Failed to encode UserResponse to storage: \(error)")
            }
        }
    }
    private static var userTypeStorage: UserTayp {
        get {
            let raw = UserDefaults.standard.string(forKey: Keys.userType)
            return UserTayp(rawValue: raw ?? UserTayp.client.rawValue) ?? .client
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: Keys.userType)
        }
    }
    
    private static var fcmTokenStorage: String {
        get { UserDefaults.standard.string(forKey: Keys.fcmToken) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: Keys.fcmToken) }
    }
    private static var tokenStorage: String {
        get { UserDefaults.standard.string(forKey: Keys.token) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: Keys.token) }
    }
    
    private static var userphoneNamberStorage: String? {
        get { UserDefaults.standard.string(forKey: Keys.userPhoneNamber) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.userPhoneNamber) }
    }

    
    private static var userIDStorage: Int {
        get { UserDefaults.standard.integer(forKey: Keys.userID) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.userID) }
    }
    
    private static var isLoggedInStorage: Bool {
        get { UserDefaults.standard.bool(forKey: Keys.isLoggedIn) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.isLoggedIn) }
    }
    
    private static var authModeStorage: AppAuthMode {
        get { AppAuthMode(rawValue: UserDefaults.standard.string(forKey: Keys.authMode) ?? AppAuthMode.loggedOut.rawValue) ?? .loggedOut }
        set { UserDefaults.standard.set(newValue.rawValue, forKey: Keys.authMode) }
    }
    
    private static var hasSeenOnboardingStorage: Bool {
        get { UserDefaults.standard.bool(forKey: Keys.hasSeenOnboarding) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.hasSeenOnboarding) }
    }
    
    private static var userImageUrlStorage: String? {
            get { UserDefaults.standard.string(forKey: Keys.userImageUrl) }
            set { UserDefaults.standard.set(newValue, forKey: Keys.userImageUrl) }
        }
    
    private static var isSubscribergStorage: Bool {
        get { UserDefaults.standard.bool(forKey: Keys.isSubscriberg) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.isSubscriberg) }
    }
    
    // MARK: - Reactive Published Properties
    @Published var token: String
    @Published var userID: Int
    @Published var isLoggedIn: Bool
    @Published var mode: AppAuthMode
    @Published var hasSeenOnboarding: Bool
    @Published var userImageUrl: String?
    @Published var userPhoneNamber: String?
    @Published var isSubscriberg: Bool
    @Published var userType: UserTayp
    @Published var fcmToken: String
    @Published var userResponse: UserResponse?

    
    // MARK: - Private
    private var cancellables = Set<AnyCancellable>()
    
    private init() {
        self.isSubscriberg = Self.isSubscribergStorage
        self.token = Self.tokenStorage
        self.userID = Self.userIDStorage
        self.isLoggedIn = Self.isLoggedInStorage
        self.mode = Self.authModeStorage
        self.hasSeenOnboarding = Self.hasSeenOnboardingStorage
        self.userImageUrl = Self.userImageUrlStorage
        self.userPhoneNamber = Self.userphoneNamberStorage
        self.userType = Self.userTypeStorage
        self.fcmToken = Self.fcmTokenStorage
        self.userResponse = Self.userResponseStorage
        $userType.dropFirst()
            .sink { Self.userTypeStorage = $0 }
            .store(in: &cancellables)
        $token.dropFirst().sink { Self.tokenStorage = $0 }.store(in: &cancellables)
        $userPhoneNamber.dropFirst().sink { Self.userphoneNamberStorage = $0 }.store(in: &cancellables)
        $userID.dropFirst().sink { Self.userIDStorage = $0 }.store(in: &cancellables)
        $isLoggedIn.dropFirst().sink { Self.isLoggedInStorage = $0 }.store(in: &cancellables)
        $mode.dropFirst().sink { Self.authModeStorage = $0 }.store(in: &cancellables)
        $hasSeenOnboarding.dropFirst().sink { Self.hasSeenOnboardingStorage = $0 }.store(in: &cancellables)
        $userImageUrl.dropFirst().sink { Self.userImageUrlStorage = $0 }.store(in: &cancellables)
        $isSubscriberg.dropFirst().sink { Self.isSubscribergStorage = $0 }.store(in: &cancellables)
   
        $fcmToken.dropFirst()
            .sink { Self.fcmTokenStorage = $0 }
            .store(in: &cancellables)
        $userResponse
            .dropFirst()
            .sink { Self.userResponseStorage = $0 }
            .store(in: &cancellables)
    }
    
    func updateUserImageUrl(_ url: String?) { self.userImageUrl = url }
    
    func saveUserSession(token: String, userID: Int,userPhoneNamber:String, isLoggedIn: Bool,isSubscriberg:Bool, mode: AppAuthMode, userType: UserTayp,    userResponse: UserResponse?

) {
        self.token = token
        self.userID = userID
        self.userPhoneNamber = userPhoneNamber
        self.isLoggedIn = isLoggedIn
        self.isSubscriberg = isSubscriberg
        self.mode = mode
        self.userType = userType
        self.userResponse = userResponse


    }
    
    func startGuestSession() {
        self.token = ""
        self.userID = 0
        self.isLoggedIn = false
        self.isSubscriberg = false
        self.mode = .guest
        self.userImageUrl = nil
        self.userPhoneNamber = nil
        userType = .client
        self.userResponse = nil
        
//        fcmToken = ""

    }
    
    func clearSession() {
        saveUserSession(token: "", userID: 0, userPhoneNamber: "", isLoggedIn: false, isSubscriberg: false, mode: .loggedOut,userType: .client, userResponse: nil)
 
        userImageUrl = nil
        userImageUrl = nil

    }
    
    func markOnboardingSeen() { hasSeenOnboarding = true }
    func hasCompletedOnboarding() -> Bool { hasSeenOnboarding }
    
    var isGuest: Bool { mode == .guest }
    var isClient: Bool { userType == .client }
    var isProvider: Bool { userType == .provider }

    // MARK: - Public Getters
    func getToken() -> String { token }
    func getUserID() -> Int { userID }
    func userIsLoggedIn() -> Bool { isLoggedIn }
    func currentMode() -> AppAuthMode { mode }
    func getIsSubscriberg() -> Bool { isSubscriberg }
    func getPhoneNamber() -> String { userPhoneNamber ?? "" }
    func saveFCMToken(_ token: String) {
        self.fcmToken = token
    }
    func getUserResponse() -> UserResponse? {
        userResponse
    }
    func getFCMToken() -> String {
        fcmToken
    }
}

extension AuthCachingService {
    var isAuthorized: Bool { mode == .authorized }
    var isUnauthenticated: Bool { mode != .authorized }
}

