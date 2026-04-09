////
////  HorizontalTagSelectorSection.swift
////  AseerAlKotobSwiftUI
////
////  Created by Sana on 16/09/2025.
////
//
//
//import SwiftUI
//
//struct HorizontalTagSelectorSection: View {
//    let titleKey: String
//    let table: LocalizationFiles
//    let tags: [QuickCommentResponse]
//    @Binding var selectedTag: String?
//
//    var body: some View {
//        HStack(spacing: 8) {
//            SemiBoldTextView(
//                key: titleKey,
//                table: table,
//                fontSizeDelta: -4,
//                foregroundColor: .subtitle
//            )
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 8) {
//                    ForEach(tags, id: \.id) { tag in
//                        TagButton(
//                            title: tag.title,
//                            isSelected: selectedTag == tag.title,
//                            onTap: {
//                                selectedTag = tag.title
//                            },
//                            table: table
//                        )
//                    }
//                }
//                .padding(.horizontal, 16)
//            }
//        }
//    }
//}
//
//
//#Preview {
//    struct PreviewWrapper: View {
//        @State private var selected: String? = nil
//        let quickTags = [
//            QuickCommentResponse(id: 1, title: "دكتور رائع ومحترم!👏🦷"),
//            QuickCommentResponse(id: 2, title: " oooooo"),
//            QuickCommentResponse(id: 3, title: "موعد ممتاز"),
//            QuickCommentResponse(id: 4, title: "شكراً!"),
//            QuickCommentResponse(id: 5, title: "أنصح به"),
//            QuickCommentResponse(id: 6, title: "تجربة ممتازة")
//        ]
//
//        var body: some View {
//            HorizontalTagSelectorSection(
//                titleKey: "rate_tags_title",
//                table: .authentication,
//                tags: quickTags,
//                selectedTag: $selected
//            )
//        }
//    }
//
//    return PreviewWrapper()
//}
