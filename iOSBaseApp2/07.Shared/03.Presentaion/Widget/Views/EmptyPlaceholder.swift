//
//  EmptyPlaceholder.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 22/07/2025.
//

import SwiftUI

extension View {
    func emptyPlaceholder<T: Collection>(
        _ items: T,
        title: String,
        subTitle: String,
        table: LocalizationFiles,
        imageName: AppIcon,
        // NEW
        forceShow: Bool = false,
        topPadding: CGFloat? = nil,
        ctaKey: String? = nil,
        onCTATap: (() -> Void)? = nil
    ) -> some View {
        ZStack {
            if items.isEmpty || forceShow {
                EmptyContentView(
                    title: title,
                    subTitle: subTitle,
                    table: table,
                    imageName: imageName,
                    // pass CTA
                    ctaKey: ctaKey,
                    onCTATap: onCTATap,
                    topPadding: topPadding
                )
            } else {
                self
            }
        }
    }
}

extension View {
    func emptyPlaceholderText<T: Collection>(
        _ items: T,
        title: String,
        table: LocalizationFiles  
    ) -> some View {
        ZStack {
            if items.isEmpty {
                EmptyTitlContentView(title: title, table: table)
            } else {
                self
            }
        }
    }
}

extension View {
    func emptyPlaceholder<T: Collection>(
        _ items: T,
        title: String,
        subTitle: String,
        table: LocalizationFiles,
        imageName: AppIcon
    ) -> some View {
        ZStack {
            if items.isEmpty {
                EmptyContentView(title: title, subTitle: subTitle, table: table, imageName: imageName)
            } else {
                self
            }
        }
    }
}
