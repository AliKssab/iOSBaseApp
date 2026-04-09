//
//  PageHeaderBar.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 17/06/2025.
//

import SwiftUI

struct PageHeaderBar: View {
    var titleKey: String? = nil
    var subtitleKey: String? = nil
    var table: LocalizationFiles? = nil
    var titleForegroundColor: AppColor? = nil
    var subTitleForegroundColor : AppColor? = nil
    var leftButtons: [CircleIconButton]? = nil
    var rightButtons: [CircleIconButton]? = nil
    var backgroundColor : AppColor = .clear
    var titleAlignment: TextAlignment = .center
    var showDivider: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    if let leftButtons {
                        HStack(spacing: 12) {
                            ForEach(leftButtons.indices, id: \.self) {
                                leftButtons[$0]
                            }
                        }
                    }
                    
                    Spacer()
                    
                    if let rightButtons {
                        HStack(spacing: 12) {
                            ForEach(rightButtons.indices, id: \.self) {
                                rightButtons[$0]
                            }
                        }
                    }
                }

                if titleKey != nil {
                    HStack {
                        if titleAlignment == .leading {
                            titleStack
                            Spacer()
                        } else if titleAlignment == .trailing {
                            Spacer()
                            titleStack
                        } else {
                            Spacer()
                            titleStack
                            Spacer()
                        }
                    }
                    .padding(50)
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 60)
            .background(backgroundColor.color)

            if showDivider {
                LineSeparator()
            }
        }
    }

    private var titleStack: some View {
        VStack(alignment: .leading, spacing: 2) {
            
            if let titleKey, let table {
                TitleTextView(key: titleKey, table: table, foregroundColor: titleForegroundColor ?? .deepVioletBlack)
            }
            if let subtitleKey, let table {
                BoldTextView(key: subtitleKey, table: table,fontSizeDelta: -4, foregroundColor: subTitleForegroundColor ?? .deepVioletBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
