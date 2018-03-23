//
//  DateExtensionTests.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/7/6.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+Extension.h"

@interface DateExtensionTests : XCTestCase

@end

@implementation DateExtensionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    //获取本地日期
    NSDate *nowDate = [NSDate getNowLocalDate];
    XCTAssertNotNil(nowDate, @"%@", nowDate);
    
    NSTimeInterval nowTimeInterval = [nowDate timeIntervalSince1970];
    
    NSDate *yesterDate = [NSDate dateWithTimeIntervalSince1970:nowTimeInterval - 60 * 60 * 24];
    NSDate *lastYearDate = [NSDate dateWithTimeIntervalSince1970:nowTimeInterval - 60 * 60 * 24 * 400];
    
    //判断某个时间是否为今天
    BOOL isToday = [nowDate isToday];
    XCTAssertTrue(isToday);
    isToday = [yesterDate isToday];
    XCTAssertFalse(isToday);
    
    //判断某个时间是否为昨天
    BOOL isYesterday = [nowDate isYesterday];
    XCTAssertFalse(isYesterday);
    isYesterday = [yesterDate isYesterday];
    XCTAssertTrue(isYesterday);
    
    //判断某个时间是否为今年
    BOOL isThisyear = [nowDate isThisYear];
    XCTAssertTrue(isThisyear);
    isThisyear = [lastYearDate isThisYear];
    XCTAssertFalse(isThisyear);
    
    //获取时间戳字符串
    NSString *currentTimeStamp = [NSDate getCurrentTimeStamp];
    XCTAssertNotNil(currentTimeStamp);
    
    //根据起始日期返回包含的年月日数组
    NSArray *dateAry = [NSDate dateArrayFromStart:yesterDate toEndDate:nowDate];
    XCTAssertNotNil(dateAry);
    XCTAssertTrue(dateAry.count == 2, @"%ld", dateAry.count);
    
    //获取当前月的天数
    NSInteger monthDays = [[NSDate getNowLocalDate] daysOfCurrentMonth];
    XCTAssertTrue(monthDays == 31, @"%ld", monthDays);
    
    //返回两个日期之间的天数
    NSInteger numOfDays = [NSDate intervalDaysFromStart:lastYearDate end:nowDate];
    XCTAssertTrue(numOfDays == 400, @"%ld", numOfDays);
    
    //把日期转换成字符串
    NSString *nowDateStr = [nowDate convertWithDateFormatter:@"yyyy-MM-dd HH:mm"];
    XCTAssertNotNil(nowDateStr, @"%@", nowDateStr); //@"2017-07-06 15:24"
    
    //根据Date获取相应的时间模型
    NSDateComponents *components = [NSDate componentsWithDate:nowDate];
    XCTAssertNotNil(components, @"%@", components);
    
    //判断当前时间是否为白天（早6点-晚6点）
    BOOL isDaytime = [NSDate isDaytime];
    XCTAssert(isDaytime);
    
    //判断某个时间是否在起始时间之内
    BOOL isBetween = [lastYearDate isBetween:@"20170101" andEndDate:@"20170606"];
    XCTAssertFalse(isBetween);
    isBetween = [nowDate isBetween:@"20170606" andEndDate:@"20170707"];
    XCTAssertTrue(isBetween);
    
    //获取相对时间间隔描述
    NSTimeInterval past60sec = nowTimeInterval - 50;
    NSTimeInterval pastMin = nowTimeInterval - 50 * 60;
    NSTimeInterval today = nowTimeInterval - (60 * 60 + 10);
    NSTimeInterval yesterday = nowTimeInterval - (24 * 60 * 60 - 10);
    NSTimeInterval moreThanYest = nowTimeInterval - 24 * 60 * 60 * 3.0;
    NSTimeInterval thisYear = nowTimeInterval - 24 * 60 * 60 * 90.0;
    NSTimeInterval nextYear = nowTimeInterval - 24 * 60 * 60 * 367.0;
    
    NSString *result = [NSDate distanceTimeWithBeforeTime:past60sec];
    XCTAssertTrue([result isEqualToString:@"刚刚"], @"%@", result);
    
    result = [NSDate distanceTimeWithBeforeTime:pastMin];
    XCTAssertTrue([result containsString:@"分钟前"], @"%@", result);
    
    result = [NSDate distanceTimeWithBeforeTime:today];
    XCTAssertTrue([result containsString:@"今天"], @"%@", result);
    
    result = [NSDate distanceTimeWithBeforeTime:yesterday];
    XCTAssertTrue([result containsString:@"昨天"], @"%@", result);
    
    result = [NSDate distanceTimeWithBeforeTime:moreThanYest];
    XCTAssertTrue([result containsString:@"-"], @"%@", result);
    
    result = [NSDate distanceTimeWithBeforeTime:thisYear];
    XCTAssertTrue([result containsString:@"-"], @"%@", result);
    
    result = [NSDate distanceTimeWithBeforeTime:nextYear];
    XCTAssertTrue([result isEqualToString:@"2016-07-04"], @"%@", result);
    
}



@end
