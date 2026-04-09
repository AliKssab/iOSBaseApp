//
//  InlineTextActionPrompt.swift
//  AseerAlKotobSwiftUI
//
//  Created by Mohamed Ali on 21/12/2025.
//


import SwiftUI
struct InlineTextActionPrompt: View {
  // MARK: - Required
  var regularTextKey: String
  var actionTextKey: String
  var table: LocalizationFiles = .authentication
  var action: (() -> Void)?
  var body: some View {
    HStack(spacing: 4) {
        RegularTextView(key: regularTextKey,
              table: table,
                        foregroundColor: .black,lineLimit: 2)
      SemiBoldTextView(key: actionTextKey,
               table: table,
                       foregroundColor: .primaryPurple)
    }
    .onTapGesture { action?() }
  }
}
#Preview {
  InlineTextActionPrompt(regularTextKey: "already_have_account_text",
              actionTextKey: "login_link_text"){
    print("clicked")
  }
}







