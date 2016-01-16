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
		XCTAssertEqual(NSTextAlignmentConverter.fromString("NSTextAlignmentLeft"), NSTextAlignment.Left)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("NSTextAlignmentRight"), NSTextAlignment.Right)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("NSTextAlignmentCenter"), NSTextAlignment.Center)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("NSTextAlignmentJustified"), NSTextAlignment.Justified)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("NSTextAlignmentNatural"), NSTextAlignment.Natural)
	}
	
	func testInvalidAlignmentFromString() {
		XCTAssertNil(NSTextAlignmentConverter.fromString("some-alignment"))
	}
    
}
