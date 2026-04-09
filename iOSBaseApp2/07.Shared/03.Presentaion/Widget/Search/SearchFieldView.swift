//
//  SearchFieldView.swift
//  SPEAKER
//
//  Created by Ali Mostafa on 10/01/2026.
//

import SwiftUI

struct SearchFieldView: View {
    
    // MARK: - Bindings
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    // MARK: - Properties
    var tabel : LocalizationFiles = .home
    var placeholder: String
    var debounceTime: Double = 1.0
    var height : CGFloat = 47
    var onSearch: (String) async -> Void
    var backGroung : AppColor = AppColor.lightGray
    @State private var debounceWorkItem: DispatchWorkItem?
    var cornerRadious : CGFloat = 10
    var body: some View {
        HStack {
            
            // MARK: - Search Icon
            AspectFillImageView(
                selectedImage: UIImage(named: "img_Search"),
                width: 16,
                height: 16
            )
            
            ZStack(alignment: .leading) {
                
                // MARK: - Placeholder
                if text.isEmpty && !isFocused {
                    RegularTextView(
                        key: placeholder,
                        table: tabel,
                        fontSizeDelta: -4,
                        foregroundColor: .underlineTextDarkBlue,
                        textAlignment: .leading
                    )
                }
                
                // MARK: - TextField
                TextField("", text: $text)
                    .font(.system(size: 12, weight: .medium))
                    .submitLabel(.search)
                    .focused($isFocused)
                    .onChange(of: text) { newValue in
                        debounceWorkItem?.cancel()
                        
                        let workItem = DispatchWorkItem {
                            Task {
                                await onSearch(newValue)
                            }
                        }
                        
                        debounceWorkItem = workItem
                        DispatchQueue.main.asyncAfter(
                            deadline: .now() + debounceTime,
                            execute: workItem
                        )
                    }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .background(
            RoundedRectangle(cornerRadius: cornerRadious)
                .fill(.white)
        )
        .contentShape(Rectangle())
        .onTapGesture {
            isFocused = true
        }
    }
}
