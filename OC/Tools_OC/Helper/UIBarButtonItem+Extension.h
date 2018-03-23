//
//  UIBarButtonItem+Extension.h
//  Tools_OC
//
//  Created by Jalen.He on 2017/7/12.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)


/**
 便捷构造方法 简单图片样式
 
 @param image 图片 Original模式
 @param target 目标
 @param action 方法
 @return 构造完成后的实例
 */
- (instancetype)initWithImage:(UIImage *)image target:(id)target action:(SEL)action;


/**
 便捷构造方法 简单文字样式
 
 @param title 文字
 @param tintColor 文字颜色
 @param target 目标
 @param action 方法
 @return 构造完成后的实例
 */
- (instancetype)initWithTitle:(NSString *)title tintColor:(UIColor *)tintColor target:(id)target action:(SEL)action;

@end
