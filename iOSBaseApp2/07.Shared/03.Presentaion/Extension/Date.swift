//
//  Date.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import Foundation

extension Date {
    
    /// e.g. "الأحد 3/8"
    func localizedWeekdayDayMonth(locale: Locale = .current) -> String {
        let formatter = AppDateFormatter.weekdayDayMonthFormatter
        formatter.locale = locale
        return AppDateFormatter.format(self, with: formatter)
    }

    /// e.g. "أغسطس 2025"
    func localizedMonthYear(locale: Locale = .current) -> String {
        let formatter = AppDateFormatter.monthYearFormatter
        formatter.locale = locale
        return AppDateFormatter.format(self, with: formatter)
    }

    /// e.g. "11:04 ص"
    func localizedTime(locale: Locale = .current) -> String {
        let formatter = AppDateFormatter.timeFormatter(for: locale)
        return AppDateFormatter.format(self, with: formatter)
    }

    /// e.g. "أحد"
    func shortWeekday(locale: Locale = .current) -> String {
        let formatter = AppDateFormatter.shortWeekdayFormatter
        formatter.locale = locale
        return AppDateFormatter.format(self, with: formatter)
    }
}
