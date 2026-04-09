//
//  FocusedField.swift
//  Fayendra
//
//  Created by khaled mohammed on 19/06/2025.
//

import SwiftUI


enum FocusedField: Hashable {
    case field(String)
}

extension FormTextField.FieldType: Equatable {
    static func == (lhs: FormTextField.FieldType, rhs: FormTextField.FieldType) -> Bool {
        switch (lhs, rhs) {
        case (.name, .name),
            (.email, .email),
            (.password, .password),
            (.confirmPassword, .confirmPassword),
            (.currentPassword, .currentPassword),
            (.newPassword, .newPassword),
            (.confirmNewPassword, .confirmNewPassword):
            return true
        case (.custom, .custom):
            return false
        default:
            return false
        }
    }
}

struct FormTextField: View {
    
    // MARK: - Enum
    
    enum FieldState: Equatable {
        case normal
        case focused
        case unfocused
        case error(message: String)
        
        var separatorColor: AppColor {
            switch self {
            case .focused:
                return .darkRed
            case .error:
                return .inputValidationErrorRed
            case .unfocused, .normal:
                return .inputSeparatorGray
            }
        }
    }
    
    enum FieldType {
        case name
        case email
        case password
        case confirmPassword
        case currentPassword
        case newPassword
        case confirmNewPassword
        case address
        case date
        case price
        case iBAN
        case custom(
            icon: AppIcon?,
            iconColor: AppColor,
            keyboardType: UIKeyboardType,
            labelKey: String,
            placeholderKey: String?,
            validation: FieldValidationType
        )
        
        var labelKey: String {
            switch self {
            case .name: return "full_name_label"
            case .email: return "email_label"
            case .password: return "password_label"
            case .confirmPassword: return "confirm_password_label"
            case .currentPassword: return "current_password_label"
            case .newPassword: return "new_password_label"
            case .confirmNewPassword: return "confirm_new_password_label"
            case .custom(_, _, _, let key, _, _): return key
            case .address: return "confirm_adress_label"
            case .date: return "data_label"
            case .price: return "price_lable"
            case .iBAN: return "iBAN_lable"
            }
        }
        
        var placeholderKey: String? {
            switch self {
            case .currentPassword:
                return "current_password_placeholder"
            case .newPassword:
                return "new_password_placeholder"
            case .confirmNewPassword:
                return "confirm_new_password_placeholder"
            case .custom(_, _, _, _, let placeholder, _): return placeholder
            case .name:
                return "full_name_placeholder"
            case .email:
                return "email_placeholder"
            case .password:
                return "password_placeholder"
            case .confirmPassword:
                return "confirm_new_password_placeholder"
            case .address:
                return "confirm_adress_placeholder"
            case .date:
                return "data_placeholder"

            case .price: return
                "0.0"
            case .iBAN: return
                "SA000..."
            }
        }
        
        var icon: AppIcon? {
            switch self {
            case .name: return .inputField(.name)
            case .email: return .inputField(.email)
            case .password, .confirmPassword, .currentPassword, .newPassword, .confirmNewPassword:
                return .inputField(.showPassword)
            case .custom(let icon, _, _, _, _, _): return icon
            case .address: return .inputField(.name)
                 
            case .date:
                return  .inputField(.name)
            case .price:
                return  .inputField(.name)
            case .iBAN:
                return .inputField(.name)
            }
        }
        
        var iconColor: AppColor {
            switch self {
            case .name, .email, .password, .confirmPassword, .currentPassword, .newPassword,.address ,  .confirmNewPassword ,.date , .price , .iBAN: return .inputFieldIcon
            case .custom(_, let color, _, _, _, _): return color
            }
        }
        
        var keyboardType: UIKeyboardType {
            switch self {
            case .name,.address , .date: return .default
            case .email: return .emailAddress
            case .password, .confirmPassword, .currentPassword, .newPassword, .confirmNewPassword , .price , .iBAN : return .asciiCapable
            case .custom(_, _, let type, _, _, _): return type
            }
        }
        
        var isSecure: Bool {
            switch self {
            case .password, .confirmPassword, .currentPassword, .newPassword, .confirmNewPassword:
                return true
            default:
                return false
            }
        }
        
