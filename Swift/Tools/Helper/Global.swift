//
//  Global.swift
//  Tools
//
//  Created by 杨方明 on 17/3/16.
//  Copyright © 2017年 杨方明. All rights reserved.
//
//  全局常量和函数（相当于OC宏）
//

import Foundation
import UIKit
import Darwin


/// 获取当前APP的Version版本号
///
/// - Returns: APP的Version版本号
public func APP_VERSION() -> String {

    let infoDictionary = Bundle.main.infoDictionary!
    return infoDictionary["CFBundleShortVersionString"] as! String

}


/// 获取当前APP的Build版本号
///
/// - Returns: APP的Build版本号
public func APP_BUILD() -> String {
    
    let infoDictionary = Bundle.main.infoDictionary!
    return infoDictionary["CFBundleVersion"] as! String
    
}


/// 获取iOS系统版本
///
/// - Returns: 系统版本
public func SYSTEM_VERSION() -> String {
    return UIDevice.current.systemName + UIDevice.current.systemVersion
}


/// 验证手机号是否合法
///
/// - Parameter number: 手机号
/// - Returns: 验证结果
public func isMobileNumber(number: String) -> Bool {
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    let mobile = "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)"
    let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)"
    let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)"
    let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)"
    let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
    let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
    let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
    let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
    if ((regextestmobile.evaluate(with: number) == true)
        || (regextestcm.evaluate(with: number)  == true)
        || (regextestct.evaluate(with: number) == true)
        || (regextestcu.evaluate(with: number) == true))
    {
        return true
    }
    else
    {
        return false
    }
}


/// 获取机型 (附：完整机型对照表https://www.theiphonewiki.com/wiki/Models)
///
/// - Returns: 机型
public func IPHONE_MODEL() -> String {
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
        guard let value = element.value as? Int8, value != 0 else {
            return identifier
        }
        return identifier + String(UnicodeScalar(UInt8(value)))
    }
    
    switch identifier {
        
        // iPhone
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":
            return "iPhone 4"
        
        case "iPhone4,1":
            return "iPhone 4s"
        
        case "iPhone5,1", "iPhone5,2":
            return "iPhone 5"
            
        case "iPhone5,3", "iPhone5,4":
            return "iPhone 5C"
        
        case "iPhone6,1", "iPhone6,2":
            return "iPhone 5S"
            
        case "iPhone7,1":
            return "iPhone 6 Plus"
            
        case "iPhone7,2":
            return "iPhone 6"
            
        case "iPhone8,1":
            return "iPhone 6s"
            
        case "iPhone8,2":
            return "iPhone 6s Plus"
            
        case "iPhone8,4":
            return "iPhone SE"
            
        case "iPhone9,1", "iPhone9,3":
            return "iPhone 7"
            
        case "iPhone9,2", "iPhone9,4":
            return "iPhone 7 Plus"
        
        case "iPhone10,1", "iPhone10,4":
            return "iPhone 8"
        
        case "iPhone10,2", "iPhone10,5":
            return "iPhone 8 Plus"
        
        case "iPhone10,3", "iPhone10,6":
            return "iPhone X"
        
        // iPod Touch
        case "iPod1,1":
            return "iPod Touch"
        
        case "iPod2,1":
            return "iPod Touch 2"
        
        case "iPod3,1":
            return "iPod Touch 3"
            
        case "iPod4,1":
            return "iPod Touch 4"
            
        case "iPod5,1":
            return "iPod Touch 5"
        
        // iPad
        case "iPad1,1":
            return "iPad"
        
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            return "iPad 2"
        
        case "iPad2,5", "iPad2,6", "iPad2,7":
            return "iPad Mini 1"
        
        case "iPad3,1", "iPad3,2", "iPad3,3":
            return "iPad 3"
        
        case "iPad3,4", "iPad3,5", "iPad3,6":
            return "iPad 4"
        
        case "iPad4,1", "iPad4,2", "iPad4,3":
            return "iPad air"
        
        case "iPad4,4", "iPad4,5", "iPad4,6":
            return "iPad mini 2"
        
        case "iPad4,7", "iPad4,8", "iPad4,9":
            return "iPad mini 3"
        
        case "iPad5,1", "iPad5,2":
            return "iPad mini 4"
        
        case "iPad5,3", "iPad5,4":
            return "iPad air 2"
        
        case "iPad6,7", "iPad6,8":
            return "iPad Pro 12.9-inch"
        
        case "iPad6,3", "iPad6,4":
            return "iPad Pro iPad 9.7-inch"
        
        case "iPad6,10", "iPad6,11":
            return "iPad 5"
        
        case "iPad7,1", "iPad7,2":
            return "iPad Pro 12.9-inch 2"
        
        case "iPad7,3", "iPad7,4":
            return "iPad Pro 10.5-inch"
        
        // 模拟器
        case "x86_64", "iPhone Simulator":
            return "iPhone Simulator"
        
        default:
            return identifier
    }
}



