//
//  BoolConverterTest.swift
//  pixelbits
//
//  Created by Wim Haanstra on 18/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class BoolConverterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidBoolValue() {
		
		XCTAssertEqual(BooleanConverter.fromString("true"), true)
		XCTAssertEqual(BooleanConverter.fromString("yes"), true)
		XCTAssertEqual(BooleanConverter.fromString("false"), false)
		XCTAssertEqual(BooleanConverter.fromString("no"), false)
		
    }
    
}
