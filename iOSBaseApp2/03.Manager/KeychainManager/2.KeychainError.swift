//
//  KeychainError.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 25/12/2025.
//

import Darwin

enum KeychainError: Error {
    case unexpectedStatus(OSStatus)
    case itemNotFound
    case authenticationFailed
}
