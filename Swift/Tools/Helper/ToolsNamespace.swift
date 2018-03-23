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
    var urt: WrapperType { get set }
    static var urt: WrapperType.Type { get set }
}

public extension NamespaceWrappable {
    var urt: NamespaceWrapper<Self> {
        get {
            return NamespaceWrapper(value: self)
        }
        
        set {
            urt = newValue
        }
    }
    static var urt: NamespaceWrapper<Self>.Type {
        get {
            return NamespaceWrapper.self
        }
        
        set {
            self.urt = newValue
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
