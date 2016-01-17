//
//  UIEdgeInsetsConverterTest.swift
//  pixelbits
//
//  Created by Wim Haanstra on 17/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class UIEdgeInsetsConverterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSingleValueInset() {

		XCTAssertEqual(UIEdgeInsetsConverter.fromString("insets(4)"), NSValue(UIEdgeInsets: UIEdgeInsetsMake(4, 4, 4, 4)))
		XCTAssertEqual(UIEdgeInsetsConverter.fromString("insets(4.25)"), NSValue(UIEdgeInsets: UIEdgeInsetsMake(4.25, 4.25, 4.25, 4.25)))
		
    }

	func testDoubleValueInset() {
		XCTAssertEqual(UIEdgeInsetsConverter.fromString("insets(4, 5)"), NSValue(UIEdgeInsets: UIEdgeInsetsMake(4, 5, 4, 5)))
		XCTAssertEqual(UIEdgeInsetsConverter.fromString("insets(4.25, 2.5)"), NSValue(UIEdgeInsets: UIEdgeInsetsMake(4.25, 2.5, 4.25, 2.5)))
	}
	
	func testFullInset() {
		XCTAssertEqual(UIEdgeInsetsConverter.fromString("insets(4, 5,6, 7)"), NSValue(UIEdgeInsets: UIEdgeInsetsMake(4, 5, 6, 7)))
		XCTAssertEqual(UIEdgeInsetsConverter.fromString("insets(4.25, 5.30,6.4, 7.5)"), NSValue(UIEdgeInsets: UIEdgeInsetsMake(4.25, 5.3, 6.4, 7.5)))
	}
	
	func testInvalidInsets() {
		XCTAssertNil(UIEdgeInsetsConverter.fromString("insets(stringvalue)"))
		XCTAssertNil(UIEdgeInsetsConverter.fromString("insets(4,stringvalue)"))
		XCTAssertNil(UIEdgeInsetsConverter.fromString("insets(4,4,4)"))
		XCTAssertNil(UIEdgeInsetsConverter.fromString("insets(4,stringvalue,4)"))
		
	}
    
}
