//
//  UIEdgeInsetsConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 17/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIEdgeInsetsConverter {
	
	/**
	Converts a value `insets(4, 4, 4, 4)` to a UIEdgeInsets struct
	
	- returns: A UIEdgeInsets object or nil if invalid
	*/
	static func fromString(valueString: String) -> NSValue? {
		
		let expression = "insets\\(([0-9. ,]+?)\\)"
		
		let matches = valueString.matches(expression)
		
		if matches.count == 0 {
			return nil
		}
		
		let insets = matches[0]
		let insetParts = insets.characters.split { $0 == "," }.map(String.init)
		
		// Top, Left, Bottom, Right
		
		if insetParts.count == 1 { // Same inset should be applied to all sides
			if let insetValue = NSNumberFormatter().numberFromString(insetParts[0].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())) {
				
				let edgeInsets = UIEdgeInsetsMake(CGFloat(insetValue), CGFloat(insetValue), CGFloat(insetValue), CGFloat(insetValue))
				return NSValue(UIEdgeInsets: edgeInsets)
				
			}
		}
		else if insetParts.count == 2 { // Apply same inset to top/bottom and left/right
			
			if let insetVerticalValue = NSNumberFormatter().numberFromString(insetParts[0].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),
				let insetHorizontalValue = NSNumberFormatter().numberFromString(insetParts[1].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())) {
					
					let edgeInsets =  UIEdgeInsetsMake(CGFloat(insetVerticalValue), CGFloat(insetHorizontalValue), CGFloat(insetVerticalValue), CGFloat(insetHorizontalValue))
					return NSValue(UIEdgeInsets: edgeInsets)
			}
			
		}
		else if insetParts.count == 4 { // Apply individual inset to every side
			
			if let insetTopValue = NSNumberFormatter().numberFromString(insetParts[0].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),
				let insetLeftValue = NSNumberFormatter().numberFromString(insetParts[1].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),
				let insetBottomValue = NSNumberFormatter().numberFromString(insetParts[2].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())),
				let insetRightValue = NSNumberFormatter().numberFromString(insetParts[3].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())) {
					
					let edgeInsets =  UIEdgeInsetsMake(CGFloat(insetTopValue), CGFloat(insetLeftValue), CGFloat(insetBottomValue), CGFloat(insetRightValue))
					return NSValue(UIEdgeInsets: edgeInsets)
			}
			
		}
		
		return nil
	}
	
}
