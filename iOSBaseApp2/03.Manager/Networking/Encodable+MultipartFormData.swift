//
//  Encodable+MultipartFormData.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 27/08/2025.
//

import Foundation
import Alamofire
  import UIKit

extension Encodable {
    
    func toJSON() -> Data{
        return try! JSONEncoder().encode(self)
    }
    
    func unwrapValue(_ value: Any?) -> String? {
        guard let unwrappedValue = value else { return nil }

        if let stringValue = unwrappedValue as? String {
            return stringValue
        } else if let intValue = unwrappedValue as? Int {
            return "\(intValue)"
        } else if let doubleValue = unwrappedValue as? Double {
            return "\(doubleValue)"
        } else if let boolValue = unwrappedValue as? Bool {
            return "\(boolValue)"
        } else {
            print("Unsupported type: \(type(of: unwrappedValue))")
            return nil
        }
    }
    
    
    func toMultipartFormData() -> MultipartFormData{
        let formData = MultipartFormData()
        for (key, value) in enumerateProperties() {
               if let mediaArray = value as? [FileDataModel] {
                   for (index, media) in mediaArray.enumerated() {
                       handleFileDataModel(media, withKey: "\(key.camelCaseToSnakeCase())[\(index)]", formData: formData)
                   }
               }else if let media = value as? FileDataModel {
                    handleFileDataModel(media, withKey: "\(key.camelCaseToSnakeCase())", formData: formData)
               }else if let unwrappedString = unwrapValue(value) {
                   if #available(iOS 15.4, *) {
                       formData.append(unwrappedString.data(using: .utf8)!, withName: key.camelCaseToSnakeCase())
                   } 
               } else {
                   //print("Unsupported type or nil value for key \(key)")
               }
           }
        
        return formData
    }
    
    func enumerateProperties() -> [String:Any?]{
        let mirror = Mirror(reflecting: self)
        var dict = [String:Any?]()
        for (label, value) in mirror.children {
            guard let label = label else { continue }
            dict[label] = value
        }
        return dict
    }
    
    private func handleFileDataModel(_ media: FileDataModel, withKey key: String, formData: MultipartFormData) {
        //IMAGE
        if let image = media.image {
            if let imageData = image.jpegData(compressionQuality: 0.5) {
                formData.append(imageData, withName: "\(key)", fileName: "file.jpg", mimeType: "image/jpg")
            }
        }
        
        //FILE
        if let filePath = media.filePath {
            do {
                let fileData = try Data(contentsOf: filePath)
                formData.append(fileData, withName: "\(key)", fileName: filePath.lastPathComponent, mimeType: media.mediaType?.rawValue ?? "application/octet-stream")
            } catch {
                print("Error reading file at \(filePath): \(error)")
            }
        }
    }
    
}
