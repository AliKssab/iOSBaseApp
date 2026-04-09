import SwiftUI

struct TextInputField: View, FontStyleProtocol {

    @Binding var text: String

    var placeholder: String = ""
    var keyboardType: UIKeyboardType = .default
    var textAlignment: TextAlignment = .leading
    var autocapitalization: TextInputAutocapitalization = .never

    var fontSizeDelta: CGFloat = -2
    var fontWeight: FontWeight { .medium }

    private var isNumericKeyboard: Bool {
        keyboardType == .numberPad ||
        keyboardType == .asciiCapableNumberPad ||
        keyboardType == .phonePad
    }

    private var normalizedBinding: Binding<String> {
        Binding(
            get: { text },
            set: { newValue in
                text = isNumericKeyboard ? newValue.englishDigits : newValue
            }
        )
    }

    var body: some View {
        TextField(placeholder, text: normalizedBinding)
            .keyboardType(keyboardType)
            .font(.system(size: 16, weight: .medium))
            .multilineTextAlignment(isNumericKeyboard ? .leading : textAlignment)
            .textInputAutocapitalization(autocapitalization)
            .foregroundColor(.appColor(.deepVioletBlack))
            .environment(\.layoutDirection, isNumericKeyboard ? .leftToRight : .rightToLeft)
    }
}

extension String {
    var englishDigits: String {
        let digitsMap: [Character: Character] = [
            "٠": "0", "١": "1", "٢": "2", "٣": "3", "٤": "4",
            "٥": "5", "٦": "6", "٧": "7", "٨": "8", "٩": "9",
            "۰": "0", "۱": "1", "۲": "2", "۳": "3", "۴": "4",
            "۵": "5", "۶": "6", "۷": "7", "۸": "8", "۹": "9"
        ]

        return String(self.map { digitsMap[$0] ?? $0 })
    }
}
import SwiftUI
import UIKit

struct PhoneTextField: UIViewRepresentable, FontStyleProtocol {
    
    @Binding var text: String
    
    var placeholder: String = ""
    var keyboardType: UIKeyboardType = .asciiCapableNumberPad
    var textAlignment: TextAlignment = .leading
    
    var fontSizeDelta: CGFloat = -2
    var fontWeight: FontWeight { .medium }
    
    final class Coordinator: NSObject, UITextFieldDelegate {
        var parent: PhoneTextField
        
        init(parent: PhoneTextField) {
            self.parent = parent
        }
        
        @objc func textDidChange(_ textField: UITextField) {
            let current = textField.text ?? ""
            let normalized = current.englishDigits
            
            if parent.text != normalized {
                parent.text = normalized
            }
            
            if textField.text != normalized {
                textField.text = normalized
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.addTarget(
            context.coordinator,
            action: #selector(Coordinator.textDidChange(_:)),
            for: .editingChanged
        )
        
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.textAlignment = uiTextAlignment
        textField.semanticContentAttribute = .forceLeftToRight
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.textColor = UIColor(Color.appColor(.deepVioletBlack))
        textField.borderStyle = .none
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
        
        uiView.placeholder = placeholder
        uiView.keyboardType = keyboardType
        uiView.textAlignment = uiTextAlignment
        uiView.autocapitalizationType = .none
        uiView.semanticContentAttribute = .forceLeftToRight
        uiView.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        uiView.textColor = UIColor(Color.appColor(.deepVioletBlack))
    }
    
    private var uiTextAlignment: NSTextAlignment {
        switch textAlignment {
        case .center:
            return .center
        case .trailing:
            return .right
        default:
            return .left
        }
    }
}
