//
//  AppDateFormatter.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 15/09/2025.
//


import Foundation

enum AppDateFormatter {
    
    // MARK: - ISO Formatters
    
    static let isoWithFractionalSeconds: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    
    // MARK: - Static Formatters (Reusable for Performance)
    
    static let standardFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    static let simpleFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    static let weekdayDayMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ar")
        formatter.dateFormat = "EEEE d/M"
        return formatter
    }()
    
    static let monthYearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ar")
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
    
    static let shortWeekdayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ar")
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    static func timeFormatter(for locale: Locale = .current) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = "hh:mm a"
        if locale.identifier.starts(with: "ar") {
            formatter.amSymbol = "ص"
            formatter.pmSymbol = "م"
        }
        return formatter
    }
    
    // MARK: - Parsing
    
    static func parse(_ string: String, format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.date(from: string)
    }
    
    static func parseISO(_ string: String) -> Date? {
        isoWithFractionalSeconds.date(from: string)
    }
    
    // MARK: - Formatting
    
    static func format(_ date: Date, with format: String, locale: Locale) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = locale
        formatter.calendar = .current
        formatter.timeZone = .current
        return formatter.string(from: date)
    }
    
    static func format(_ date: Date, with formatter: DateFormatter) -> String {
        return formatter.string(from: date)
    }
    
    static func isoToFormattedDateString(_ string: String) -> String? {
        guard let date = parseISO(string) else { return nil }
        return format(date, with: simpleFormatter)
    }
    
    // MARK: - Time Only (e.g. from "14:00" to "02:00 م")
    static func arabicTime(from time: String) -> String {
        let parser = DateFormatter()
        parser.dateFormat = "HH:mm"
        let formatter = timeFormatter(for: Locale(identifier: "ar"))
        if let date = parser.date(from: time) {
            return formatter.string(from: date)
        }
        return time
    }
    
    static func formatToSimpleDate(_ dateString: String) -> String? {
        if let isoDate = parseISO(dateString) {
            return format(isoDate, with: simpleFormatter)
        }
        if let fallback = simpleFormatter.date(from: dateString) {
            return format(fallback, with: simpleFormatter)
        }
        return nil
    }
    
    static func convertTo24Hour(_ timeString: String, locale: Locale = Locale(identifier: "ar")) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.locale = locale
        inputFormatter.dateFormat = "hh:mm a"
        inputFormatter.amSymbol = "ص"
        inputFormatter.pmSymbol = "م"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "HH:mm"
        
        if let date = inputFormatter.date(from: timeString) {
            return outputFormatter.string(from: date)
        }
        return nil
    }
    static let backendDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.calendar = Calendar(identifier: .gregorian)
        df.locale = Locale(identifier: "en_US_POSIX")
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
    
    static let backendTimeFormatter: DateFormatter = {
        let df = DateFormatter()
        df.calendar = Calendar(identifier: .gregorian)
        df.locale = Locale(identifier: "en_US_POSIX")
        df.dateFormat = "HH:mm"
        return df
    }()
    
    static let arabicDisplayTimeParser: DateFormatter = {
        let df = DateFormatter()
        df.calendar = Calendar(identifier: .gregorian)
        df.locale = Locale(identifier: "ar_EG")
        df.dateFormat = "HH:mm" // e.g. "١٧:٠٠"
        return df
    }()
    
    static func convertTimeToBackend(_ time: String) -> String? {
        let arabicParser = arabicDisplayTimeParser
        let ampmParser = timeFormatter(for: .init(identifier: "ar"))
        let fallbackParser = DateFormatter()
        fallbackParser.dateFormat = "HH:mm"
        
        // Try Arabic e.g. "٠٦:٣٠"
        if let date = arabicParser.date(from: time) {
            return backendTimeFormatter.string(from: date)
        }
        
        // Try "06:30 م"
        if let date = ampmParser.date(from: time) {
            return backendTimeFormatter.string(from: date)
        }
        
        // Try fallback "06:30"
        if let date = fallbackParser.date(from: time.withEnglishNumbers) {
            return backendTimeFormatter.string(from: date)
        }
        
        return nil
    }
    
    static func localizedTime(from time: String) -> String {
        let inputFormats = ["HH:mm:ss", "HH:mm"]
        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale.current // auto-detects Arabic/English
        outputFormatter.dateFormat = "hh:mm a" // 12-hour format
        
        for format in inputFormats {
            let inputFormatter = DateFormatter()
            inputFormatter.locale = Locale(identifier: "en_US_POSIX")
            inputFormatter.dateFormat = format
            
            if let date = inputFormatter.date(from: time) {
                return outputFormatter.string(from: date)
            }
        }
        
        return time // fallback
    }
    
    static func localizedTimeWithEnglishNumbers(from time: String) -> String {
        let inputFormats = ["HH:mm:ss", "HH:mm"]
        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale.current
        outputFormatter.dateFormat = "hh:mm a" // e.g., "04:30 PM" or "٠٤:٣٠ م"
        
        for format in inputFormats {
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = format
            inputFormatter.locale = Locale(identifier: "en_US_POSIX")
            
            if let date = inputFormatter.date(from: time) {
                let localizedTime = outputFormatter.string(from: date)
                return localizedTime.withEnglishNumbers // force English digits
            }
        }
        
        return time 
    }
}

extension String {
    var withEnglishNumbers: String {
        self
            .replacingOccurrences(of: "٠", with: "0")
            .replacingOccurrences(of: "١", with: "1")
            .replacingOccurrences(of: "٢", with: "2")
            .replacingOccurrences(of: "٣", with: "3")
            .replacingOccurrences(of: "٤", with: "4")
            .replacingOccurrences(of: "٥", with: "5")
            .replacingOccurrences(of: "٦", with: "6")
            .replacingOccurrences(of: "٧", with: "7")
            .replacingOccurrences(of: "٨", with: "8")
            .replacingOccurrences(of: "٩", with: "9")
    }
}

extension AppDateFormatter {
    static var appLocale: Locale {
        if let lang = Bundle.main.preferredLocalizations.first, lang.hasPrefix("ar") {
            return Locale(identifier: "ar")
        }
        return Locale(identifier: "en")
    }

    /// Parse common ISO strings (with/without fractional seconds)
    private static func parseAnyISO(_ s: String) -> Date? {
        isoWithFractionalSeconds.date(from: s) ?? ISO8601DateFormatter().date(from: s)
    }

    static func reviewDisplayDate(
        fromISO iso: String,
        locale: Locale = appLocale,
        style: String = "d MMMM, yyyy",
        forceEnglishDigits: Bool = false
    ) -> String {
        guard let date = parseAnyISO(iso) else { return iso }

        let df = DateFormatter()
        df.calendar = Calendar(identifier: .gregorian)
        df.locale   = locale
        df.dateFormat = style

        let text = df.string(from: date)
        return forceEnglishDigits ? text.withEnglishNumbers : text
    }
}