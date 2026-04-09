//
//  CountryCodePhoneField.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 20/06/2025.
//

//
//  CountryCodePhoneField.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 27/10/2025.
//

import SwiftUI

// MARK: - CountryEntity Helpers
extension CountryEntity {
    var phoneStartingDigits: String? {
        let s = getPhoneStartingNumber().trimmingCharacters(in: .whitespaces)
        return s.isEmpty ? nil : s
    }

    var phoneLengthValue: Int? {
        let length = getPhoneLength()
        return length > 0 ? length : nil
    }
}

// MARK: - CountryCodePhoneField
struct CountryCodePhoneField: View {
    
    // MARK: - State
    @State private var lastDigits: String = ""
    
    // MARK: - Inputs
    @ObservedObject var controller: FormFieldController
    var country: CountryEntity
    var fieldId: String
    var focusedField: FocusState<FocusedField?>.Binding
    
    // MARK: - Configuration
    var labelKey: String = "phone_number_label"
    var placeholderTxt: String = "phone_number_label"
    var requiredPlaceholderTxt: String = "required_phone_number_label"
    var table: LocalizationFiles = .formFields
    var keyboardType: UIKeyboardType = .asciiCapableNumberPad
    var isOutlined: Bool = true
    var isFloating: Bool = true
    var isRequired: Bool = false
    var hasCountryImage: Bool = true
    var height: CGFloat = 52
    var font: Font = .primary(weight: .medium, size: 14)
    var action: (() -> Void)?
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            buildHeader()
            buildErrorView()
            buildInputRow()
            buildBottomLine()
        }
         .padding(.horizontal, 16)
//        .onChange(of: controller.text, perform: handleTextChange)
    }
}

// MARK: - Body Sections
private extension CountryCodePhoneField {
    
    @ViewBuilder
    func buildHeader() -> some View {
        if !isFloating {
            FieldLabelTextView(
                key: labelKey,
                table: table,
                isOptional: false
            )
        }
    }
    
    @ViewBuilder
    func buildErrorView() -> some View {
        if case let .error(message) = controller.fieldState {
            ValidationErrorView(message: message)
        }
    }
    
    @ViewBuilder
    func buildInputRow() -> some View {
        HStack(spacing: 8) {
            countryCodeView.onTapGesture { action?() }
            
            if !isOutlined {
                DividerLine()
            }
            
            floatingTextField
        }
        .environment(\.layoutDirection, .leftToRight)
    }
    
    @ViewBuilder
    func buildBottomLine() -> some View {
        if !isOutlined {
            LineSeparator(color: controller.fieldState.separatorColor)
        }
    }
}

// MARK: - Subviews
private extension CountryCodePhoneField {
    
    var countryCodeView: some View {
        HStack(spacing: 4) {
            if hasCountryImage {
                ScaledFitImageView(imageUrl: country.getFlagURL(), size: 20)
            }
            RegularTextView(
                key: country.getCodeWithPlus(),
                fontSizeDelta: -4,
                foregroundColor: .black
            )
        }
        .frame(height: height)
        .padding(.horizontal, isOutlined ? 8 : 0)
        .background(
            Color.white.cornerRadius(8)
                .overlay {
                    if isOutlined {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(AppColor.inputSeparatorGray.color, lineWidth: 1)
                    }
                }
        )
    }
    
    var floatingTextField: some View {
        ZStack(alignment: .leadingFirstTextBaseline) {
            if isFloating {
                RegularTextView(
                    key: isRequired ? requiredPlaceholderTxt : placeholderTxt,
                    table: .formFields,
                    fontSizeDelta: (controller.fieldState == .focused || !controller.text.isEmpty) ? -4 : -2,
                    foregroundColor: AppColor.darkGray
                )
                .offset(y: (controller.fieldState == .focused || !controller.text.isEmpty) ? -10 : 0)
                .animation(.easeInOut(duration: 0.3), value: controller.fieldState == .focused || !controller.text.isEmpty)
            }
            
            TextInputField(
                text: $controller.text,
                placeholder: isFloating ? "" : placeholderTxt,
                keyboardType: keyboardType
            )
            .focused(focusedField, equals: .field(fieldId))
            .frame(height: height)
            .offset(y: isFloating && (controller.fieldState == .focused || !controller.text.isEmpty) ? 12 : 0)
        }
        .padding(.leading, isOutlined ? 10 : 0)
        .frame(height: height)
        .background(
            Color.white.cornerRadius(8)
                .overlay {
                    if isOutlined {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(
                                (controller.fieldState == .focused || controller.isValid)
                                ? AppColor.darkRed.color
                                : AppColor.inputSeparatorGray.color,
                                lineWidth: 1
                            )
                    }
                }
        )
    }
    
