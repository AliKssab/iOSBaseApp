//
//  OTPFieldGroup.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

extension StringProtocol {
    var string: String { String(self) }
}

struct OTPFieldGroup: View {
    @Binding var code: String
    @Binding var errorTrigger: Bool

    // MARK: - Configurations
    var digitsCount = 4
    var spacing: CGFloat = 20
    var boxSize: CGSize = .init(width: 60, height: 60)
    var isSecure: Bool = false

    // MARK: - Style
    var backgroundColorFilled: AppColor = .clear
    var backgroundColorEmpty: AppColor = .pureWhite
    var borderColorFilled: AppColor = .primaryPurple
    var borderColorEmpty: AppColor = .backgroundGray
    var borderColorError: AppColor = .inputValidationErrorRed

    var borderWidthFilled: CGFloat = 2
    var borderWidthEmpty: CGFloat = 1.5
    var cornerRadius: CGFloat = 30

    var textColor: AppColor = .pureBlack
    var digitFont: Font = .primary(weight: .medium, size: 24)

    // MARK: - Internal states
    @State private var isDisabled = false
    @State private var hasError = false
    @FocusState private var isFocused: Bool

    var errorMessage: String = "err_otp_invalid"
    var onOTPComplete: ((String) -> Void)? = nil

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack(spacing: spacing) {
                    ForEach(0..<digitsCount, id: \.self) { index in
                        OTPDigitBox(
                            character: character(at: index),
                            isFilled: index < code.count,
                            isCurrent: index == code.count,
                            isSecure: isSecure,
                            hasError: hasError,
                            size: boxSize,
                            textColor: textColor,
                            font: digitFont,
                            backgroundColorFilled: backgroundColorFilled,
                            backgroundColorEmpty: backgroundColorEmpty,
                            borderColorFilled: borderColorFilled,
                            borderColorEmpty: borderColorEmpty,
                            borderColorError: borderColorError,
                            borderWidthFilled: borderWidthFilled,
                            borderWidthEmpty: borderWidthEmpty,
                            cornerRadius: cornerRadius
                        )
                    }
                }.forceLeftToRight()

                TextField("", text: codeBinding)
                    .keyboardType(.asciiCapableNumberPad)
                    .textContentType(.oneTimeCode)
                    .foregroundColor(.clear)
                    .accentColor(.clear)
                    .focused($isFocused)
                    .frame(width: 1, height: 1)
                    .opacity(0.01)
            }

            if errorTrigger {
                MediumTextView(
                    key: errorMessage,
                    table: .validationMessages,
                    fontSizeDelta: -2,
                    foregroundColor: .inputValidationErrorRed
                )
                .transition(.opacity)
                .padding(.top, 16)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if !isDisabled {
                isFocused = true
            }
        }
        .allowsHitTesting(!isDisabled)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                if !isDisabled {
                    isFocused = true
                }
            }
        }
        .onChange(of: errorTrigger) { _, newValue in
            if newValue {
                triggerShakeAndReset()
            }
        }
    }

    private var codeBinding: Binding<String> {
        Binding(
            get: { code },
            set: { newValue in
                guard !isDisabled else { return }
                let digits = newValue.filter(\.isNumber).prefix(digitsCount)
                if digits.count == digitsCount, code != digits.string {
                    code = digits.string
                    onOTPComplete?(code)
                } else {
                    code = digits.string
                }
            }
        )
    }

    private func character(at index: Int) -> String {
        code.count > index ? String(code[code.index(code.startIndex, offsetBy: index)]) : ""
    }

    private func triggerShakeAndReset() {
        hasError = true
        isDisabled = true
        isFocused = false

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            hasError = false
            isDisabled = false
            isFocused = true
            code = ""
            errorTrigger = false
        }
    }
}
