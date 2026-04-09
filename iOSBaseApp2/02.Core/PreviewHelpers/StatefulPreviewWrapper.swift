//
//  StatefulPreviewWrapper.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 15/09/2025.
//


import SwiftUI

struct StatefulPreviewWrapper<T: Equatable>: View {
    @State var value: T
    var content: (Binding<T>) -> AnyView

    init(_ value: T, content: @escaping (Binding<T>) -> some View) {
        _value = State(wrappedValue: value)
        self.content = { binding in AnyView(content(binding)) }
    }

    var body: some View {
        content($value)
    }
}