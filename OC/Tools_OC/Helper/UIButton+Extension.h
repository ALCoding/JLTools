//
//  UIButton+Extension.h
//  Tools_OC
//
//  Created by Jalen.He on 2017/7/12.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)


/**
 文字图片置换方法 (左title 右image) 在设置title和image之后调用
 */
- (void)leftTitleAndRightImageFits;


/**
 文字图片置换方法 (上image 下title) 在设置title和image之后调用
 */
- (void)topImageAndBottomTitleFits;


/**
 文字图片置换方法 (上image 下title) 在设置title和image之后调用

 @param space title与image之间的空隙
 */
- (void)topImageAndBottomTitleFits:(CGFloat)space;

@end
