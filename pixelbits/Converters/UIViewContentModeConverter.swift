//
//  UIViewContentModeConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIViewContentModeConverter {

	static func fromString(stringValue: String) -> UIViewContentMode? {
		
		if let style = ConverterValues.UIViewContentModes[stringValue] {
			return style
		}
		
		return nil
		
	}
	
}
