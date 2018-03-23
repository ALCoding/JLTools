//
//  Dictionary+Extension.swift
//  Tools
//
//  Created by Jalen.He on 2017/6/20.
//  Copyright © 2017年 杨方明. All rights reserved.
//

import Foundation


extension Dictionary {
    
    /// 字典赋值
    ///
    /// - Parameters:
    ///   - aValue: 键
    ///   - akey: 值
    public mutating func setValue(_ aValue: Value?, forKey akey: Key?) {
        if let key = akey {
            self[key] = aValue
        }
    }
    
}

