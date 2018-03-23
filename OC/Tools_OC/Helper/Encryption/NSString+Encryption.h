//
//  NSString+Encryption.h
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/28.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encryption)

// 注：向量iv直接修改即可，需与后台统一。

#pragma mark - AES

/**
 AES加密 128/192/256

 @param plainText 明文
 @param key 密钥
 @return 加密后的二进制数据
 */
+ (NSData *)AES128Encrypt:(NSString *)plainText key:(NSString *)key;
+ (NSData *)AES192Encrypt:(NSString *)plainText key:(NSString *)key;
+ (NSData *)AES256Encrypt:(NSString *)plainText key:(NSString *)key;


/**
 AES解密 128/192/256

 @param cipherData 密文 二进制数据
 @param key 密钥
 @return 解密后的二进制数据
 */
+ (NSData *)AES128Decrypt:(NSData *)cipherData key:(NSString *)key;
+ (NSData *)AES192Decrypt:(NSData *)cipherData key:(NSString *)key;
+ (NSData *)AES256Decrypt:(NSData *)cipherData key:(NSString *)key;


#pragma mark - DES

/**
 DES加密

 @param plainText 明文
 @param key 密钥
 @return 加密后的二进制数据
 */
+ (NSData *)DESEncrypt:(NSString *)plainText key:(NSString *)key;


/**
 DES解密

 @param cipherData 密文 二进制数据
 @param key 密钥
 @return 解密后的二进制数据
 */
+ (NSData *)DESDecrypt:(NSData *)cipherData key:(NSString *)key;


#pragma mark - MD5

/**
 MD5编码

 @param string 要进行MD5编码的字符串
 @return 进行MD5编码后的字符串
 */
+ (NSString *)MD5String:(NSString *)string;

@end
