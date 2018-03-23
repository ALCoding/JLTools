//
//  EncryptionTests.swift
//  Tools
//
//  Created by Jalen.He on 2017/7/3.
//  Copyright © 2017年 杨方明. All rights reserved.
//

import XCTest
@testable import Tools

class EncryptionTests: ToolsTests {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let plainText = "abcdef666666"
        
        //AES256
        var key = "12345678901234567890123456789012"
        
        var encryptData = String.AES256Encrypt(plainText: plainText, key: key)
        var baseEncodedData = String.base64EncodedData(fromData: encryptData)
        XCTAssertNotNil(baseEncodedData, "AES256加密失败")
        
        var baseDecodedData = String.base64DecodedString(fromString: baseEncodedData)
        var decryptData = String.AES256Decrypt(cipherData: baseDecodedData!, key: key)
        var result = String.init(data: decryptData!, encoding: .utf8)!
        XCTAssert(plainText == result, "AES256解密失败")
        
        //AES192
        key = "123456789012345678901234"
        
        encryptData = String.AES192Encrypt(plainText: plainText, key: key)
        baseEncodedData = String.base64EncodedData(fromData: encryptData)
        XCTAssertNotNil(baseEncodedData, "AES192加密失败")
        
        baseDecodedData = String.base64DecodedString(fromString: baseEncodedData)
        decryptData = String.AES192Decrypt(cipherData: baseDecodedData!, key: key)
        result = String.init(data: decryptData!, encoding: .utf8)!
        XCTAssert(plainText == result, "AES192解密失败")
        
        //AES128
        key = "1234567890123456"
        
        encryptData = String.AES128Encrypt(plainText: plainText, key: key)
        baseEncodedData = String.base64EncodedData(fromData: encryptData)
        XCTAssertNotNil(baseEncodedData, "AES128加密失败")
        
        baseDecodedData = String.base64DecodedString(fromString: baseEncodedData)
        decryptData = String.AES128Decrypt(cipherData: baseDecodedData!, key: key)
        result = String.init(data: decryptData!, encoding: .utf8)!
        XCTAssert(plainText == result, "AES128解密失败")
        
        //DES
        key = "12345678"
        
        encryptData = String.DESEncrypt(plainText: plainText, key: key)
        baseEncodedData = String.base64EncodedData(fromData: encryptData)
        XCTAssertNotNil("DES加密失败")
        
        baseDecodedData = String.base64DecodedString(fromString: baseEncodedData)
        decryptData = String.DESDecrypt(cipherData: baseDecodedData!, key: key)
        result = String.init(data: decryptData!, encoding: .utf8)!
        XCTAssert(plainText == result, "DES解密失败")
        
        //MD5
        let md5String = String.MD5String(str: plainText)
        XCTAssertNotNil(md5String, "MD5编码失败")
    }
}
