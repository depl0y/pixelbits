//
//  UIControlContentHorizontalAlignmentTest.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class UIControlContentHorizontalAlignmentConverterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testFromString() {
		XCTAssertEqual(UIControlContentHorizontalAlignmentConverter.fromString("content-horizontal-left"), UIControlContentHorizontalAlignment.Left)
		XCTAssertEqual(UIControlContentHorizontalAlignmentConverter.fromString("content-horizontal-right"), UIControlContentHorizontalAlignment.Right)
	}

    
}
