//
//  ValueConverterTest.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class ValueConverterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValueConverter() {

		let propertyKey = "my-key"
		
		for (key, value) in ConverterValues.NSTextAlignments {
			let prop = ValueToPropertyConverter.fromAnyObject(propertyKey, value: key)
			XCTAssertEqual(prop.key, propertyKey)
			
			if let propValue = prop.value as? Int {
				XCTAssertEqual(propValue, value.rawValue)
			}
			else {
				XCTFail()
			}
		}
		
	}
	
	
    
}
