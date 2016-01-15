//
//  converterTests.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits


class converterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testHexColorConverter() {
		let pinkcolor = UIColorConverter.fromHex("#efa386")!
		
		//var red, green, blue : CGFloat
		var red: CGFloat = 0
		var green: CGFloat = 0
		var blue: CGFloat = 0
		var alpha: CGFloat = 0
		
		pinkcolor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
		
		XCTAssertEqualWithAccuracy(red, 0.937, accuracy: 0.001, "")
		XCTAssertEqualWithAccuracy(green, 0.640, accuracy: 0.001, "")
		XCTAssertEqualWithAccuracy(blue, 0.525, accuracy: 0.001, "")
	}
	
    func testUIColorConverter() {
		let redColor = UIColorConverter.fromString("red")
		XCTAssertEqual(redColor, UIColor.redColor())
    }
	
	func testTextAlignmentConverter() {
		let leftAlignment = NSTextAlignmentConverter.fromString("left")
		let rightAlignment = NSTextAlignmentConverter.fromString("right")
		
		XCTAssertEqual(NSTextAlignment.Left, leftAlignment)
		XCTAssertEqual(NSTextAlignment.Right, rightAlignment)
	}
	
}
