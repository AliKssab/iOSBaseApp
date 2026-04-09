//
//  DIInjected.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled on 6/8/25.
//

import Factory

@propertyWrapper
public struct DIInjected<T> {
    public var wrappedValue: T

    public init(_ keyPath: KeyPath<Container, Factory<T>>) {
        self.wrappedValue = Container.shared[keyPath: keyPath]()
    }
}
