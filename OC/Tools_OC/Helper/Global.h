//
//  Global.h
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/16.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Global : NSObject


/**
 判断是否为大陆手机号码

 @param phoneNum 号码
 @return 判断结果
 */
- (BOOL)isChinaMobile:(NSString *)phoneNum;

/**
 获取当前APP的Version版本号

 @return APP的Version版本号
 */
+ (NSString *)APP_VERSION;


/**
 获取当前APP的Build版本号

 @return APP的Build版本号
 */
+ (NSString *)APP_BUILD;


/**
 获取iOS系统版本

 @return 系统版本
 */
+ (NSString *)SYSTEM_VERSION;


/**
 获取机型(完整机型对照表https://www.theiphonewiki.com/wiki/Models)

 @return 机型
 */
+ (NSString *)IPHONE_MODEL;

@end
