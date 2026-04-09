//
//  BaseUseCase.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 22/12/2024.
//

protocol BaseUseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request) async throws -> Response
}

protocol NonReturnBaseUseCase {
    associatedtype Request
    
    func execute(request: Request) async throws
}
