//
//  NSString+Extension.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/19.
//  Copyright © 2017年 Jalen. All rights reserved.
//
#import "NSString+Extension.h"

@implementation NSString (Extension)


+ (NSString *)stringWithTimeStamp:(NSTimeInterval)timeInterval format:(NSString *)formatString {
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    df.dateFormat = formatString;
    
    if (timeInterval > 10000000000) {   //毫秒格式13位
        return [df stringFromDate: [NSDate dateWithTimeIntervalSince1970:timeInterval / 1000.0]];
    } else {    //秒格式10位
        return [df stringFromDate: [NSDate dateWithTimeIntervalSince1970:timeInterval]];
    }
}


- (NSDate *)converToDate:(NSString *)format {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.locale = [NSLocale autoupdatingCurrentLocale];
    df.timeZone = [NSTimeZone localTimeZone];
    df.dateFormat = format;
    
    return [df dateFromString: self];
}


+ (NSString *)convertDataToHexStr:(NSData *)data {
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    return string;
}


+ (NSData *)convertHexStrToData:(NSString *)str {
    
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}


@end
