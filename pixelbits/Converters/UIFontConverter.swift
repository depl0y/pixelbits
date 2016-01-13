//
//  UIFontConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 09/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

class UIFontConverter: NSObject {
	
	static func fromString(fontString: String) -> UIFont? {
		
		var parts = fontString.characters.split { $0 == "," }.map(String.init)
		
		if parts.count == 1 {
			let font = UIFont(name: parts[0], size: 12)
			return font
		}
		else if parts.count == 2 {
			if let fontSize = NSNumberFormatter().numberFromString(parts[1]) {
				let font = UIFont(name: parts[0], size: CGFloat(fontSize.floatValue))
				return font
			}
		}
		
		return nil
		
	}
	
	
}
