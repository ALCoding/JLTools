//
//  EncryptionTests.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/7/5.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Encryption.h"
#import "GTMBase64.h"

@interface EncryptionTests : XCTestCase

@end

@implementation EncryptionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSString *plainText = @"abcdef666666";
    
    //AES256
    NSString *key = @"12345678901234567890123456789012";
    
    NSData *encryptData = [NSString AES256Encrypt:plainText key:key];
    NSString *baseEncodedString = [GTMBase64 stringByEncodingData:encryptData];
    XCTAssertNotNil(baseEncodedString, @"%@ AES256加密失败", baseEncodedString);
    
    NSData *baseDecodedData = [GTMBase64 decodeString:baseEncodedString];
    NSData *decryptData = [NSString AES256Decrypt:baseDecodedData key:key];
    NSString *result = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    XCTAssert([plainText isEqualToString:result], @"%@ AES256解密失败", result);
    
    //AES192
    key = @"123456789012345678901234";
    
    encryptData = [NSString AES192Encrypt:plainText key:key];
    baseEncodedString = [GTMBase64 stringByEncodingData:encryptData];
    XCTAssertNotNil(baseEncodedString, @"%@ AES192加密失败", baseEncodedString);
    
    baseDecodedData = [GTMBase64 decodeString:baseEncodedString];
    decryptData = [NSString AES192Decrypt:baseDecodedData key:key];
    result = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    XCTAssert([plainText isEqualToString:result], @"%@ AES192解密失败", result);
    
    //AES128
    key = @"1234567890123456";
    
    encryptData = [NSString AES128Encrypt:plainText key:key];
    baseEncodedString = [GTMBase64 stringByEncodingData:encryptData];
    XCTAssertNotNil(baseEncodedString, @"%@ AES192加密失败", baseEncodedString);
    
    baseDecodedData = [GTMBase64 decodeString:baseEncodedString];
    decryptData = [NSString AES128Decrypt:baseDecodedData key:key];
    result = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    XCTAssert([plainText isEqualToString:result], @"%@ AES128解密失败", result);
    
    //DES
    key = @"12345678";
    
    encryptData = [NSString DESEncrypt:plainText key:key];
    baseEncodedString = [GTMBase64 stringByEncodingData:encryptData];
    XCTAssertNotNil(@"DES加密失败");
    
    baseDecodedData = [GTMBase64 decodeString:baseEncodedString];
    decryptData = [NSString DESDecrypt:baseDecodedData key:key];
    result = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    XCTAssert([plainText isEqualToString:result], @"%@ DES解密失败", result);
    
    //MD5
    NSString *md5Str = [NSString MD5String:plainText];
    XCTAssertNotNil(md5Str, @"%@ MD5编码失败", md5Str);
}

@end
