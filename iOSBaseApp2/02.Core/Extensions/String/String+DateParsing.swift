//
//  String+DateParsing.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 15/09/2025.
//

import Foundation

extension String {
    func toDate() -> Date? {
        // Try parsing the first format (with time zone)
        if let date = AppDateFormatter.parse(self, format: "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ") {
            return date
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        formatter.timeZone = TimeZone(identifier: "Asia/Riyadh")
        
        if let date = formatter.date(from: self) {
            return date
        }
        
        if let date = AppDateFormatter.parse(self, format: "yyyy-MM-dd'T'HH:mm:ssZ") {
            return date
        }
        
        return nil
    }
}

extension String {
    func isoToFormattedDateString() -> String? {
        guard let date = AppDateFormatter.parseISO(self) else {
            return nil
        }
        return AppDateFormatter.format(date, with: "d/M/yyyy", locale: Locale(identifier: "ar"))
    }
    
    // ------------------------------
    // ------- Case Conversion ------
    // ------------------------------
    func camelCaseToSnakeCase() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                return ($0 + "_" + String($1)).lowercased()
            } else {
                return $0 + String($1)
            }
        }
    }
}
