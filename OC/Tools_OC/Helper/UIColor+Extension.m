//
//  UIColor+Extension.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/20.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)colorWithHexColorString:(NSString *)hexColor {
    unsigned int red, green, blue;
    NSRange range;
    range.length =2;
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location = 6;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:1.0f];
}


+ (UIColor *)colorWithHexColorString:(NSString *)hexColor alpha:(CGFloat)alpha {
    unsigned int red, green, blue;
    NSRange range;
    range.length =2;
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location = 6;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:alpha];
}


+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}


+ (UIColor*)colorWithHex:(NSInteger)hexValue {
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

- (uint)hex {
    CGFloat red, green, blue, alpha;
    if (![self getRed:&red green:&green blue:&blue alpha:&alpha]) {
        [self getWhite:&red alpha:&alpha];
        green = red;
        blue = red;
    }
    
    red = roundf(red * 255.f);
    green = roundf(green * 255.f);
    blue = roundf(blue * 255.f);
    alpha = roundf(alpha * 255.f);
    
    return ((uint)alpha << 24) | ((uint)red << 16) | ((uint)green << 8) | ((uint)blue);
}


- (NSString*)hexString {
    return [NSString stringWithFormat:@"0x%08x", [self hex]];
}

@end
