//
//  UIButton+Extension.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/7/12.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

- (void)leftTitleAndRightImageFits {
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat labelWidth = self.titleLabel.frame.size.width;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
}


- (void)topImageAndBottomTitleFits {
    [self topImageAndBottomTitleFits:6.0];
}


- (void)topImageAndBottomTitleFits:(CGFloat)space {
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    CGFloat totalHeight = (imageSize.height + titleSize.height + space);
    
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (totalHeight - titleSize.height), 0.0);
}

@end
