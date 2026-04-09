//
//  VerifyUpdatePhoneRequestEntity.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 15/10/2025.
//


struct VerifyUpdatePhoneRequestEntity:Codable {
    let phone:String
    let otp: String
   
    enum CodingKeys: String, CodingKey {
        case otp ,phone
    }
}
