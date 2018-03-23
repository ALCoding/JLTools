//
//  NSDate+Extension.h
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/16.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)


/**
 获取相对时间间隔描述

 @param beTime 某时刻的时间戳
 @return 时间间隔描述
 */
+ (NSString *)distanceTimeWithBeforeTime:(NSTimeInterval)beTime;


/**
 判断某个时间是否在起始时间之内 例: 20170101零点至20170606二十四点

 @param startString 开始日期 20170101
 @param endString 结束日期
 @return 判断结果
 */
- (BOOL)isBetween:(NSString *)startString andEndDate:(NSString *)endString;


/**
 判断当前时间是否为白天（早6点-晚6点）/ 黑夜（晚6点-早6点）改内部参数即可

 @return 判断结果
 */
+ (BOOL)isDaytime;


/**
 根据Date获取相应的时间模型

 @param date 时间
 @return 时间模型
 */
+ (NSDateComponents *)componentsWithDate:(NSDate *)date;


/**
 把日期转换成字符串

 @param dateFormatterString 日期的dateFormatter
 @return 返回的字符串
 */
- (NSString *)convertWithDateFormatter:(NSString *)dateFormatterString;


/**
 返回两个日期之间的天数

 @param startDate 开始日期
 @param endDate 结束日期
 @return 返回的天数
 */
+ (NSUInteger)intervalDaysFromStart:(NSDate *)startDate end:(NSDate *)endDate;


/**
 获取当前月的天数

 @return 当前月的天数
 */
- (NSUInteger)daysOfCurrentMonth;


/**
 根据起始日期返回包含的年月日数组

 @param startDate 开始日期
 @param endDate 结束日期
 @return 返回的日期字符串数组 例: [@"7/6", @"7/5"]
 */
+ (NSArray *)dateArrayFromStart:(NSDate *)startDate toEndDate:(NSDate *)endDate;


/**
 获取时间戳字符串

 @return 返回时间戳字符串
 */
+ (NSString *)getCurrentTimeStamp;


/**
 判断某个时间是否为今年

 @return 结果
 */
- (BOOL)isThisYear;


/**
 判断某个时间是否为昨天

 @return 结果
 */
- (BOOL)isYesterday;


/**
 判断某个时间是否为今天

 @return 结果
 */
- (BOOL)isToday;


/**
 获取本地日期

 @return 本地日期
 */
+ (NSDate *)getNowLocalDate;

@end
