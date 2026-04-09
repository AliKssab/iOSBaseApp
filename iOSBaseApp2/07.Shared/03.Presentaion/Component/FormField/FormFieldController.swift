//
//  FormFieldController.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 27/06/2025.
//

import SwiftUI
import Combine

// MARK: - Field Controller
final class FormFieldController: ObservableObject {
    @Published var validationStatus: ValidationStatus = .idle
    @Published var fieldState: FormTextField.FieldState = .normal
    @Published var text: String = "" {
        didSet {
            self.validationStatus = FieldValidator.validate(text, for: validationType)
        }
    }
    
    let validationType: FieldValidationType
    let isOptional: Bool
    
    init(
        validationType: FieldValidationType,
        isOptional: Bool = false,
        initialText: String = ""
    ) {
        self.validationType = validationType
        self.isOptional = isOptional
        self.text = initialText
        self.validationStatus = FieldValidator.validate(initialText, for: validationType)
    }
    
    var isValid: Bool {
        return validationStatus == .valid
    }
    
    func setText(_ newText: String) {
        self.text = newText
    }
}
