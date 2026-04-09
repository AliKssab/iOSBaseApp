//
//  View+Extension.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 19/06/2025.
//

import SwiftUI

extension View {
    @ViewBuilder
    func applyIf<T: View>(_ condition: Bool, transform: (Self) -> T) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    /// Optional sugar so you can write `.if(condition) { … }`
    @ViewBuilder
    func `if`<T: View>(_ condition: Bool,
                       transform: (Self) -> T) -> some View {
        applyIf(condition, transform: transform)
    }
}



extension View {
    func align(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
}


extension View {
    func hideKeyboardWhenTappedAround() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}


extension View {
    func onLoad(perform action: @escaping () -> Void) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
