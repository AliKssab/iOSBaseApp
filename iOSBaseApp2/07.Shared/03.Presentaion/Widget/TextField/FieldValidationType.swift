//
//  FieldValidationType.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 19/06/2025.
//


import Foundation
enum FieldValidationType {
    case name
    case email
    case password
    case phone
    case custom(isRequired: Bool, min: Int?, max: Int?, pattern: String?, errorMessage: String)
    
    var isRequired: Bool {
        switch self {
        case .email: return false
        case .custom(let isRequired, _, _, _, _): return isRequired
        default: return true
        }
    }
    
    var minLength: Int? {
        switch self {
        case .name: return 2
        case .email: return 5
        case .password: return 8
        case .phone: return 6
        case .custom(_, let min, _, _, _): return min
        }
    }
    
    var maxLength: Int? {
        switch self {
        case .name: return 50
        case .email: return 100
        case .password: return 30
        case .phone: return 16
        case .custom(_, _, let max, _, _): return max
        }
    }
    
    var pattern: String? {
        switch self {
        case .email:
            return "^(?!.*\\.\\.)[A-Za-z0-9_%+\\-](?:[A-Za-z0-9._%+\\-]*[A-Za-z0-9_%+\\-])?@(?:[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?\\.)+[A-Za-z]{2,}$"

        case .phone:
            return "^5[0-9]{8}$"
//            return ""
        case .password:
//            return ".*"
            return "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&]).{8,}$"
//            return "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%&*]).{8,}$"

        case .name:
            return "^[^0-9]+$" // no digits
        case .custom(_, _, _, let pattern, _):
            return pattern
        }
    }
    
    var errorMessage: String {
        switch self {
        case .name:
            return "err_name_invalid".localized(from: .validationMessages)
        case .email:
            return "err_email_invalid".localized(from: .validationMessages)
        case .password:
            return "err_password_invalid".localized(from: .validationMessages)
        case .phone:
            return "err_phone_invalid".localized(from: .validationMessages)
        case .custom(_, _, _, _, let message):
            return message
        }
    }
}


enum ValidationStatus: Equatable {
    case idle
    case validating
    case valid
    case error(message: String)
}

struct FieldValidator {
    static func validate(_ text: String, for type: FieldValidationType) -> ValidationStatus {
        let trimmed = text.trimmingCharacters(in: .whitespaces)
        
        if type.isRequired && trimmed.isEmpty {
            return .error(message: "err_field_required".localized(from: .validationMessages))
        }
        
//        if !type.isRequired && trimmed.isEmpty {
//            return .valid
//        }
        
        // Custom phone rule
        if case .phone = type {
            if !trimmed.hasPrefix("5") {
                return .error(message: "err_phone_invalid".localized(from: .validationMessages))
            }
            if trimmed.count != 9 {
                return .error(message: "err_phone_invalid".localized(from: .validationMessages))
            }
        }

        
        if let min = type.minLength, trimmed.count < min {
            return .error(message: "err_field_min_length".localized(with: min, from: .validationMessages))
        }
        
        if let max = type.maxLength, trimmed.count > max {
            return .error(message: "err_field_max_length".localized(with: max, from: .validationMessages))
        }
        
        if let regex = type.pattern, !trimmed.matches(regex) {
            return .error(message: type.errorMessage)
        }
        
        return .valid
    }
}
