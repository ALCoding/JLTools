//
//  NSDate+Extension.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/16.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import "NSDate+Extension.h"
#import "NSString+Extension.h"

@implementation NSDate (Extension)

+ (NSString *)distanceTimeWithBeforeTime:(NSTimeInterval)beTime {
    
    NSTimeInterval now = [[NSDate getNowLocalDate] timeIntervalSince1970];
    NSTimeInterval distanceTime = now - beTime;
    
    if (distanceTime < 60) {//小于一分钟
        return @"刚刚";
    }
    if (distanceTime < 60 * 60) {//时间小于一个小时
        return [NSString stringWithFormat:@"%ld分钟前",(long)distanceTime/60];
    }
    
    NSDate *dateNow = [NSDate date];
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    df.timeZone = [[NSTimeZone alloc] initWithName:@"GMT"];
    
    [df setDateFormat:@"HH:mm"];
    NSString * timeStr = [df stringFromDate:beDate];
    
    [df setDateFormat:@"dd"];
    NSString * nowDay = [df stringFromDate:[NSDate date]];
    NSString * lastDay = [df stringFromDate:beDate];
    
    if(distanceTime < 24 * 60 * 60 && [nowDay integerValue] == [lastDay integerValue]){//时间小于一天
        return [NSString stringWithFormat:@"今天 %@",timeStr];
    }
    if(distanceTime < 24 * 60 * 60 * 2 && [nowDay integerValue] != [lastDay integerValue]){
        
        if ([nowDay integerValue] - [lastDay integerValue] ==1 || ([lastDay integerValue] - [nowDay integerValue] > 10 && [nowDay integerValue] == 1)) {
            return [NSString stringWithFormat:@"昨天 %@",timeStr];
        }
        else{
            [df setDateFormat:@"MM-dd HH:mm"];
            return [df stringFromDate:beDate];
        }
        
    }
    
    [df setDateFormat:@"yyyy"];
    NSString * yearStr = [df stringFromDate:beDate];
    NSString *dateNowYearStr = [[NSString stringWithFormat:@"%@", dateNow] substringWithRange:NSMakeRange(0, 4)];
    
    if([yearStr isEqualToString:dateNowYearStr]){ // 是本年
        [df setDateFormat:@"MM-dd HH:mm"];
        return [df stringFromDate:beDate];
    }
    else{ // 不是本年
        [df setDateFormat:@"yyyy-MM-dd"];
        return [df stringFromDate:beDate];
    }
}

- (BOOL)isBetween:(NSString *)startString andEndDate:(NSString *)endString {
    
    NSDate *startDate = [startString converToDate:@"yyyyMMdd"];
    int endStrInt = [endString intValue] + 1;
    NSDate *endDate = [[NSString stringWithFormat:@"%d", endStrInt] converToDate:@"yyyyMMdd"];
    NSDate *date = self;
    
    NSComparisonResult res = [date compare:startDate];
    NSComparisonResult res1 = [date compare:endDate];
    if (res == NSOrderedDescending && res1 == NSOrderedAscending) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isDaytime {
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    calendar.locale = [NSLocale autoupdatingCurrentLocale];
    calendar.timeZone = [NSTimeZone localTimeZone];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitHour;
    
    components = [calendar components:unitFlags fromDate:[NSDate date]];
    
    NSInteger hour = [components hour];
    
    BOOL flag = NO;
    
    if (hour >= 6 && hour <= 17) {
        flag = YES;
    }
    
    return flag;
}

+ (NSDateComponents *)componentsWithDate:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    calendar.locale = [NSLocale autoupdatingCurrentLocale];
    calendar.timeZone = [NSTimeZone localTimeZone];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekOfYear | NSCalendarUnitYearForWeekOfYear fromDate:date];
    
    return components;
}

- (NSString *)convertWithDateFormatter:(NSString *)dateFormatterString {
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = dateFormatterString;
    df.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    
    return [df stringFromDate:self];
}

+ (NSUInteger)intervalDaysFromStart:(NSDate *)startDate end:(NSDate *)endDate {
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned int unitFlags = NSCalendarUnitDay;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:startDate  toDate:endDate  options:0];
    
    return [comps day];
    
//    NSTimeInterval timeInterval = [endDate timeIntervalSinceDate:startDate];
//    int days = ((int)timeInterval) / (3600 * 24);
//    
//    return days;
}

- (NSUInteger)daysOfCurrentMonth {
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    calendar.locale = [NSLocale autoupdatingCurrentLocale];
    calendar.timeZone = [NSTimeZone localTimeZone];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    
    return range.length;
}

