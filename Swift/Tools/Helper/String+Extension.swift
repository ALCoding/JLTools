//
//  String+Expand.swift
//  Tools
//
//  Created by 杨方明 on 17/3/15.
//  Copyright © 2017年 杨方明. All rights reserved.
//

import Foundation
import UIKit

extension String: NamespaceWrappable { }
extension TypeWrapperProtocol where WrappedType == String {
    
    // MARK: - 时间戳转时间字符串
    /// 时间戳转时间字符串
    ///
    /// - Parameters:
    ///   - timeInterval: 时间戳
    ///   - format: 转换的时间格式
    /// - Returns: 转换完成之后的时间字符串
    public static func stringWithTimeStamp(timeInterval: TimeInterval, format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = format
        
        if timeInterval > 10000000000 { //毫秒格式13位
            return dateFormatter.string(from: Date(timeIntervalSince1970: timeInterval / 1000.0))
        } else { //秒格式10位
            return dateFormatter.string(from: Date(timeIntervalSince1970: timeInterval))
        }
    }
    
    
    // MARK: - 字符串转时间
    /// 字符串转时间
    ///
    /// - Parameter style: 转换的时间格式
    /// - Returns: 转换完成之后的时间
    public func convertToDate(style: String) -> Date? {
        let dateFormatter = DateFormatter.init()
        dateFormatter.locale = Locale.init(identifier: "en_US")
        dateFormatter.dateFormat = style
        
        return dateFormatter.date(from: wrappedValue)
    }
    
    
    // MARK: - 字符串转Int
    /// 字符串转Int
    ///
    /// - Returns: 强转后的值
    public func toIntValue() -> Int? {
        return Int(wrappedValue)
    }
    
    
    // MARK: - 中文转小写拼音(不带音标, 无空格)
    /// 中文转小写拼音(不带音标, 无空格)
    ///
    /// - Returns: 拼音
    public func toPinyin() -> String {
        
        if !wrappedValue.isEmpty {
            let source = NSMutableString(string: wrappedValue) as CFMutableString
            
            if CFStringTransform(source, nil, kCFStringTransformMandarinLatin, false) == true {
                if CFStringTransform(source, nil, kCFStringTransformStripDiacritics, false) == true {
                    
                    var pinyin = (source as NSString).replacingOccurrences(of: " ", with: "") as String
                    pinyin = pinyin.lowercased()
                    
                    return pinyin
                }
            }
        }
        return ""
    }
    
    
    // MARK: - 拼音获取大写首字母
    /// 拼音获取大写首字母
    ///
    /// - Returns: 大写字母
    public func firstLetterUpper() -> String {
        if !wrappedValue.isEmpty {
            let upperStr = wrappedValue.uppercased()
            if upperStr.jlt[0..<1] >= "A" && upperStr.jlt[0..<1] <= "Z" {
                return upperStr.jlt[0..<1]
            } else {
                return "#"
            }
        }
        return "#"
    }
    
    
    // MARK: - 获取文本高度
    /// 获取文本高度
    ///
    /// - Parameters:
    ///   - width: 给定宽度
    ///   - font: 字号
    /// - Returns: 测算高度
    public func getStringHeight(byWidth width: Float, font: UIFont) -> CGFloat {
        let rect: CGRect = wrappedValue.boundingRect(with: CGSize(width: Double(width),height: Double(MAXFLOAT)), options: [.usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return rect.height
    }
    
    
    // MARK: - 获取文本宽度
    /// 获取文本宽度
    ///
    /// - Parameters:
    ///   - height: 给定高度
    ///   - font: 字号
    /// - Returns: 测算宽度
    public func getStringWidth(height: CGFloat, font: UIFont) -> CGFloat {
        let rect: CGRect = wrappedValue.boundingRect(with: CGSize(width: Double(MAXFLOAT), height: Double(height)), options: [.usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return rect.width
    }
    
    
    // MARK: - 获取字符串尺寸
    /// 获取字符串尺寸
    ///
    /// - Parameters:
    ///   - str: 要测算的字符串
    ///   - font: 字号
    ///   - maxWidth: 最大宽度
    /// - Returns: 测算宽高
    public func getStringSize(withMaxWidth maxWidth: CGFloat, font: UIFont) -> CGSize {
        let attribute: [NSAttributedStringKey: UIFont] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): font]
        let size = wrappedValue.boundingRect(with: CGSize(width: maxWidth,height: 0), options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: attribute, context: nil).size
        
        return size
    }
    
    
    // MARK: - 通过下标Range截取字符串
    /// 通过下标Range截取字符串
    ///
    /// - Parameter r: 截取范围
    public subscript (r: Range<Int>) -> String {
        get {
            let startIndex = wrappedValue.index(wrappedValue.startIndex, offsetBy: r.lowerBound)
            let endIndex = wrappedValue.index(wrappedValue.startIndex, offsetBy: r.upperBound)
            
            return String(wrappedValue[startIndex..<endIndex])
        }
    }
}
