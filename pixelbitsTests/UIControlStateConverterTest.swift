//
//  UIControlStateTest.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class UIControlStateConverterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	
	func testFromString() {
		XCTAssertEqual(UIControlStateConverter.fromString("normal"), UIControlState.Normal)
		XCTAssertEqual(UIControlStateConverter.fromString("highlighted"), UIControlState.Highlighted)
		XCTAssertEqual(UIControlStateConverter.fromString("unknown-state"), UIControlState.Normal)
	}
    
}
