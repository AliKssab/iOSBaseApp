////
////  NetworkManager.swift
////  AseerAlKotobSwiftUI
////
////  Created by khaled on 6/14/25.
////
//
//
//import Alamofire
//import Foundation
//
//class NetworkManager {
//    
//    static func perform<T: Decodable>(
//        _ request: APIRequestEntity,
//        decodeTo type: T.Type
//    ) async throws -> T {
//        LoadingState.shared.show()
//
//        
//        return try await withCheckedThrowingContinuation { continuation in
//
//            guard let url = URL(string: request.url) else {
//                continuation.resume(throwing: NetworkError.invalidURL)
//                return
//            }
//            
//            var urlRequest = URLRequest(url: url)
//            urlRequest.method = request.method
//            urlRequest.headers = request.headers
//            
//            if let body = request.bodyData {
//                urlRequest.httpBody = body
//            }
//            
//            // Log
//            logRequest(urlRequest, request: request)
//            
//            AF.request(urlRequest)
//                .validate(statusCode: 200..<600)
////                .responseDecodable(of: BaseResponseEntity<T>.self) { response in
////                    
////                    defer { LoadingState.shared.hide() }
////                    
////                    logResponse(response)
////                    
////                    if let statusCode = response.response?.statusCode, statusCode == 401 {
////                        continuation.resume(throwing: NetworkError.unauthorized)
////                        return
////                    }
////                    
////                    switch response.result {
////                    case .success(let model):
////                        
////                        if model.alertIfFailed() {
////                            continuation.resume(
////                                throwing: NetworkError.noData(message: model.message)
////                            )
////                            return
////                        }
////                        
////                        if model.status == .success, let data = model.data {
////                            continuation.resume(returning: data)
////                            return
////                        }
////                        
////                        if model.status == .success, model.data == nil {
////                            
////                            do {
////                                let emptyJSON = "{}".data(using: .utf8)!
////                                let emptyObject = try JSONDecoder().decode(T.self, from: emptyJSON)
////                                continuation.resume(returning: emptyObject)
////                                return
////                            } catch {
////                                continuation.resume(
////                                    throwing: NetworkError.noData(message: model.message)
////                                )
////                                return
////                            }
////                        }
////                        
////                        continuation.resume(
////                            throwing: NetworkError.noData(message: model.message)
////                        )
////                        
////                    case .failure(let error):
////                        continuation.resume(throwing: error)
////                    }
////                }
//        }
//    }
//  
// 
//    // MARK: - Logging
//    
//    private static func logRequest(_ urlRequest: URLRequest, request: APIRequestEntity) {
//        print("\n📤 [REQUEST]")
//        print("➡️ URL     : \(request.url)")
//        print("➡️ METHOD  : \(request.endpoint.method.rawValue)")
//        print("➡️ HEADERS : \(request.headers)")
//        
//        if let body = request.bodyData,
//           let json = try? JSONSerialization.jsonObject(with: body, options: .mutableContainers),
//           let prettyBody = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
//           let bodyString = String(data: prettyBody, encoding: .utf8) {
//            print("➡️ BODY    : \(bodyString)")
//        } else {
//            print("➡️ BODY    : nil")
//        }
//    }
//    
//    private static func logResponse<T: Decodable>(_ response: AFDataResponse<BaseResponseEntity<T>>) {
//        print("\n📥 [RESPONSE]")
//        if let url = response.request?.url {
//            print("⬅️ URL     : \(url.absoluteString)")
//        }
//        
//        if let data = response.data,
//           let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
//           let prettyData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
//           let jsonString = String(data: prettyData, encoding: .utf8) {
//            print("⬅️ BODY    : \(jsonString)")
//        } else {
//            print("⬅️ BODY    : Unable to decode response data")
//        }
//    }
//}
//
//extension NetworkManager {
//    
//    static func performUpload<T: Encodable, U: Decodable>(
//        _ request: APIRequestEntity,
//        parameters: T,
//        decodeTo type: U.Type
//    ) async throws -> U {
//        
//        LoadingState.shared.show()
//        
//        return try await withCheckedThrowingContinuation { continuation in
//            
//            guard let url = URL(string: request.url) else {
//                continuation.resume(throwing: NetworkError.invalidURL)
//                return
//            }
//            
//            // ✅ Log Request
//            print("\n📤 [UPLOAD REQUEST]")
//            print("➡️ URL     : \(url.absoluteString)")
//            print("➡️ METHOD  : \(request.method.rawValue)")
//            print("➡️ HEADERS : \(request.headers)")
//            
//            AF.upload(
//                multipartFormData: parameters.toMultipartFormData(),
//                to: url,
//                method: request.method,
//                headers: request.headers
//            )
//            .validate(statusCode: 200..<600)
////            .responseDecodable(of: BaseResponseEntity<U>.self) { response in
////                
////                defer { DispatchQueue.main.async { LoadingState.shared.hide() } }
////                
////                // ✅ Log Response
////                logResponse(response)
////                
////                if let statusCode = response.response?.statusCode, statusCode == 401 {
////                    continuation.resume(throwing: NetworkError.unauthorized)
////                    return
////                }
////                
////                switch response.result {
////                case .success(let model):
////                    if model.alertIfFailed() {
////                        continuation.resume(throwing: NetworkError.noData(message: model.message))
////                        return
////                    }
////                    
////                    if model.status == .success {
////                        if let data = model.data {
////                            continuation.resume(returning: data)
////                        } else {
////                            continuation.resume(throwing: NetworkError.noData(message: model.message))
////                        }
////                    } else {
////                        continuation.resume(throwing: NetworkError.noData(message: model.message))
////                    }
////                    
////                case .failure(let error):
////                    print("❌ Upload Error: \(error.localizedDescription)")
////                    continuation.resume(throwing: error)
////                }
////            }
//        }
//    }
//}
//
// import Alamofire
//
//extension HTTPHeaders {
//    func removing(name: String) -> HTTPHeaders {
//        var copy = self
//        copy.remove(name: name)
//        return copy
//    }
//}
//
//extension NetworkManager {
//
//    static func uploadImage<U: Decodable>(
//        _ request: APIRequestEntity,
//        imageData: Data,
//        fileName: String = "profile.jpg",
//        mimeType: String = "image/jpeg",
//        decodeTo type: U.Type
//    ) async throws -> U {
//
//        LoadingState.shared.show()
//
//        return try await withCheckedThrowingContinuation { continuation in
//
//            guard let url = URL(string: request.url) else {
//                continuation.resume(throwing: NetworkError.invalidURL)
//                return
//            }
//
//            // مهم: متحطش Content-Type بنفسك
//            let headers = request.headers.removing(name: "Content-Type")
//
//            AF.upload(
//                multipartFormData: { form in
//                    // ✅ لازم نفس key اللي في Postman
//                    form.append(imageData, withName: "image", fileName: fileName, mimeType: mimeType)
//                },
//                to: url,
//                method: request.method,
//                headers: headers
//            )
//            .validate(statusCode: 200..<600)
////            .responseDecodable(of: BaseResponseEntity<U>.self) { response in
////
////                defer { DispatchQueue.main.async { LoadingState.shared.hide() } }
////
////                logResponse(response)
////
////                if response.response?.statusCode == 401 {
////                    continuation.resume(throwing: NetworkError.unauthorized)
////                    return
////                }
////
////                switch response.result {
////                case .success(let model):
////                    if model.alertIfFailed() {
////                        continuation.resume(throwing: NetworkError.noData(message: model.message))
////                        return
////                    }
////
////                    if model.status == .success, let data = model.data {
////                        continuation.resume(returning: data)
////                    } else {
////                        continuation.resume(throwing: NetworkError.noData(message: model.message))
////                    }
////
////                case .failure(let error):
////                    continuation.resume(throwing: error)
////                }
////            }
//        }
//    }
//}
//extension NetworkManager {
//
//    static func uploadAttachments<U: Decodable>(
//        _ request: APIRequestEntity,
//        body: AttachmentsRequestEntity,
//        decodeTo type: U.Type
//    ) async throws -> U {
//
//        LoadingState.shared.show()
//
//        return try await withCheckedThrowingContinuation { continuation in
//
//            guard let url = URL(string: request.url) else {
//                continuation.resume(throwing: NetworkError.invalidURL)
//                return
//            }
//
//            // مهم: سيب Alamofire يحط Content-Type بتاع multipart
//            let headers = request.headers.removing(name: "Content-Type")
//
//            print("\n📤 [ATTACHMENTS UPLOAD]")
//            print("➡️ URL     : \(url.absoluteString)")
//            print("➡️ METHOD  : \(request.method.rawValue)")
//            print("➡️ HEADERS : \(headers)")
//
//            AF.upload(
//                multipartFormData: { form in
//                    // لو عندك حقول تانية في المستقبل (attachment_type, model...) هتضيفها هنا
//
//                    for file in body.files {
//                        form.append(
//                            file.data,
//                            withName: body.formKey,          // ✅ "file" أو "files"
//                            fileName: file.fileName,
//                            mimeType: file.mimeType
//                        )
//                    }
//                },
//                to: url,
//                method: request.method,
//                headers: headers
//            )
//            .validate(statusCode: 200..<600)
////            .responseDecodable(of: BaseResponseEntity<U>.self) { response in
////
////                defer { DispatchQueue.main.async { LoadingState.shared.hide() } }
////
////                logResponse(response)
////
////                if response.response?.statusCode == 401 {
////                    continuation.resume(throwing: NetworkError.unauthorized)
////                    return
////                }
////
////                switch response.result {
////                case .success(let model):
////                    if model.alertIfFailed() {
////                        continuation.resume(throwing: NetworkError.noData(message: model.message))
////                        return
////                    }
////
////                    if model.status == .success, let data = model.data {
////                        continuation.resume(returning: data)
////                    } else {
////                        continuation.resume(throwing: NetworkError.noData(message: model.message))
////                    }
////
////                case .failure(let error):
////                    continuation.resume(throwing: error)
////                }
////            }
//        }
//    }
//    
//    static func performMultipart<T: Decodable>(
//        _ request: APIRequestEntity,
//        textParameters: [String: String],
//        files: [(data: Data, name: String, fileName: String, mimeType: String)],
//        decodeTo type: T.Type
//    ) async throws -> T {
//
//        LoadingState.shared.show()
//
//        return try await withCheckedThrowingContinuation { continuation in
//
//            guard let url = URL(string: request.url) else {
//                print("❌ Invalid URL: \(request.url)")
//                continuation.resume(throwing: NetworkError.invalidURL)
//                return
//            }
//
//            let headers = request.headers.removing(name: "Content-Type")
//
//            print("\n📤 [MULTIPART REQUEST]")
//            print("➡️ URL     : \(url.absoluteString)")
//            print("➡️ METHOD  : \(request.method.rawValue)")
//            print("➡️ HEADERS : \(headers)")
//            print("➡️ TEXT PARAMS : \(textParameters)")
//            print("➡️ FILES : \(files.map { $0.fileName })")
//
//            AF.upload(
//                multipartFormData: { form in
//
//                    // ✅ النصوص
//                    for (key, value) in textParameters {
//                        print("✏️ Adding text param: \(key) = \(value)")
//                        form.append(Data(value.utf8), withName: key)
//                    }
//
//                    // ✅ الملفات
//                    for file in files {
//                        print("🖼 Adding file: \(file.fileName) as \(file.name) (\(file.mimeType))")
//                        form.append(
//                            file.data,
//                            withName: file.name,
//                            fileName: file.fileName,
//                            mimeType: file.mimeType
//                        )
//                    }
//                },
//                to: url,
//                method: request.method,
//                headers: headers
//            )
//            .validate(statusCode: 200..<600)
////            .responseDecodable(of: BaseResponseEntity<T>.self) { response in
////
////                defer { LoadingState.shared.hide() }
////
////                // Log response
////                if let statusCode = response.response?.statusCode {
////                    print("📥 Status Code: \(statusCode)")
////                }
////
////                if let data = response.data,
////                   let str = String(data: data, encoding: .utf8) {
////                    print("📥 Response Data: \(str)")
////                } else {
////                    print("📥 Response Data: nil")
////                }
////                switch response.result {
////                case .success(let model):
////                    // ✅ أول حاجة نتأكد من الفشل من السيرفر
////                    if model.alertIfFailed() {
////                        continuation.resume(
////                            throwing: NetworkError.noData(message: model.message)
////                        )
////                        return
////                    }
////
////                    // بعد كده نتعامل مع البيانات لو موجودة
////                    if let data = model.data {
////                        continuation.resume(returning: data)
////                    } else {
////                        print("⚠️ No data in response")
////                        continuation.resume(throwing: NetworkError.noData(message: model.message))
////                    }
////                case .failure(let error):
////                    print("❌ Multipart upload error: \(error.localizedDescription)")
////                    continuation.resume(throwing: error)
////                }
////
////             }
//        }
//    }
//}
// 
//struct AttachmentsRequestEntityNew {
//
//    /// files with their own keys
//    let files: [(key: String, file: UploadFileItemEntity)]
//
//    /// text parameters
//    let parameters: [String: String]
//
//    init(
//        files: [(key: String, file: UploadFileItemEntity)] = [],
//        parameters: [String: String] = [:]
//    ) {
//        self.files = files
//        self.parameters = parameters
//    }
//}
//
//
//struct AttachmentsRequestEntity {
//    let files: [UploadFileItemEntity]
//    let formKey: String
//
//    static func single(_ file: UploadFileItemEntity) -> AttachmentsRequestEntity {
//        .init(files: [file], formKey: "file")
//    }
//
//    static func multiple(_ files: [UploadFileItemEntity]) -> AttachmentsRequestEntity {
//        .init(files: files, formKey: "files")
//    }
//}
//import Foundation
//
//struct UploadFileItemEntity {
//    let data: Data
//    let fileName: String
//    let mimeType: String
//}
//
import Foundation
import Alamofire

