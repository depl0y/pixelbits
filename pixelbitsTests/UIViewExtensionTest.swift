//
//  UIViewExtensionTest.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class UIViewExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testSetValueWithControlState() {
		
		let button = UIButton(type: UIButtonType.Custom)
		let buttonTitle = "My button title"
		
		button.setValue(buttonTitle, forKey: "Title", forState: UIControlState.Normal)
		
		XCTAssertEqual(button.titleLabel?.text, buttonTitle)
		
	}
}
