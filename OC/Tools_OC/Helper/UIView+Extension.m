//
//  UIView+Extension.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/20.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (CGFloat)x {
    return self.frame.origin.x;
}


- (void)setX:(CGFloat)x {
    CGRect f = self.frame;
    f.origin.x = x;
    self.frame = f;
}


- (CGFloat)y {
    return self.frame.origin.y;
}


- (void)setY:(CGFloat)y {
    CGRect f = self.frame;
    f.origin.y = y;
    self.frame = f;
}


- (CGFloat)width {
    return self.frame.size.width;
}


- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height {
    return self.frame.size.height;
}


- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (CGFloat)centerX {
    return self.center.x;
}


- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


- (CGFloat)centerY {
    return self.center.y;
}


- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


- (UIViewController *)getCurrentViewController {
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    
    return nil;
}


- (UIView *)subViewOfClassName:(NSString *)className {
    for (UIView *subView in self.subviews) {
        if (NSStringFromClass(subView.class) == className) {
            return subView;
        }
        
        UIView *resultView = [subView subViewOfClassName: className];
        if (resultView != nil) {
            return resultView;
        }
    }
    return nil;
}

@end
