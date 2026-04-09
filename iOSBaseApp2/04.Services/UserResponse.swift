//
//  UserResponse.swift
//  SPEAKER
//
//  Created by Ali Mostafa on 12/01/2026.
//



// MARK: - User
struct UserResponse: Codable {
    let id: Int?
    let name, phone: String?
    let email: String?
    let role: UserTayp?
    let address: String?
    let isActive, isProfileCompleted: Bool?
    let activeSubscription: Bool?
    let image:String?
    let ratingAvg:Double?
    let ratingCount:Int?
    enum CodingKeys: String, CodingKey {
        case id, name, phone, email, role, address ,image
        case ratingAvg = "rating_avg"
        case ratingCount = "rating_count"
        case isActive = "is_active"
        case isProfileCompleted = "is_profile_completed"
        case activeSubscription = "active_subscription"
    }
}

extension UserResponse {
    
    var getId: Int {
        id ?? .defaultValue
    }
    var getUserImge:String {
        image ?? .defaultValue
    }
    var getName: String {
        name ?? .defaultValue
    }
    
    var getPhone: String {
        phone ?? .defaultValue
    }
    
    var getEmail: String {
        email ?? .defaultValue
    }
    
    var getUserTayp: UserTayp {
        role ?? .client
    }
    
    var getAddress: String {
        address ?? .defaultValue
    }
    
    var getIsActive: Bool {
        isActive ?? .defaultValue
    }
    
    var getIsProfileCompleted: Bool {
        isProfileCompleted ?? .defaultValue
    }
    
    var getActiveSubscription: Bool {
        activeSubscription ?? .defaultValue
    }
    
    var getRatingAvg:String {
        "(\(ratingAvg ?? .defaultValue))"  
    }
    
    var getRatingCount:Int {
        ratingCount ?? .defaultValue
    }
}

enum UserTayp: String ,Codable{
    case client
    case provider

    var localized: String {
        switch self {
        case .client:
            return "signUp_userType_user".localized(from: .authentication)
        case .provider:
            return "signUp_userType_provider".localized(from:.authentication)
        }
    }
}
 

