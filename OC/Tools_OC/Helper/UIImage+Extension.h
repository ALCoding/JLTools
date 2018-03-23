//
//  UIImage+Extension.h
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/22.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)


/**
 根据颜色创建图片

 @param color 颜色
 @return 创建的图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;


/**
 根据颜色创建图片

 @param color 颜色
 @param rect 范围
 @return 创建的图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color Rect:(CGRect)rect;


/**
 由图片裁剪出另一张图片

 @param aImage 原始图片
 @param cutRect 裁剪范围
 @return 裁剪所得的图片
 */
+ (UIImage *)cutImageFromImage:(UIImage *)aImage cutRect:(CGRect)cutRect;

@end
