//
//  PasswordWithConfirmationView.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 7/12/25.
//

import SwiftUI

struct PasswordWithConfirmationView: View {
    @ObservedObject var passwordController: FormFieldController
    @ObservedObject var confirmPasswordController: FormFieldController
    
    var focusedField: FocusState<FocusedField?>.Binding
    var onValidationChanged: ((Bool) -> Void)? = nil
    
    // New optional config
       var passwordFieldType: FormTextField.FieldType = .password
       var confirmFieldType: FormTextField.FieldType = .confirmPassword
    
    // MARK: - Internal validation state
    var isValid: Bool {
        passwordController.isValid &&
        confirmPasswordController.isValid &&
        passwordController.text == confirmPasswordController.text
    }
    
    var body: some View {
        VStack(spacing: 24) {
            FormTextField(
                controller: passwordController,
                fieldType: passwordFieldType,
                fieldId: "password",
                focusedField: focusedField,hasImage: true
            )
           
            FormTextField(
                controller: confirmPasswordController,
                fieldType: confirmFieldType,
                fieldId: "confirmPassword",
                focusedField: focusedField,hasImage: true
            )
        }
        .onChange(of: focusedField.wrappedValue) { _, _ in
            validateMatching()
        }
        
        .onChange(of: passwordController.text) { _, _ in
            validateMatching()
        }
        
        .onChange(of: confirmPasswordController.text) { _, _ in
            validateMatching()
        }
    }
    
    private func validateMatching() {
        let password = passwordController.text.trimmingCharacters(in: .whitespaces)
        let confirm = confirmPasswordController.text.trimmingCharacters(in: .whitespaces)

        if confirm.isEmpty {
            confirmPasswordController.validationStatus = .idle
            confirmPasswordController.fieldState = .normal
            onValidationChanged?(false)
            return
        }

        let confirmValidation = FieldValidator.validate(confirm, for: .password)
        confirmPasswordController.validationStatus = confirmValidation
        if case .error(let msg) = confirmValidation {
            confirmPasswordController.fieldState = .error(message: msg)
            onValidationChanged?(false)
            return
        }

        if password != confirm {
            let msg = "err_passwords_not_matching".localized(from: .validationMessages)
            confirmPasswordController.validationStatus = .error(message: msg)
            confirmPasswordController.fieldState = .error(message: msg)
            onValidationChanged?(false)
        } else {
            confirmPasswordController.validationStatus = .valid
            confirmPasswordController.fieldState = .unfocused
            onValidationChanged?(true)
        }
    }
}
