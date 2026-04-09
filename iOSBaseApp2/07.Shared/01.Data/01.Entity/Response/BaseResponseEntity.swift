//
//  BaseResponseEntity.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 25/06/2022.
//

import Foundation

struct BaseResponseEntity<T: Decodable>: Decodable {
    var status: NetworkResultStatus?
    var message: String?
    var data: T?
}

extension BaseResponseEntity {
    func alertIfFailed() -> Bool {
        if status == .fail, let message = message {
            AJMessage.show(title: "", message: message,duration:15.0, status: .error)
            return true
        }
        return false
    }
}