final class NetworkManager {
    
    static func perform<T: Decodable>(_ requestEntity: APIRequestEntity, decodeTo type: T.Type) async throws -> T {
        
        guard let url = URL(string: requestEntity.url) else {
            print("❌ Invalid URL: \(requestEntity.url)")
            throw NetworkError.invalidURL
        }
        
        let headers = requestEntity.headers
        let bodyData = requestEntity.bodyData
        
        print("🌐 Network Request Started")
        print("URL: \(url.absoluteString)")
        print("Method: \(requestEntity.method.rawValue)")
        print("Headers: \(headers)")
        if let bodyData = bodyData, let bodyString = String(data: bodyData, encoding: .utf8) {
            print("Body: \(bodyString)")
        } else {
            print("No Body")
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                url,
                method: requestEntity.method,
                parameters: nil, // لا نستخدم parameters هنا لأنه عندنا bodyData أو query في URL
                encoding: bodyData != nil ? JSONEncoding.default : URLEncoding.default,
                headers: headers
            )
            .validate(statusCode: 200...299)
            .responseData { response in
                
                print("📩 Response Received")
                print("Status Code: \(response.response?.statusCode ?? -1)")
                
                switch response.result {
                case .success(let data):
                    print("✅ Success with Data:")
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print(jsonString)
                    } else {
                        print("⚠️ Could not convert data to string")
                    }
                    do {
                        let decoded = try JSONDecoder().decode(T.self, from: data)
                        continuation.resume(returning: decoded)
                    } catch {
                        print("❌ Decoding Error: \(error.localizedDescription)")
                        continuation.resume(throwing: NetworkError.noData(message: error.localizedDescription))
                    }
                    
                case .failure(let error):
                    print("❌ Network Error: \(error.localizedDescription)")
                    if let data = response.data, let jsonString = String(data: data, encoding: .utf8) {
                        print("Response Data: \(jsonString)")
                    }
                    continuation.resume(throwing: NetworkError.serverError(message: error.localizedDescription))
                }
            }
        }
    }
}
