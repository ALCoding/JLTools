//
//  UIBarButtonItem+Extension.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/7/12.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)


- (instancetype)initWithImage:(UIImage *)image target:(id)target action:(SEL)action {
    
    if ([self init]) {
        self.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.style = UIBarButtonSystemItemDone;
        self.target = target;
        self.action = action;
    }
    return self;
}


- (instancetype)initWithTitle:(NSString *)title tintColor:(UIColor *)tintColor target:(id)target action:(SEL)action {
    
    if ([self init]) {
        self.title = title;
        self.tintColor = tintColor;
        self.style = UIBarButtonSystemItemDone;
        self.target = target;
        self.action = action;
    }
    return self;
}


@end
