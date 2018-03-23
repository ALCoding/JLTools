//
//  StringExtensionTests.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/7/5.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Extension.h"
#import "NSDate+Extension.h"

@interface StringExtensionTests : XCTestCase

@end

@implementation StringExtensionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSDate *nowDate = [NSDate getNowLocalDate];
    NSString *formatter = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateStr = [nowDate convertWithDateFormatter:formatter];
    
    //字符串转时间
    NSDate *converDate = [dateStr converToDate:formatter];
    NSLog(@"---------------\n%@", converDate);
    //字符串转时间时 timeInterval小数点后的值会被省略
//    XCTAssertTrue([nowDate isEqual:converDate], @"%@ %@ 字符串转时间", nowDate, converDate);
    XCTAssertNotNil(converDate, @"%@", converDate);
    
    //时间戳转时间字符串
    NSTimeInterval interval = [nowDate timeIntervalSince1970];
    NSString *converDateStr = [NSString stringWithTimeStamp:interval format:formatter];
    XCTAssertTrue([dateStr isEqualToString:converDateStr], @"%@ %@", dateStr, converDateStr);
    
    //二进制数据转十六进制字符串
    NSString *oriStr = @"aaaaaa";
    NSData *oriData = [oriStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *hexStr = [NSString convertDataToHexStr:oriData];
    XCTAssertNotNil(hexStr, @"%@", hexStr);
    
    //十六进制字符串转二进制数据
    NSData *resultData = [NSString convertHexStrToData:hexStr];
    NSString *resultStr = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    XCTAssertTrue([oriStr isEqualToString:resultStr], @"%@", resultStr);
}













@end