    struct DividerLine: View {
        var body: some View {
            Rectangle()
                .fill(AppColor.countryCodeBlueGray.color)
                .frame(width: 1.15, height: 18)
        }
    }
    
    struct ValidationErrorView: View {
        let message: String
        var body: some View {
            HStack(alignment: .bottom, spacing: 8) {
                MediumTextView(
                    key: message,
                    fontSizeDelta: -4,
                    foregroundColor: .inputValidationErrorRed
                )
            }
            .padding(.top, 6)
        }
    }
}

// MARK: - Logic
private extension CountryCodePhoneField {
    
    func handleTextChange(_ oldValue: String, _ newValue: String) {
        if shouldIgnoreChange(newValue) { return }
        
        var digits = filteredDigits(from: newValue)
        let wasDeleting = digits.count < lastDigits.count
        
        digits = applyPhoneLimitIfNeeded(digits)
        digits = applyStartingDigitsIfNeeded(digits, wasDeleting: wasDeleting)
        
        if digits != controller.text {
            controller.text = digits
        }
        lastDigits = digits
    }

    private func shouldIgnoreChange(_ newValue: String) -> Bool {
        if newValue.contains(where: { $0.isLetter }) || newValue.contains("@") {
            lastDigits = newValue.filter { $0.isNumber }
            return true
        }
        return false
    }

    private func filteredDigits(from text: String) -> String {
        return text.filter { $0.isNumber }
    }

    private func applyPhoneLimitIfNeeded(_ digits: String) -> String {
        guard let limit = country.phoneLengthValue, digits.count > limit else { return digits }
        return String(digits.prefix(limit))
    }

    private func applyStartingDigitsIfNeeded(_ digits: String, wasDeleting: Bool) -> String {
        guard let start = country.phoneStartingDigits, !start.isEmpty else { return digits }
        
        var newDigits = digits
        if newDigits.isEmpty { return newDigits }
        if newDigits.count < start.count { return newDigits }
        
        if !newDigits.hasPrefix(start) && !wasDeleting {
            newDigits = start + newDigits
            if let limit = country.phoneLengthValue, newDigits.count > limit {
                newDigits = String(newDigits.prefix(limit))
            }
        }
        return newDigits
    }

}


#Preview {
    PreviewWrapper()
}

private struct PreviewWrapper: View {
    @StateObject private var phoneController = FormFieldController(validationType: .phone)
    @FocusState private var focusedField: FocusedField?

    var body: some View {
        VStack(spacing: 16) {
            CountryCodePhoneField(
                controller: phoneController, country: CountryEntity(id: 1, name: "", code: "", flag: "", phoneLength: 0, phoneStartingNumber: 0),
                fieldId: "phone",
                focusedField: $focusedField
            )
            
            CountryCodePhoneField(
                controller: phoneController, country: CountryEntity(id: 1, name: "", code: "", flag: "", phoneLength: 0, phoneStartingNumber: 0),
                fieldId: "phone2",
                focusedField: $focusedField
            )
        }
    }
}
   
struct CountryEntity: Codable, Identifiable, Hashable, Equatable {
  var id: Int?
  var name: String?
  var code: String?
  var flag: String?
  var phoneLength: Int?
  var phoneStartingNumber: Int?
  enum CodingKeys: String, CodingKey {
    case id, name, flag
    case code
    case phoneLength = "phone_length"
    case phoneStartingNumber = "phone_starting_number"
  }
}

extension CountryEntity {
  func getId() -> Int { id ?? .defaultValue }
  func getName() -> String { name ?? .defaultValue }
  func getCodeDigits() -> String { String(code ?? .defaultValue) }
  func getCodeWithPlus() -> String {
    let d = getCodeDigits()
    return d.isEmpty ? "" : "+\(d)"
  }
  func getFlagURL() -> String { flag ?? .defaultValue }
  func getPhoneLength() -> Int { phoneLength ?? .defaultValue }
  func getPhoneStartingNumber() -> String {
    phoneStartingNumber.map(String.init) ?? .defaultValue
  }
  // Matching helpers
  func matches(code raw: String) -> Bool {
    let digits = raw.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "+", with: "")
    return getCodeDigits() == digits
  }
}
