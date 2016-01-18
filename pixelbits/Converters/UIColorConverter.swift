//
//  UIColorConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 09/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIColorConverter : Converter {
	
	static func fromString(value: String) -> UIColor? {
		
		var colorValue = value
		
		let sel = NSSelectorFromString(colorValue + "Color")
		
		if UIColor.respondsToSelector(sel) {
			let result = UIColor.performSelector(sel)

			if let resultColor = result.takeRetainedValue() as? UIColor {
				return resultColor
			}
		}
		
		if colorValue.hasPrefix("#") {
			colorValue = colorValue.substringFromIndex(colorValue.startIndex.advancedBy(1))
			let color = UIColorConverter.fromHex(colorValue)
			
			if (color != nil) {
				return color!
			}
		}
		
		return nil
	}
	
	private static func fromHex(hexString: String) -> UIColor? {

		let hex = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet)
		
		let regex = try! NSRegularExpression(pattern: "^[0-9a-f]*$", options: .CaseInsensitive)
		
		let found = regex.firstMatchInString(hex, options: [], range: NSMakeRange(0, hex.characters.count))
		if found == nil || found?.range.location == NSNotFound {
			return nil
		}
		
		var int = UInt32()
		
		NSScanner(string: hex).scanHexInt(&int)
		
		let a, r, g, b: UInt32
		
		switch hex.characters.count {
		case 3: // RGB (12-bit)
			(a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
		case 6: // RGB (24-bit)
			(a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
		case 8: // ARGB (32-bit)
			(a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
		default:
			(a, r, g, b) = (1, 1, 1, 0)
		}
		
		return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
		
	}
	
}