        var validationType: FieldValidationType {
            switch self {
            case .name: return .name
            case .email: return .email
             case .password, .confirmPassword, .currentPassword, .newPassword, .confirmNewPassword :
                return .password
            case .custom(_, _, _, _, _, let validation): return validation
            case .address: return .name
            case .date: return .name
            case .price:
                return  .custom(isRequired: true, min: 1, max: 6, pattern: "", errorMessage: "")
            case .iBAN:
                return   .custom(isRequired: true, min: 1, max: 30, pattern: "", errorMessage: "")
            }
        }
    }
    
    // MARK: - Inputs
    @ObservedObject var controller: FormFieldController
    var fieldType: FieldType
    var fieldId: String
    var isOptional: Bool = false
    var focusedField: FocusState<FocusedField?>.Binding
    let table: LocalizationFiles = .formFields
    var isOutlined: Bool = true
    var isFloating: Bool = true
    var hasImage: Bool = false
    var hasErrorImage: Bool = false
    var height: CGFloat = 56
    
    // MARK: - State
    @State private var isPasswordVisible: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            FieldLabelTextView(
                key: fieldType.labelKey,
                table: table,
                isOptional: isOptional,
                fontSizeDelta: isFloating && (controller.fieldState == .focused || !controller.text.isEmpty) ? -4 : -2,
                foregroundColor: .deepVioletBlack
            )

            ZStack {
                HStack(spacing: 8) {
                    Group {
                        if fieldType.isSecure && !isPasswordVisible {
                            SecureInputField(
                                text: $controller.text,
                                placeholder: fieldType.placeholderKey?.localized(from: table) ?? ""
                            )
                        } else {
                            TextInputField(
                                text: $controller.text,
                                placeholder: fieldType.placeholderKey?.localized(from: table) ?? "",
                                keyboardType: fieldType.keyboardType
                            )
                        }
                    }
                    .frame(height: 30)

                    if hasImage {
                        if fieldType == .password ||
                            fieldType == .confirmPassword ||
                            fieldType == .currentPassword ||
                            fieldType == .newPassword ||
                            fieldType == .confirmNewPassword {
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                ScaledFitImageView(
                                    imageName: isPasswordVisible ? .inputField(.hidePassword) : .inputField(.showPassword),
                                    size: 20
                                )
                                .padding(.trailing, isOutlined ? 10 : 0)
                            }
                        }

                        if fieldType != .password &&
                            fieldType != .confirmPassword &&
                            fieldType != .currentPassword &&
                            fieldType != .newPassword &&
                            fieldType != .confirmNewPassword,
                           let icon = fieldType.icon {
                            ScaledFitImageView(
                                imageName: icon,
                                size: 20,
                                color: fieldType.iconColor
                            )
                            .padding(.trailing, isOutlined ? 10 : 0)
                        }
                    }
                }
                .padding(.leading, 10)
            }
            .frame(height: height)
            .background(
                Color.white.cornerRadius(16).overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            isOutlined && controller.fieldState == .focused
                            ? AppColor.darkRed.color
                            : AppColor.inputSeparatorGray.color,
                            lineWidth: 1
                        )
                }
            )

            if !isOutlined {
                LineSeparator(color: controller.fieldState.separatorColor)
            }

            if case let .error(message) = controller.fieldState {
                HStack(alignment: .bottom, spacing: 8) {
                    if hasErrorImage {
                        ScaledFitImageView(imageName: .validation(.errDanger), size: 18)
                    }

                    MediumTextView(
                        key: message,
                        fontSizeDelta: -4,
                        foregroundColor: .inputValidationErrorRed
                    )
                }
                .padding(.top, 6)
            }
        }
        .background(Color.clear)
        .focused(focusedField, equals: .field(fieldId))
        .padding(.horizontal, 20)
        .onChange(of: focusedField.wrappedValue) { oldValue, newValue in
            let isCurrent = newValue == .field(fieldId)

            if isCurrent {
                controller.fieldState = .focused
            } else if oldValue == .field(fieldId) {
                let result = FieldValidator.validate(controller.text, for: fieldType.validationType)
                controller.validationStatus = result

                switch result {
                case .valid:
                    controller.fieldState = .unfocused
                case .error(let message):
                    controller.fieldState = .error(message: message)
                default:
                    controller.fieldState = .normal
                }
            }
        }
    }}
 
