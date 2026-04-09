//
//  ListSectionHeader.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

struct BadgeDot: View {
    var color: AppColor = .darkRed
    var size: CGFloat = 8
    var body: some View {
        Circle()
            .fill(Color.appColor(color))
            .frame(width: size, height: size)
    }
}

struct ListSectionHeader: View {
    // ── Title ─────────────────────────────────────────────
    let titleKey: String
    var table: LocalizationFiles = .home
    var titleColor: AppColor = .deepVioletBlack
    var fontSizeDelta: CGFloat = 0
    var titleIcon:  AppIcon? = nil
    var count: Int? = nil
    var iconSize : CGFloat = 17
    
    var subtitleKey: String? = nil
    var subtitleTable: LocalizationFiles? = nil
    var subtitleColor: AppColor = .subtitle
    var subtitleFontSizeDelta: CGFloat = -6
    var subtitleInParens: Bool = true
    
    // ── Action (optional) ────────────────────────────────
    var actionTextKey: String? = nil
    var actionIcon: AppIcon? = nil
    var actionIconLeading: Bool = false
    var actionTextColor: AppColor = .deepVioletBlack
    var actionIconColor: AppColor? = nil
    var actionFontSizeDelta: CGFloat = 0
    var actionIsEnabled: Bool = true
    var actionBadgeVisible: Bool = false
    var onAction: (() -> Void)? = nil
    var badgeSize : CGFloat = 8
    @Environment(\.layoutDirection) private var dir
    
    var body: some View {
        HStack {
            // ===== Title block =====
            HStack(spacing: 4) {
                BoldTextView(
                    key: titleKey,
                    table: table,
                    fontSizeDelta: fontSizeDelta,
                    foregroundColor: titleColor,
                    textAlignment: .trailing
                )
                
                if let icon = titleIcon {
                    ScaledFitImageView(imageName: icon, size: 20)
                }
                
                if let count {
                    BoldTextView(
                        key: "(\(count))",
                        table: table,
                        foregroundColor: titleColor
                    )
                }
                
                // ---- subtitle (optional) ----
                if let subKey = subtitleKey {
                    let subTable = subtitleTable ?? table
                    let localized = subKey.localized(from: subTable)
                    let shown = subtitleInParens ? "(\(localized))" : localized
                    
                    SemiBoldTextView(
                        key: shown,
                        table: subTable,
                        fontSizeDelta: subtitleFontSizeDelta,
                        foregroundColor: subtitleColor,
                        textAlignment: .leading
                    )
                }
            }
            
            Spacer()
            
            // ===== Action block =====
            if let actionTextKey {
                Button { onAction?() } label: {
                    HStack(spacing: 6) {
                        if actionIconLeading, let icon = actionIcon {
                            ZStack(alignment: dir == .rightToLeft ? .topLeading : .topTrailing) {
                                ScaledFitImageView(imageName: icon, size: iconSize, color: actionIconColor)

                                if actionBadgeVisible {
                                    BadgeDot()
                                        .offset(x: dir == .rightToLeft ? -2.5 : 3, y: -1)
                                }
                            }
                        }

                        MediumTextView(
                            key: actionTextKey,
                            table: table,
                            fontSizeDelta: actionFontSizeDelta,
                            foregroundColor: actionTextColor
                        )

                        if !actionIconLeading, let icon = actionIcon {
                            ZStack(alignment: dir == .rightToLeft ? .topLeading : .topTrailing) {
                                ScaledFitImageView(imageName: icon, size: iconSize, color: actionIconColor)

                                if actionBadgeVisible {
                                    BadgeDot(size: badgeSize)
                                        .offset(x: dir == .rightToLeft ? -2.5 : 3, y: -1)
                                }
                            }
                        }
                    }
                }
                .disabled(!actionIsEnabled)
                .opacity(actionIsEnabled ? 1.0 : 0.4)
            }
        }
        .frame(minHeight: 33)
        .padding(.horizontal, 16)
    }
}


#Preview {
    VStack(spacing: 24) {
        // ✅ Full configuration (icon, count, action with leading icon)
        ListSectionHeader(
            titleKey: "", actionTextKey: "حذف الكل",
            actionTextColor: .subtitle,
            onAction: { print("View All tapped") }
        )
        
        ListSectionHeader(
            titleKey: "home_section_specialties_title",
            table: .home,
            actionTextKey: "ن",
            actionIcon: .home(.arrowLeft),
            actionTextColor: .deepVioletBlack,
            onAction: { print("View All tapped") }
        )
        // ✅ With action text only (no icon)
        ListSectionHeader(
            titleKey: "section_schedule_picker",
            actionTextKey: "action_open_calendar",
            actionTextColor: .primaryPurple,
            onAction: { print("Open Calendar tapped") }
        )
        
        // ✅ Title with icon only (no action)
        ListSectionHeader(
            titleKey: "section_filter_by",
            titleIcon: .home(.offerCategory)
        )
        
        // ✅ Just title text
        ListSectionHeader(
            titleKey: "section_sort_by_date",
            count: 10
        )
    }
}
