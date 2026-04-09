//
//  EditCountryCodePhoneField.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct EditCountryCodePhoneField: View {
    
    // MARK: - Inputs
    @ObservedObject var controller: FormFieldController
    var labelKey: String = "phone_number_label"
    let table: LocalizationFiles = .formFields
    var countryCode: String = "+966"
    var fieldId: String
    var focusedField: FocusState<FocusedField?>.Binding
    var font: Font = .primary(weight: .medium, size: 14)
    
    var isEditable: Bool = true
    var isEditButtonEnabled: Bool = true
    var showEditButton: Bool = false
    var onEditTap: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            // Label
            FieldLabelTextView(
                key: labelKey,
                table: table,
                isOptional: false
            )
            
            HStack(spacing: 8) {
                
                // MARK: - Input Row
                HStack(spacing: 8) {
                    
                    // MARK: -Country code
                    Text(countryCode)
                        .font(font)
                        .foregroundColor(AppColor.deepVioletBlack.color)
                    
                    Rectangle()
                        .fill(AppColor.countryCodeBlueGray.color)
                        .frame(width: 1.15, height: 18)
                    
                    // MARK: - Text input or non-editable version
                    if isEditable {
                        TextInputField(
                            text: $controller.text,
                            placeholder: "5XXXXXXXX",
                            keyboardType: .asciiCapableNumberPad
                        )
                        .frame(height: 28)
                    } else {
                        Text("\(controller.text)")
                            .font(font)
                            .foregroundColor(AppColor.deepVioletBlack.color)
                    }
                }
//                .layoutPriority(1)
                
                // MARK: - Edit Button
                if showEditButton {
                    
                    Spacer()
                    
                    Button(action: {
                        let result = FieldValidator.validate(controller.text, for: .phone)
                           
                           if case .valid = result {
                               onEditTap?()
                           } else if case let .error(message) = result {
                               controller.validationStatus = result
                               controller.fieldState = .error(message: message)
                               focusedField.wrappedValue = .field(fieldId)
                           }
                       }) {
                        SemiBoldTextView(
                            key:"btn_edit",
                            table:.buttonTitles,
                            fontSizeDelta: -4,
                            foregroundColor: .pureWhite)
                        .frame(width: 65,height: 31)
                        .background(AppColor.primaryPurple.color)
                        .cornerRadius(12)
                    }
                    .disabled(!isEditButtonEnabled)
                    .opacity(isEditButtonEnabled ? 1.0 : 0.6)
                }
            }
            .environment(\.layoutDirection, .leftToRight)

            
            LineSeparator(color: controller.fieldState.separatorColor)
            
            if case let .error(message) = controller.fieldState {
                HStack(alignment: .bottom, spacing: 8) {
                    ScaledFitImageView(imageName: .validation(.errDanger), size: 18)
                    MediumTextView(key: message, fontSizeDelta: -4, foregroundColor: .inputValidationErrorRed)
                }.padding(.top, 6)
            }
        }
        .focused(focusedField, equals: .field(fieldId))
        .padding(.horizontal, 16)
        .onChange(of: controller.text) { _, newValue in
            guard isEditable else { return }
            var filtered = newValue.filter { $0.isNumber }
            if !filtered.hasPrefix("5") {
                filtered = "5" + filtered.drop(while: { $0 == "5" })
            }
            if filtered.count > 9 {
                filtered = String(filtered.prefix(9))
            }
            controller.text = filtered
        }
        .onChange(of: focusedField.wrappedValue) { oldValue, newValue in
            guard isEditable else { return }
            let isCurrent = newValue == .field(fieldId)
            if isCurrent {
                controller.fieldState = .focused
            } else if oldValue == .field(fieldId) {
                let result = FieldValidator.validate(controller.text, for: .phone)
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
    }
}
