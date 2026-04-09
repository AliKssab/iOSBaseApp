//
//  LocalizationTextProtocol.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 6/7/25.
//

protocol LocalizationTextProtocol {
    var key: String { get }
    var table: LocalizationFiles { get }
}

extension LocalizationTextProtocol {
    var localizedText: String {
        key.localized(from: table)
    }
}
