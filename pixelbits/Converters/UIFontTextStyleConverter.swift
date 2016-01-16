//
//  UIFontTextStyleConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 14/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

internal class UIFontTextStyleConverter {
	
	static func fromString(stringValue: String) -> UIFont? {

		if let style = ConverterValues.UIFontTextStyles[stringValue] {
			return UIFont.preferredFontForTextStyle(style)
		}
		
		return nil
		
	}
	
}
