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
		XCTAssertEqual(UIColorConverter.fromString("red"), UIColor.redColor())
	}
	
	func testNSTextAlignmentConverter() {
		XCTAssertEqual(NSTextAlignmentConverter.fromString("left"), NSTextAlignment.Left)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("right"), NSTextAlignment.Right)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("center"), NSTextAlignment.Center)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("justified"), NSTextAlignment.Justified)
		XCTAssertEqual(NSTextAlignmentConverter.fromString("natural"), NSTextAlignment.Natural)
	}
	
	func testUIControlContentHorizontalAlignmentConverter() {
		XCTAssertEqual(UIControlContentHorizontalAlignmentConverter.fromString("content-horizontal-left"), UIControlContentHorizontalAlignment.Left)
		XCTAssertEqual(UIControlContentHorizontalAlignmentConverter.fromString("content-horizontal-right"), UIControlContentHorizontalAlignment.Right)
	}
	
	func testUIControlContentVerticalAlignmentConverter() {
		XCTAssertEqual(UIControlContentVerticalAlignmentConverter.fromString("content-vertical-bottom"), UIControlContentVerticalAlignment.Bottom)
		XCTAssertEqual(UIControlContentVerticalAlignmentConverter.fromString("content-vertical-top"), UIControlContentVerticalAlignment.Top)
	}
	
	func testUIControlStateConverter() {
		XCTAssertEqual(UIControlStateConverter.fromString("normal"), UIControlState.Normal)
		XCTAssertEqual(UIControlStateConverter.fromString("highlighted"), UIControlState.Highlighted)
		
		XCTAssertEqual(UIControlStateConverter.fromString("unknown-state"), UIControlState.Normal)
	}
	
}
