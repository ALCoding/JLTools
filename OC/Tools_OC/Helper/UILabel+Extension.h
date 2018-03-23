//
//  UILabel+Extension.h
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/21.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)


/**
 快速创建Label

 @param text 文本颜色
 @param textColor 文本字号
 @param fontSize 文本
 @return 构造完成后的实例
 */
- (instancetype)initWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize;


/**
 测算Label显示文字所需高度

 @param width 给定宽度
 @param font 字号
 @param lineSpacing 行间距
 @param text 文字
 @return 高度
 */
- (CGFloat)getSpaceLabelHeightWith:(CGFloat)width font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing text:(NSString *)text;

@end
