//
//  UIView+Extension.h
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/20.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

/**
 获取当前View的控制器对象
 
 @return 控制器对象
 */
- (UIViewController *)getCurrentViewController;

/**
 查找当前view.subViews中符合空间名的控件

 @param className 控件名
 @return 该控件
 */
- (UIView *)subViewOfClassName:(NSString *)className;

@end