+ (NSArray *)dateArrayFromStart:(NSDate *)startDate toEndDate:(NSDate *)endDate {
    
    NSDateComponents * (^componentsFromDate)(NSDate *) = ^NSDateComponents * (NSDate *date) {
        NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
        calendar.locale = [NSLocale autoupdatingCurrentLocale];
        calendar.timeZone = [NSTimeZone localTimeZone];
        return [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    };
    
    NSInteger startYear = componentsFromDate(startDate).year;
    NSInteger endYear = componentsFromDate(endDate).year;
    NSInteger startMonth = componentsFromDate(startDate).month;
    NSInteger endMonth = componentsFromDate(endDate).month;
    NSInteger startDay = componentsFromDate(startDate).day;
    NSInteger endDay = componentsFromDate(endDate).day;
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    if (startYear == endYear) {
        if (startMonth == endMonth) {
            for (NSInteger i = startDay; i <= endDay; i++) {
                NSString *dayStr = [NSString stringWithFormat:@"%ld/%ld", startMonth, i];
                if (startMonth == 1 && i == 1) {
                    dayStr = [NSString stringWithFormat:@"%ld", startYear];
                }
                [arrM addObject:dayStr];
            }
        }
        
        if (startMonth != endMonth) {
            for (NSInteger i = startMonth; i <= endMonth; i++) {
                NSString *monthStr = [NSString stringWithFormat:@"%ld", i];
                NSDate *date = [monthStr converToDate:@"MM"];
                
                if (i == startMonth) {
                    for (NSInteger j = startDay; j <= [startDate daysOfCurrentMonth]; j++) {
                        NSString *dayStr = [NSString stringWithFormat:@"%ld/%ld", startMonth, j];
                        if (i == 1 && j == 1) {
                            dayStr = [NSString stringWithFormat:@"%ld", startYear];
                        }
                        [arrM addObject:dayStr];
                    }
                } else if (i == endMonth) {
                    for (NSInteger j = 1; j <= endDay; j++) {
                        NSString *dayStr = [NSString stringWithFormat:@"%ld/%ld", endMonth, j];
                        [arrM addObject:dayStr];
                    }
                } else {
                    for (NSInteger j = 1; j <= [date daysOfCurrentMonth]; j++) {
                        NSString *dayStr = [NSString stringWithFormat:@"%@/%ld", monthStr, j];
                        [arrM addObject:dayStr];
                    }
                }
            }
        }
    }
    
    if (startYear != endYear) {
        for (NSInteger i = startYear; i <= endYear; i++) {
            if (i == startYear) {
                for (NSInteger j = startMonth; j <= 12; j++) {
                    if (j == startMonth) {
                        for (NSInteger k = startDay; k <= [startDate daysOfCurrentMonth]; k++) {
                            NSString *dayStr = [NSString stringWithFormat:@"%ld/%ld", startMonth, k];
                            if (startMonth == 1 && k == 1) {
                                dayStr = [NSString stringWithFormat:@"%ld", startYear];
                            }
                            [arrM addObject:dayStr];
                        }
                    } else {
                        NSString *monthStr = [NSString stringWithFormat:@"%ld", j];
                        NSDate *date = [monthStr converToDate:@"MM"];
                        for (NSInteger k = 1; k <= [date daysOfCurrentMonth]; k++) {
                            NSString *dayStr = [NSString stringWithFormat:@"%@/%ld", monthStr, k];
                            [arrM addObject:dayStr];
                        }
                    }
                }
            } else if (i == endYear) {
                for (NSInteger j = 1; j <= endMonth; j++) {
                    if (j == endMonth) {
                        for (NSInteger k = 1; k <= endDay; k++) {
                            NSString *dayStr = [NSString stringWithFormat:@"%ld/%ld", endMonth, k];
                            if (j == 1 && k == 1) {
                                dayStr = [NSString stringWithFormat:@"%ld", endYear];
                            }
                            [arrM addObject:dayStr];
                        }
                    } else {
                        NSString *monthStr = [NSString stringWithFormat:@"%ld", j];
                        NSDate *date = [monthStr converToDate:@"MM"];
                        for (NSInteger k = 1; k <= [date daysOfCurrentMonth]; k++) {
                            NSString *dayStr = [NSString stringWithFormat:@"%@/%ld", monthStr, k];
                            [arrM addObject:dayStr];
                        }
                    }
                }
            } else {
                for (NSInteger j = 1; j <= 12; j++) {
                    NSString *dateStr = [NSString stringWithFormat:@"%ld-%ld",  i, j];
                    NSDate *date = [dateStr converToDate:@"yyyy-MM"];
                    for (NSInteger k = 1; k <= [date daysOfCurrentMonth]; k++) {
                        NSString *dayStr = [NSString stringWithFormat:@"%ld/%ld", j, k];
                        if (j == 1 && k == 1) {
                            dayStr = [NSString stringWithFormat:@"%ld", i];
                        }
                        [arrM addObject:dayStr];
                    }
                }
            }
        }
    }
    
    return arrM;
}

+ (NSString *)getCurrentTimeStamp {
    
    NSDate *date = [NSDate getNowLocalDate];
    NSTimeInterval timeStamp = [date timeIntervalSince1970];
    float time = timeStamp * 1000 * 1000;
    
    return [NSString stringWithFormat:@"%.0f", time];
}

- (BOOL)isThisYear {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return dateCmps.year == nowCmps.year;
}

- (BOOL)isYesterday {
    
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    fmt.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    NSDate *date = [fmt dateFromString:dateStr];
    now = [fmt dateFromString:nowStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

- (BOOL)isToday {
    
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    fmt.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}


+ (NSDate *)getNowLocalDate {
    
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    NSTimeInterval interval = [zone secondsFromGMTForDate:date];
    
    return [date dateByAddingTimeInterval:interval];
}

@end
