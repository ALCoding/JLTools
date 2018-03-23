//
//  NSString+Extension.h
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/19.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)


/**
 时间戳转时间字符串

 @param timeInterval 时间戳
 @param formatString 转换的时间格式
 @return 转换完成之后的时间字符串
 */
+ (NSString *)stringWithTimeStamp:(NSTimeInterval)timeInterval format:(NSString *)formatString;


/**
 字符串转时间

 @param format 转换的时间格式
 @return 转换完成之后的时间
 */
- (NSDate *)converToDate:(NSString *)format;


/**
 二进制数据转十六进制字符串

 @param data 需要转换的二进制数据
 @return 十六进制字符串
 */
+ (NSString *)convertDataToHexStr:(NSData *)data;


/**
 十六进制字符串转二进制数据

 @param str 需要转换的十六进制字符串
 @return 二进制数据
 */
+ (NSData *)convertHexStrToData:(NSString *)str;

@end
