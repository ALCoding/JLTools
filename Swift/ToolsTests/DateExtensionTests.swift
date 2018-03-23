//
//  DateExtensionTests.swift
//  Tools
//
//  Created by Jalen.He on 2017/7/3.
//  Copyright © 2017年 杨方明. All rights reserved.
//

import XCTest
@testable import Tools

class DateExtensionTests: ToolsTests {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let nowDate = Date.getNowLocalDate()
        XCTAssertNotNil(nowDate, "\(nowDate) 获取本地Date失败")
        
        let nowDateString = nowDate.toString(style: .defaultStyle)
        XCTAssert(!nowDateString.isEmpty, "\(nowDateString) Date转字符串失败")
        
        let timeInterval = nowDate.timeIntervalSince1970
        
        let past60sec = timeInterval - 50
        let pastMin = timeInterval - 50 * 60
        let today = timeInterval - (60 * 60 + 10)
        let yesterday = timeInterval - (24 * 60 * 60 - 10)
        let moreThanYest = timeInterval - 24 * 60 * 60 * 3.0
        let thisYear = timeInterval - 24 * 60 * 60 * 90.0
        let nextYear = timeInterval - 24 * 60 * 60 * 367.0
        
        var result = Date.distanceTime(with: past60sec)
        XCTAssert(result == "刚刚", "\(result) 时间间隔计算失败")
        
        result = Date.distanceTime(with: pastMin)
        XCTAssert(result.contains("分钟前"), "\(result) 时间间隔计算失败")
        
        result = Date.distanceTime(with: today)
        XCTAssert(result.contains("今天"), "\(result) 时间间隔计算失败")
        
        result = Date.distanceTime(with: yesterday)
        XCTAssert(result.contains("昨天"), "\(result) 时间间隔计算失败")
        
        result = Date.distanceTime(with: moreThanYest)
        XCTAssert(result.contains("-"), "\(result) 时间间隔计算失败")//
        
        result = Date.distanceTime(with: thisYear)
        XCTAssert(result.contains("-"), "\(result) 时间间隔计算失败")
        
        result = Date.distanceTime(with: nextYear)
//        XCTAssert(result.contains("--"), "时间间隔计算失败")
    }
}
