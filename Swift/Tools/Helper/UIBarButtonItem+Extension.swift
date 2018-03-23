//
//  UIBarButtonItem+Extension.swift
//  Tools
//
//  Created by Jalen.He on 2017/7/11.
//  Copyright © 2017年 杨方明. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    // MARK: - 便捷构造方法 简单图片样式
    /// 便捷构造方法 简单图片样式
    ///
    /// - Parameters:
    ///   - image: 图片 Original模式
    ///   - target: 目标
    ///   - action: 方法
    public convenience init(image: UIImage?, target: Any?, action: Selector?) {
        self.init()
        self.image = image?.withRenderingMode(.alwaysOriginal)
        self.style = .done
        self.target = target as AnyObject
        self.action = action
    }
    
    
    // MARK: - 便捷构造方法 简单文字样式
    /// 便捷构造方法 简单文字样式
    ///
    /// - Parameters:
    ///   - title: 文字
    ///   - tinColor: 文字颜色
    ///   - target: 目标
    ///   - action: 方法
    public convenience init(title: String?, tintColor: UIColor?, target: Any?, action: Selector?) {
        self.init()
        self.title = title
        self.tintColor = tintColor
        self.style = .done
        self.target = target as AnyObject
        self.action = action
    }
    
}
