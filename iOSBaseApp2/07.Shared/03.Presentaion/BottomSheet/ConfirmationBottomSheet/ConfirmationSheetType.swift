//
//  ConfirmationSheetType.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


enum ConfirmationSheetType: Identifiable {
    case deleteAccount(onConfirm: () -> Void, onCancel: () -> Void)
    case confirmUpdate(onConfirm: () -> Void, onCancel: () -> Void)
    case confirmRebook(onConfirm: () -> Void, onCancel: () -> Void)
    case confirmCancel(onConfirm: () -> Void, onCancel: () -> Void)
    case logout(onConfirm: () -> Void, onCancel: () -> Void)
    
    var id: String { titleKey } // for .sheet(item:) binding
    
    // MARK: - Localized Content
    var imageName: AppIcon {
        switch self {
        case .deleteAccount: return .shared(.deleteAccount)
        case .confirmUpdate: return .shared(.confirmationCheckmark)
        case .confirmRebook: return .shared(.confirmationCheckmark)
        case .confirmCancel: return .shared(.confirmationCheckmark)
        case .logout: return .shared(.logout)
        }
    }
    
    var titleKey: String {
        switch self {
        case .deleteAccount: return "delete_account_title"
        case .confirmUpdate: return "change_appointment_confirm_title"
        case .confirmRebook: return "rebook_appointment_confirm_title"
        case .confirmCancel: return "cancel_appointment_confirm_title"
        case .logout: return "logout_confirm_title"
        }
    }
    
    var subtitleKey: String {
        switch self {
        case .deleteAccount: return "delete_account_subtitle"
        case .confirmUpdate: return "change_appointment_confirm_subtitle"
        case .confirmRebook: return "rebook_appointment_confirm_subtitle"
        case .confirmCancel: return "cancel_appointment_confirm_subtitle"
        case .logout: return "logout_confirm_subtitle"
        }
    }
    
    var table: LocalizationFiles {
        return .shared
    }
    
    var primaryButtonKey: String {
        switch self {
        case .deleteAccount: return "btn_delete_account"
        case .logout: return "btn_logout"
        default: return "btn_confirm"
        }
    }
    
    var secondaryButtonKey: String {
        return "btn_cancel"
    }
    
    var primaryColor: AppColor {
        switch self {
        case .deleteAccount: return .inputValidationErrorRed
        default: return .primaryPurple
        }
    }
    
    var secondaryColor: AppColor? {
        switch self {
        case .deleteAccount: return .inputValidationErrorRed
        default: return nil
        }
    }
    
    // MARK: - Action closures
    var confirmAction: () -> Void {
        switch self {
        case let .deleteAccount(action, _),
             let .confirmUpdate(action, _),
             let .confirmRebook(action, _),
             let .confirmCancel(action, _),
             let .logout(action, _):
            return action
        }
    }

    var cancelAction: () -> Void {
        switch self {
        case let .deleteAccount(_, cancel),
             let .confirmUpdate(_, cancel),
             let .confirmRebook(_, cancel),
             let .confirmCancel(_, cancel),
             let .logout(_, cancel):
            return cancel
        }
    }
}
import SwiftUI

#Preview("Delete Account") {
    let type = ConfirmationSheetType.deleteAccount(
        onConfirm: {},
        onCancel: {}
    )
    
    return ConfirmationBottomSheetView(
        imageName: type.imageName,
        titleKey: type.titleKey,
        subtitleKey: type.subtitleKey,
        table: type.table,
        primaryButtonKey: type.primaryButtonKey,
        primaryAction: type.confirmAction,
        primaryButtonColor: type.primaryColor,
        secondaryButtonKey: type.secondaryButtonKey,
        secondaryAction: type.cancelAction,
        secondaryForegroundColor: type.secondaryColor,
        secondaryBorderColor: type.secondaryColor
    )
}


#Preview("Logout") {
    let type = ConfirmationSheetType.logout(
        onConfirm: {},
        onCancel: {}
    )
    
    return ConfirmationBottomSheetView(
        imageName: type.imageName,
        titleKey: type.titleKey,
        subtitleKey: type.subtitleKey,
        table: type.table,
        primaryButtonKey: type.primaryButtonKey,
        primaryAction: type.confirmAction,
        primaryButtonColor: type.primaryColor,
        secondaryButtonKey: type.secondaryButtonKey,
        secondaryAction: type.cancelAction,
        secondaryForegroundColor: type.secondaryColor,
        secondaryBorderColor: type.secondaryColor
    )
}



#Preview("Confirm Cancel") {
    let type = ConfirmationSheetType.confirmCancel(
        onConfirm: {},
        onCancel: {}
    )
    
    return ConfirmationBottomSheetView(
        imageName: type.imageName,
        titleKey: type.titleKey,
        subtitleKey: type.subtitleKey,
        table: type.table,
        primaryButtonKey: type.primaryButtonKey,
        primaryAction: type.confirmAction,
        primaryButtonColor: type.primaryColor,
        secondaryButtonKey: type.secondaryButtonKey,
        secondaryAction: type.cancelAction,
        secondaryForegroundColor: type.secondaryColor,
        secondaryBorderColor: type.secondaryColor
    )
}
