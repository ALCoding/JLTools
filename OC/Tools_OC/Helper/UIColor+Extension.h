//
//  UIColor+Extension.h
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/20.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 根据十六进制数生成Color

 @param hexValue 十六进制数
 @param alphaValue 透明度
 @return 颜色
 */
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

+ (UIColor*)colorWithHex:(NSInteger)hexValue;


/**
 根据十六进制字符串生成Color

 @param hexColor 十六进制字符串
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexColor alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexColorString:(NSString *)hexColor;


/**
 获取色值(十六进制数)

 @return 色值的十六进制数
 */
- (uint)hex;


/**
 获取色值(十六进制字符串)

 @return 色值的十六进制字符串
 */
- (NSString*)hexString;

@end
