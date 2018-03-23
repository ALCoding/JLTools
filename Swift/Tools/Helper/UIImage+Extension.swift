//
//  UIImage+Extension.swift
//  Tools
//
//  Created by Jalen.He on 2017/6/22.
//  Copyright © 2017年 杨方明. All rights reserved.
//

import Foundation
import UIKit

extension UIImage: NamespaceWrappable { }
extension TypeWrapperProtocol where WrappedType: UIImage {
    
    // MARK: - 根据颜色创建图片
    
    /// 根据颜色创建图片
    ///
    /// - Parameter color: 颜色
    /// - Returns: 创建的图片
    public static func createImage(with color: UIColor) -> UIImage? {
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return theImage
    }
    
    
    /// 根据颜色创建图片
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - rect: 范围
    /// - Returns: 创建的图片
    public static func createImage(with color: UIColor, rect: CGRect) -> UIImage? {
        
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return theImage
    }
    
    
    // MARK: - 由图片裁剪出另一张图片
    /// 由图片裁剪出另一张图片
    ///
    /// - Parameters:
    ///   - aImage: 原始图片
    ///   - cutRect: 裁剪范围
    /// - Returns: 裁剪所得的图片
    public static func cutImage(from aImage: UIImage, cutRect: CGRect) -> UIImage? {
        
        let imageRef = aImage.cgImage!.cropping(to: cutRect)
        
        if let image = imageRef {
            return UIImage(cgImage: image)
        } else {
            return nil
        }
    }
}








