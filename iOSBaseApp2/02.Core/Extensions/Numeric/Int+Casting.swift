//
//  Int+Casting.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 7/5/25.
//

import SwiftUI

extension Int {
    var floatValue: CGFloat {
        get {
            CGFloat(self)
        }
    }
    
    var boolValue: Bool {
        return self != 0
    }
}
