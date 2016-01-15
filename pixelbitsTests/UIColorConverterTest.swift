//
//  testUIColorConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class UIColorConverterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testHex() {
		let pinkcolor = UIColorConverter.fromString("#efa386")!
		
		//var red, green, blue : CGFloat
		var red: CGFloat = 0
		var green: CGFloat = 0
		var blue: CGFloat = 0
		var alpha: CGFloat = 0
		
		pinkcolor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
		
		XCTAssertEqualWithAccuracy(red, 0.937, accuracy: 0.001, "")
		XCTAssertEqualWithAccuracy(green, 0.640, accuracy: 0.001, "")
		XCTAssertEqualWithAccuracy(blue, 0.525, accuracy: 0.001, "")
		
		XCTAssertNotNil(UIColorConverter.fromString("#fff"))
		XCTAssertNotNil(UIColorConverter.fromString("#efffffff"))
	}
	
	func testInvalidHex() {
		XCTAssertNil(UIColorConverter.fromString("#jklmno"))
		XCTAssertNil(UIColorConverter.fromString("dedede"))
	}
	
	func testUIColor() {
		XCTAssertEqual(UIColorConverter.fromString("red"), UIColor.redColor())
	}
	
	func testInvalidUIColor() {
		XCTAssertNil(UIColorConverter.fromString("really-weird-yellow"))
	}
    
}
