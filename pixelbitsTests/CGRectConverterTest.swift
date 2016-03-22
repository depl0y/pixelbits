//
//  CGRectConverterTest.swift
//  pixelbits
//
//  Created by Wim Haanstra on 18/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class CGRectConverterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testSingleValue() {
		
		XCTAssertEqual(CGRectConverter.fromString("rect(4)"), NSValue(CGRect: CGRectMake(4, 4, 4, 4)))
		XCTAssertEqual(CGRectConverter.fromString("rect(4.25)"), NSValue(CGRect: CGRectMake(4.25, 4.25, 4.25, 4.25)))
		
	}
	
	func testDoubleValue() {
		XCTAssertEqual(CGRectConverter.fromString("rect(4, 5)"), NSValue(CGRect: CGRectMake(4, 5, 4, 5)))
		XCTAssertEqual(CGRectConverter.fromString("rect(4.25, 2.5)"), NSValue(CGRect: CGRectMake(4.25, 2.5, 4.25, 2.5)))
	}
	
	func testFull() {
		XCTAssertEqual(CGRectConverter.fromString("rect(4, 5,6, 7)"), NSValue(CGRect: CGRectMake(4, 5, 6, 7)))
		XCTAssertEqual(CGRectConverter.fromString("rect(4.25, 5.30,6.4, 7.5)"), NSValue(CGRect: CGRectMake(4.25, 5.3, 6.4, 7.5)))
	}
	
	func testInvalid() {
		XCTAssertNil(CGRectConverter.fromString("rect(stringvalue)"))
		XCTAssertNil(CGRectConverter.fromString("rect(4,stringvalue)"))
        XCTAssertNil(CGRectConverter.fromString("rect(4,4,4)"))
        XCTAssertNil(CGRectConverter.fromString("rect(4,5,5,a)"))
		XCTAssertNil(CGRectConverter.fromString("rect(4,stringvalue,4)"))
		
	}
	
}
