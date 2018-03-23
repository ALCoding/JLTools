//
//  Date+Expand.swift
//  Tools
//
//  Created by 杨方明 on 17/3/15.
//  Copyright © 2017年 杨方明. All rights reserved.
//

import Foundation


extension Date: NamespaceWrappable { }
extension TypeWrapperProtocol where WrappedType == Date {
    
    // MARK: - Date转字符串
    /// Date转字符串
    ///
    /// - Parameter style: 时间格式
    /// - Returns: 转换之后的时间字符串
    public func toString(style: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = style
        
        let dateString: String = dateFormatter.string(from: wrappedValue)
        
        if dateString.isEmpty {
            return ""
        } else {
            return dateString
        }
    }
    
    
    // MARK: - 获取本地日期
    /// 获取本地日期(比服务器时间多出8个小时)
    ///
    /// - Returns: 本地日期
    public static func getNowLocalDate() -> Date {
        let date = Date()
        let zone: TimeZone = TimeZone.current
        let interval: Int = zone.secondsFromGMT(for: date)
        let localDate: Date = date.addingTimeInterval(TimeInterval(interval))
        
        return localDate
    } 
    
    
    // MARK: - 获取相对时间间隔描述
    /// 获取相对时间间隔描述
    ///
    /// - Parameter beforeTimeInterval: 某时刻的时间戳
    /// - Returns: 时间间隔描述
    public static func distanceTime(with beforeTimeInterval: TimeInterval) -> String {
        let nowTimeInterval = Self.getNowLocalDate().timeIntervalSince1970
        let distanceTimeInterval = nowTimeInterval - beforeTimeInterval
        
        // 小于1分钟
        if distanceTimeInterval < 60 * 3 { return "刚刚" }
        // 小于1小时
        if distanceTimeInterval < 60 * 60 { return String(format: "%.0f分钟前", floor(distanceTimeInterval / 60)) }
        
        let beforeDate = Date(timeIntervalSince1970: beforeTimeInterval - 28800)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: beforeDate)
        
        dateFormatter.dateFormat = "dd"
        let nowDate = Self.getNowLocalDate()
        let nowDay = dateFormatter.string(from: nowDate)
        let lastDay = dateFormatter.string(from: beforeDate)
        let nowDayInt = nowDay.jlt.toIntValue()!
        let lastDayInt = lastDay.jlt.toIntValue()!
        
        // 小于1天
        if distanceTimeInterval < 24 * 60 * 60 && nowDayInt == lastDayInt { return "\(timeString)" }
        
        if distanceTimeInterval < 24 * 60 * 60 * 2 && nowDayInt != lastDayInt {
            if nowDayInt - lastDayInt == 1 || (lastDayInt - nowDayInt > 10 && nowDayInt == 1) {
                return "昨天"
            } else {
                dateFormatter.dateFormat = "MM-dd HH:mm"
                return dateFormatter.string(from: beforeDate)
            }
        }
        
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: beforeDate)
        let nowDateYearString = nowDate.jlt.toString(style: DateStyle.defaultStyle.rawValue).jlt[0..<4]
        // 本年内
        if yearString == nowDateYearString {
            dateFormatter.dateFormat = "MM-dd"
            return dateFormatter.string(from: beforeDate)
        } else { // 不是本年
            dateFormatter.dateFormat = "yy-MM-dd"
            return dateFormatter.string(from: beforeDate)
        }
    }
}








