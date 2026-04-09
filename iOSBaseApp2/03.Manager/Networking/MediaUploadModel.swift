//
//  MediaUploadModel.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 27/08/2025.
//


import UIKit


// MARK: - Media Upload
struct MediaUploadModel: Decodable {
    var data = [FileDataModel]()
}


enum MediaType: String, Codable {
    case text = "TEXT"
    case image = "IMAGE"
    case video = "VIDEO"
    case document = "DOCUMENT"
}


// MARK: - File Data Model
struct FileDataModel: Codable {
    var image: UIImage?
    var filePath: URL?
    var mediaType: MediaType?
    var fileUrl: String?

    init(image: UIImage? = nil, filePath: URL? = nil, mediaType: MediaType, fileUrl: String? = nil) {
        self.image = image
        self.filePath = filePath
        self.mediaType = mediaType
        self.fileUrl = fileUrl
    }
    
    private enum CodingKeys: String, CodingKey {
        case imageData = "data"
        case filePath,fileUrl
        case mediaType
    }
    
    // Decoding the object
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let imageData = try container.decodeIfPresent(Data.self, forKey: .imageData) {
            self.image = UIImage(data: imageData)
        }
        self.filePath = try container.decodeIfPresent(URL.self, forKey: .filePath)
        self.fileUrl = try container.decodeIfPresent(String.self, forKey: .fileUrl)
        self.mediaType = try container.decodeIfPresent(MediaType.self, forKey: .mediaType)
    }
    
    // Encoding the object
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let image = self.image {
            try container.encode(image.pngData(), forKey: .imageData)
        }
        try container.encode(filePath, forKey: .filePath)
        try container.encode(fileUrl, forKey: .fileUrl)
        try container.encode(mediaType, forKey: .mediaType)
    }
}
