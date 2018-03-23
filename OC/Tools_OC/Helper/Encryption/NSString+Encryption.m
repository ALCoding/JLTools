//
//  NSString+Encryption.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/28.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import "NSString+Encryption.h"
#import <CommonCrypto/CommonCrypto.h>

typedef NS_ENUM(NSInteger, AESEncryptionType) {
    AES128Type = kCCKeySizeAES128,
    AES192Type = kCCKeySizeAES192,
    AES256Type = kCCKeySizeAES256
};

@implementation NSString (Encryption)

// 向量
const Byte iv[] = {0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f'};

#pragma mark - AES

// 128
+ (NSData *)AES128Encrypt:(NSString *)plainText key:(NSString *)key {
    NSData * encryptData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    return [self AESOperation:kCCEncrypt keySizeType:AES128Type data:encryptData key:key];
}

+ (NSData *)AES128Decrypt:(NSData *)cipherData key:(NSString *)key {
    return [self AESOperation:kCCDecrypt keySizeType:AES128Type data:cipherData key:key];
}

// 192
+ (NSData *)AES192Encrypt:(NSString *)plainText key:(NSString *)key {
    NSData * encryptData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    return [self AESOperation:kCCEncrypt keySizeType:AES192Type data:encryptData key:key];
}

+ (NSData *)AES192Decrypt:(NSData *)cipherData key:(NSString *)key {
    return [self AESOperation:kCCDecrypt keySizeType:AES192Type data:cipherData key:key];
}

// 256
+ (NSData *)AES256Encrypt:(NSString *)plainText key:(NSString *)key {
    NSData * encryptData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    return [self AESOperation:kCCEncrypt keySizeType:AES256Type data:encryptData key:key];
}

+ (NSData *)AES256Decrypt:(NSData *)cipherData key:(NSString *)key {
    return [self AESOperation:kCCDecrypt keySizeType:AES256Type data:cipherData key:key];
}

// Private method
+ (NSData *)AESOperation:(CCOperation)operation keySizeType:(AESEncryptionType)type data:(NSData *)data key:(NSString *)key {
    
    char keyPtr[type + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    size_t bufferSize = [data length] + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptorStatus = CCCrypt(operation, kCCAlgorithmAES128,
                                            kCCOptionPKCS7Padding,
                                            keyPtr, type,
                                            iv,
                                            [data bytes], [data length],
                                            buffer, bufferSize,
                                            &numBytesEncrypted);
    
    if(cryptorStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        free(buffer);
        return data;
    }
    free(buffer);
    
    return nil;
}

#pragma mark - DES

+ (NSData *)DESEncrypt:(NSString *)plainText key:(NSString *)key {
    
    NSData * encryptData = [plainText dataUsingEncoding:NSUTF8StringEncoding];   //明文 转二进制
    return [self DESOperation:kCCEncrypt data:encryptData key:key];
}


+ (NSData *)DESDecrypt:(NSData *)cipherData key:(NSString *)key {
    
    return [self DESOperation:kCCDecrypt data:cipherData key:key];
}

// Private method
+ (NSData *)DESOperation:(CCOperation)operation data:(NSData *)data key:(NSString *)key {
    
    const char *bytes = (const char *)[data bytes];   // 转字符
    size_t dataLength = [data length];    // 获取字符长度
    
    NSData * keyData = [key dataUsingEncoding:NSUTF8StringEncoding]; // 密钥 转二进制
    const char *keyBytes = (const char *)[keyData bytes];   // 密钥 转字符
    //size_t keyDataLength = [keyData length];  // 获取密钥长度(默认kCCKeySizeDES 8位，可以传入获取的长度，前提key只能写前八位)
    
    unsigned char buffer[dataLength + kCCBlockSizeDES]; // 加密缓存大小
    memset(buffer, 0, sizeof(char));    // 给缓存区开辟内存空间
    
    size_t numBytes = 0;   //长度
    CCCryptorStatus cryptStatus = CCCrypt(operation, kCCAlgorithmDES,  // 加密，加密类型DES
                                          kCCOptionPKCS7Padding,    // JAVA方式加密："DES/CBC/PKCS5Padding" 对应OC kCCOptionPKCS7Padding.
                                          keyBytes, kCCKeySizeDES,  // 密钥字符数据，密钥字符长度
                                          iv,  // 向量字符数据
                                          bytes, dataLength,  // 明文字符数据，明文字符长度
                                          buffer, dataLength + kCCBlockSizeDES, //缓存buffer，缓存buffer长度
                                          &numBytes);  // 获取加密后的字符长度
    
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytes];  // 获取加密后的二进制数据
        free(buffer);
        return data;
    }
    
    free(buffer);
    
    return nil;
}

#pragma mark - MD5

+ (NSString *)MD5String:(NSString *)string {
    const char *cStr = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    NSMutableString *md5Str = [[NSMutableString alloc] init];
    for (int i = 0; i < 16; i ++) {
        [md5Str appendString:[NSString stringWithFormat:@"%02x", result[i]]];
    }
    
    return md5Str;
}

#pragma mark - randomNumber

// 取一个8位随机数
+ (long long)random8Numbers {
    return [self randomNumber:10000000 to:100000000];
}


// 取一个随机整数，范围在[from,to），包括from，不包括to
+ (long long)randomNumber:(long long)from to:(long long)to {
    return (long long)(from + arc4random() % (to - from + 1));
}

@end
