//
//  Text+Alignment.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 17/06/2025.
//

import SwiftUI

extension TextAlignment {
    var asAlignment: Alignment {
        switch self {
        case .leading: return .leading
        case .trailing: return .trailing
        case .center: return .center
        @unknown default: return .center
        }
    }
}


extension TextAlignment {
    var asHorizontalAlignment: HorizontalAlignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}


extension NSTextAlignment {
    var cssValue: String {
        switch self {
        case .left: return "left"
        case .center: return "center"
        case .right: return "right"
        default: return "left"
        }
    }
}
