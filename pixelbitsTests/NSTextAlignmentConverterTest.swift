//
//  NSTextAlignmentConverterTest.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class NSTextAlignmentConverterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testFromString() {
		XCTAssertEqual(NSTextAlignmentConverter.fromString("left"), NSTextAlignment.Left)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("right"), NSTextAlignment.Right)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("center"), NSTextAlignment.Center)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("justified"), NSTextAlignment.Justified)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("natural"), NSTextAlignment.Natural)
	}
    
}
