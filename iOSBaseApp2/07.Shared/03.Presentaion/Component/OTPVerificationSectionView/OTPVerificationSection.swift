//
//  OTPVerificationSection.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 27/06/2025.
//

import SwiftUI


struct OTPVerificationSection: View {
    let duration: Int
    let onComplete: (String) -> Void
    let onError: () -> Void
    let onResendOTP: () -> Void

    // MARK: – OTP handling
    @State private var code: String = ""
    @Binding var errorTrigger: Bool

    // MARK: – Countdown Timer
    @StateObject private var countdownTimer: CountdownTimerUtil

    init(duration: Int = 60,
         errorTrigger: Binding<Bool>,
         onComplete: @escaping (String) -> Void,
         onError: @escaping () -> Void,
         onResendOTP: @escaping () -> Void) {
        self.duration = duration
        self._errorTrigger = errorTrigger
        self.onComplete = onComplete
        self.onError = onError
        self.onResendOTP = onResendOTP
        _countdownTimer = StateObject(wrappedValue: CountdownTimerUtil(duration: duration))
    }

    var body: some View {
        VStack(spacing: 35) {
            // MARK: - OTP Field Section
            OTPFieldGroup(
                code: $code,
                errorTrigger: $errorTrigger,
                onOTPComplete: handleOTPValidation
            )

            // MARK: – Resend line
            StackedTappableTextView(
                subtitleKey: countdownTimer.isFinished ? "" : "resend_code_timer_label",
                mainKey: countdownTimer.isFinished ? "resend_code_timer_title" : formattedCountdown,
                action: countdownTimer.isFinished ? { resendOTP() } : nil,
                showUnderline: false
            )
        }
        .animation(.easeInOut, value: errorTrigger)
    }

    // MARK: – OTP validation
    private func handleOTPValidation(code: String) {
        if code.count == 4 {
            onComplete(code)
        } else {
            errorTrigger = true
            onError()
        }
    }

    private var formattedCountdown: String {
        "(0:\(String(format: "%02d", countdownTimer.secondsRemaining)))"
    }
    
    // MARK: – Countdown / resend
    private func resendOTP() {
        countdownTimer.reset()
        onResendOTP()
    }
}
