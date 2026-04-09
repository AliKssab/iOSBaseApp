//
//  DataTypes+Extension.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 15/09/2025.
//

import CoreLocation
import UIKit


typealias Identifier = Int

extension Identifier {
    static var defaultValue: Identifier {
        return 0
    }
}

extension CLLocationCoordinate2D {
    static var defaultValue: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(0, 0)
    }
}


extension String {
    static var defaultValue: String {
        return ""
    }
}

extension Float {
    static var defaultValue: Float {
        return 0
    }
}


extension Double {
    static var defaultValue: Double {
        return 0
    }
}

extension Bool {
    static var defaultValue: Bool {
        return false
    }
}


extension Decimal {
    static var defaultValue: Decimal {
        return 0.0
    }
}

extension Decimal {
    func toDouble() -> Double {
        return (self as NSDecimalNumber).doubleValue
    }
}

extension Decimal {
    func toString() -> String {
        return NSDecimalNumber(decimal: self).stringValue
    }
}



//Arrays
typealias CustomArray<T> = [T]

extension Array where Element: DefaultValueProviding {
    static var defaultValue: CustomArray<Element> {
        return [Element.defaultValue]
    }
}

protocol DefaultValueProviding {
    static var defaultValue: Self { get }
}

extension Array {
    static var defaultValue: [Element] {
        return []
    }
}

extension Dictionary {
    static var defaultValue: [Key: Value] {
        return [:]
    }
}
