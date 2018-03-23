//
//  UIImage+Extension.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/22.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)


+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


+ (UIImage *)createImageWithColor:(UIColor *)color Rect:(CGRect)rect {
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


+ (UIImage *)cutImageFromImage:(UIImage *)aImage cutRect:(CGRect)cutRect {
    // 裁剪图片
    CGImageRef imageRef = CGImageCreateWithImageInRect([aImage CGImage], cutRect);
    
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef); // 用完一定要释放，否则内存泄露
    
    return image;
}

@end
