//
//  KeychainManagerProtocol.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 25/12/2025.
//


import Foundation
import LocalAuthentication

protocol KeychainManagerProtocol {
    func save(_ value: Data, for account: String, service: String, useBiometrics: Bool) throws
    func read(for account: String, service: String, useBiometrics: Bool) throws -> Data?
    func delete(for account: String, service: String) throws
    func exists(for account: String, service: String) -> Bool
}
