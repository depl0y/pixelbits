//
//  pathFindingTests.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import XCTest
@testable import pixelbits

class pathFindingTests: XCTestCase {
	
	var viewController = UIViewController()
	var customView = UIView()
	var button = UIButton(type: UIButtonType.Custom)
	
    override func setUp() {
        super.setUp()
		
		customView.style = "custom-view"
		button.style = "my-sample-button"
		
		viewController.view.addSubview(customView)
		customView.addSubview(button)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		
		customView.removeFromSuperview()
		button.removeFromSuperview()
		
        super.tearDown()
    }
    
    func testPathGeneration() {
		
		let viewControllerViewPath = UIViewLocation.fromView(viewController.view).toString()
		XCTAssertEqual(viewControllerViewPath, "/UIViewController/UIView")
		
		let customViewPath = UIViewLocation.fromView(customView).toString()
		XCTAssertEqual(customViewPath, "/UIViewController/UIView/UIView.custom-view")
		
		let buttonPath = UIViewLocation.fromView(button).toString()
		XCTAssertEqual(buttonPath, "/UIViewController/UIView/UIView.custom-view/UIButton.my-sample-button")
		
    }
	
	func testViewViewControllerRelation() {
		XCTAssertEqual(viewController.view.viewController, viewController)
	}
	
	func testViewNoViewControllerRelation() {
		XCTAssertNil(button.viewController)
	}
    
}
