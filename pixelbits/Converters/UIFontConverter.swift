//
//  UIFontConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 09/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIFontConverter {
	
	static func fromString(fontString: String) -> UIFont? {
		
		var parts = fontString.characters.split { $0 == "," }.map(String.init)
		
		if parts.count == 1 {
			let font = UIFont(name: parts[0].variableValue(), size: 12)
			return font
		}
		else if parts.count == 2 {
            let fontName = parts[0].variableValue()
            let fontSize = parts[1].variableValue()
            
			if let fontSize = NSNumberFormatter().numberFromString(fontSize) {
				let font = UIFont(name: fontName, size: CGFloat(fontSize.floatValue))
				return font
			}
		}
		
		return nil
		
	}
	
	
}
