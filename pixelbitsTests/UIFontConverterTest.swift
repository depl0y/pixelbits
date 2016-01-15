//
//  UIFontConverterTest.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class UIFontConverterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testFontFromString() {
		XCTAssertEqual(UIFontConverter.fromString("HelveticaNeue-Light,18"), UIFont(name: "HelveticaNeue-Light", size: 18))
	}
	
	func testFontWithoutSizeFromString() {
		XCTAssertEqual(UIFontConverter.fromString("HelveticaNeue-Light"), UIFont(name: "HelveticaNeue-Light", size: 12))
	}
	
	func testInvalidFontFromString() {
		XCTAssertNil(UIFontConverter.fromString("MyHelveticaTest, 16"))
	}
    
}
