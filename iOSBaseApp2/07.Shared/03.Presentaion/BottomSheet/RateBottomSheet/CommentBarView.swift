////
////  CommentBarView.swift
////  AseerAlKotobSwiftUI
////
////  Created by Sana on 16/09/2025.
////
//
//
//import SwiftUI
//
//struct CommentBarView: View {
//    @Binding var text: String
//    var userImageUrl: String?
//    var placeholder: String = "rate_input_placeholder".localized(from: .shared)
//    @FocusState var isFocused: Bool
//    
//    private var resolvedUrl: String? {
//        let fromParam = userImageUrl?.trimmingCharacters(in: .whitespacesAndNewlines)
//        let fromCache = AuthCachingService.shared.userImageUrl?.trimmingCharacters(in: .whitespacesAndNewlines)
//        return (fromParam?.isEmpty == false ? fromParam : nil) ?? (fromCache?.isEmpty == false ? fromCache : nil)
//    }
//    
//    var body: some View {
//        HStack(spacing: 0) {
//            
//            if let url = resolvedUrl {
//                AspectFillImageView(
//                    imageUrl: url,
//                    width: 26, height: 26,
//                    isCircular: true
//                )
//                .padding()
//                .focused($isFocused)
//            } else {
//                AspectFillImageView(
//                    imageName: .home(.profileImg),
//                    width: 26,
//                    height: 26,
//                    isCircular: true
//                )
//                .padding()
//                .focused($isFocused)
//            }
//            
//            TextInputField(
//                text: $text,
//                placeholder: placeholder,
//                fontSizeDelta: -4
//            )
//            .frame(height: 48)
//            
//        }
//        .frame(height: 48)
//        .background(AppColor.whiteGray.color)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
//    }
//}
