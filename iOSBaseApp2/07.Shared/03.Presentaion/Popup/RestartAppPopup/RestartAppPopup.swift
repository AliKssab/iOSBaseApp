//
//  RestartAppPopup.swift
//  LavanderLandClinic
//
//  Created by Ali Mostafa on 14/09/2025.
//

import SwiftUI

struct RestartAppPopup: View {
    var title: String
    var message: String
    var action: (() -> Void)?
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.4)
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    BoldTextView(
                        key: title ,
                        table: .profile,
                        foregroundColor: .white,
                        textAlignment: .center
                    )
                    
                    SemiBoldTextView(
                        key: message ,
                        table: .profile,
                        fontSizeDelta: -2,
                        foregroundColor: .white,
                        textAlignment: .center
                    )
                    
                }
                
                SolidButton(
                    key: "btn_ok",
                    isEnabled: true,
                    action: {
                        action?()
                    },
                    foregroundColor: .primaryPurple,
                    backgroundColor: .white
                )
            }
            .padding()
            .frame(maxWidth: 300)
            .background(AppColor.primaryPurple.color)
            .cornerRadius(16)
            .shadow(radius: 10)
            .offset(y: 20)
        }
    }
}

