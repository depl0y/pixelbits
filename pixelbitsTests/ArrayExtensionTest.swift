//
//  ArrayExtensionTest.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class ArrayExtensionTest: XCTestCase {
	
	var stringArray = Array<String>()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
		
		stringArray.removeAll()
    }
    
	func testRemoveObject() {
		
		let title = "My title"
		stringArray.append(title)
		
		XCTAssertNotNil(stringArray.indexOf(title))
		stringArray.removeObject(title)
		XCTAssertNil(stringArray.indexOf(title))
		
	}
	
	func testRemoveObjects() {
		let title = "My title"
		let title2 = "My title2"
		
		stringArray.append(title)
		stringArray.append(title2)
		
		XCTAssertNotNil(stringArray.indexOf(title))
		XCTAssertNotNil(stringArray.indexOf(title2))
		
		stringArray.removeObjects([ title, title2 ] )
		
		XCTAssertNil(stringArray.indexOf(title))
		XCTAssertNil(stringArray.indexOf(title2))
		
	}
    
}
