//
//  UIProgressViewStyleConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 20/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

internal class UIProgressViewStyleConverter {

	static func fromString(stringValue: String) -> UIProgressViewStyle? {
		return ConverterValues.UIProgressViewStyles[stringValue.variableValue()]
	}
	
}
