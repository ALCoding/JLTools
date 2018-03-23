//
//  UIButton+Extension.swift
//  Tools
//
//  Created by Jalen.He on 2017/7/12.
//  Copyright © 2017年 杨方明. All rights reserved.
//

import Foundation
import UIKit


extension TypeWrapperProtocol where WrappedType: UIButton {
    
    
    // MARK: - 文字图片置换方法 (左title 右image)
    /// 文字图片置换方法 (左title 右image) 在每次设置title和image之后调用
    public func leftTitleAndRightImageFits() {
        let imageWidth = wrappedValue.imageView?.width
        let labelWidth = wrappedValue.titleLabel?.width
        
        if let imageWidth = imageWidth, let labelWidth = labelWidth {
            wrappedValue.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth)
            wrappedValue.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth)
        }
    }
    
    
    // MARK: - 文字图片置换方法 (上image 下title)
    /// 文字图片置换方法 (上image 下title) 在每次设置title和image之后调用
    public func topImageAndBottomTitleFits() {
        self.topImageAndBottomTitleFitsWith(space: 6.0)
    }
    
    
    /// 文字图片置换方法 (上image 下title) 在每次设置title和image之后调用
    ///
    /// - Parameter space: title与image之间的距离
    public func topImageAndBottomTitleFitsWith(space: CGFloat) {
        let imageSize = wrappedValue.imageView?.frame.size
        let titleSize = wrappedValue.titleLabel?.frame.size
        
        if let imageSize = imageSize, let titleSize = titleSize {
            let totalHeight = (imageSize.height + titleSize.height + space)
            
            wrappedValue.titleEdgeInsets = UIEdgeInsetsMake(-(totalHeight - imageSize.height), -imageSize.width, 0, 0)
            wrappedValue.imageEdgeInsets = UIEdgeInsetsMake(titleSize.height, titleSize.width, 0, 0)
        }
    }
}
