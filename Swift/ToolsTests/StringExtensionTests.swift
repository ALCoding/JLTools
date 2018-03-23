//
//  StringExtensionTests.swift
//  Tools
//
//  Created by Jalen.He on 2017/7/3.
//  Copyright © 2017年 杨方明. All rights reserved.
//

import XCTest
@testable import Tools

class StringExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        //时间戳转时间字符串
        var timeInterval = 1499096005.36515 //2017-07-03 23:33:25
        var dateString = Date.init(timeIntervalSince1970: timeInterval).toString(style: .defaultStyle)
        var timeString = String.stringWithTimeStamp(timeInterval: timeInterval, format: .defaultStyle)
        XCTAssert(timeString == dateString, "\(timeString) 时间戳转时间字符串失败")
        
        timeInterval = 1499096005365153651536515.36515
        dateString = Date.init(timeIntervalSince1970: timeInterval).toString(style: .defaultStyle)
        timeString = String.stringWithTimeStamp(timeInterval: timeInterval, format: .defaultStyle)
        XCTAssert(timeString == dateString, "\(timeString) 时间戳转时间字符串失败")
        
        timeInterval = 0 //2017-07-03 23:33:25
        dateString = Date.init(timeIntervalSince1970: timeInterval).toString(style: .defaultStyle)
        timeString = String.stringWithTimeStamp(timeInterval: timeInterval, format: .defaultStyle)
        XCTAssert(timeString == dateString, "\(timeString) 时间戳转时间字符串失败")
        
        //字符串转时间
        var date = dateString.convertToDate(style: .defaultStyle)
        var time = timeString.convertToDate(style: .defaultStyle)
        print(date as Any, time as Any)
//        XCTAssert(date == time, "\(date) \(time) 字符串转时间失败")
        
        dateString = "abc"
        date = dateString.convertToDate(style: .defaultStyle)
        timeString = "abc"
        time = timeString.convertToDate(style: .defaultStyle)
//        XCTAssertNil(date, "\(date)")
//        XCTAssertNil(time, "\(time)")
//        XCTAssert(date == time, "\(date) \(time) 字符串转时间失败")
        
        //中文转小写拼音
        var cnStr = "哟嚯嚯"
        var pyStr = cnStr.toPinyin()
        XCTAssert(pyStr == "yohuohuo", "\(pyStr)")
        
        cnStr = ""
        pyStr = cnStr.toPinyin()
        XCTAssert(pyStr.isEmpty, "\(pyStr)")
        
        pyStr = "sixsixsix"
        let no1Letter = pyStr.firstLetterUpper()
        XCTAssert(no1Letter != "#", no1Letter)
        
        //获取文本高度 getStringHeight
        var testText = "kkkkkkkkkkkkkkkkkkkkkkk"
        var strH = testText.getStringHeight(byWidth: 30.0, font: UIFont.systemFont(ofSize: 15))
        XCTAssert(strH > 0, "\(strH)")
        testText = ""
        strH = testText.getStringHeight(byWidth: 30.0, font: UIFont.systemFont(ofSize: 15))
        XCTAssert(strH > 15, "\(strH)")
        
        //获取文本宽度 getStringWidth
        testText = "kkkkkkkkkkkkkkkkkkkkkkk"
        var strW = testText.getStringWidth(height: 30.0, font: UIFont.systemFont(ofSize: 15))
        XCTAssert(strW > 0, "\(strW)")
        testText = ""
        strW = testText.getStringWidth(height: 30.0, font: UIFont.systemFont(ofSize: 15))
        XCTAssert(strW == 0, "\(strW)")
        
        //获取字符串尺寸 getStringSize
        testText = "kkkkkkkkkkkkkkkkkkkkkkk"
        var strSize = testText.getStringSize(withMaxWidth: 30.0, font: UIFont.systemFont(ofSize: 15))
        XCTAssert(strSize.width > 0 && strSize.height > 0, "\(strSize)")
        testText = ""
        strSize = testText.getStringSize(withMaxWidth: 30.0, font: UIFont.systemFont(ofSize: 15))
        XCTAssert(strSize.width == 0 && strSize.height > 15, "\(strSize)")
    }
    
}

















