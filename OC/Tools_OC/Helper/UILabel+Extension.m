//
//  UILabel+Extension.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/21.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

- (instancetype)initWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize {
    self = [super init];
    if (self) {
        self.text = text;
        self.textColor = textColor;
        self.font = [UIFont systemFontOfSize:fontSize];
    }
    
    return self;
}

- (CGFloat)getSpaceLabelHeightWith:(CGFloat)width font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing text:(NSString *)text {
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpacing;
    
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:text];
    [attrStrM addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    self.attributedText = attrStrM;
    
    CGRect rect = [attrStrM boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return rect.size.height;
}

@end
