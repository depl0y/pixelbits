//
//  CGRectConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 18/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class CGRectConverter: NSObject {

	/**
	Converts a value `rect(4, 4, 4, 4)` to a CGRect struct
	
	- returns: A CGRect object or nil if invalid
	*/
	static func fromString(valueString: String) -> NSValue? {
		
		let expression = "rect\\(([0-9. ,]+?)\\)"
		
		let matches = valueString.matches(expression)
		
		if matches.count == 0 {
			return nil
		}
		
		let values = matches[0]
		let valueParts = values.characters.split { $0 == "," }.map(String.init)
		
		if valueParts.count == 1 { // Same value should be applied to all sides
			if let value = NSNumberFormatter().numberFromString(valueParts[0].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())) {
				
				let rect = CGRectMake(CGFloat(value), CGFloat(value), CGFloat(value), CGFloat(value))
				return NSValue(CGRect: rect)
				
			}
		}
		else if valueParts.count == 2 { // Apply same value to top/bottom and left/right
			
			if let verticalValue = NSNumberFormatter().numberFromString(valueParts[0].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),
				let horizontalValue = NSNumberFormatter().numberFromString(valueParts[1].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())) {
					
					let rect =  CGRectMake(CGFloat(verticalValue), CGFloat(horizontalValue), CGFloat(verticalValue), CGFloat(horizontalValue))
					return NSValue(CGRect: rect)
			}
			
		}
		else if valueParts.count == 4 { // Apply individual value to every side
			
			if let topValue = NSNumberFormatter().numberFromString(valueParts[0].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),
				let leftValue = NSNumberFormatter().numberFromString(valueParts[1].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),
				let bottomValue = NSNumberFormatter().numberFromString(valueParts[2].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),
				let rightValue = NSNumberFormatter().numberFromString(valueParts[3].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())) {
					
					let rect =  CGRectMake(CGFloat(topValue), CGFloat(leftValue), CGFloat(bottomValue), CGFloat(rightValue))
					return NSValue(CGRect: rect)
			}
			
		}
		
		return nil
	}

	
}
