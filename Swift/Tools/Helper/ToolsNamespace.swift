//
//  ToolsBase.swift
//  Tools
//
//  Created by Jalen.He on 2018/2/11.
//  Copyright © 2018年 Urun. All rights reserved.
//

import Foundation

public protocol NamespaceWrappable {
    associatedtype WrapperType
    var jlt: WrapperType { get set }
    static var jlt: WrapperType.Type { get set }
}

public extension NamespaceWrappable {
    var jlt: NamespaceWrapper<Self> {
        get {
            return NamespaceWrapper(value: self)
        }
        
        set {
            jlt = newValue
        }
    }
    static var jlt: NamespaceWrapper<Self>.Type {
        get {
            return NamespaceWrapper.self
        }
        
        set {
            self.jlt = newValue
        }
    }
}

public protocol TypeWrapperProtocol {
    associatedtype WrappedType
    var wrappedValue: WrappedType { get set }
    init(value: WrappedType)
}

public struct NamespaceWrapper<T>: TypeWrapperProtocol {
    public var wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}
