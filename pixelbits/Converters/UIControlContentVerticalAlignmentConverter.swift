//
//  UIControlContentVerticalAlignmentConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 14/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIControlContentVerticalAlignmentConverter : Converter {

	static func fromString(alignmentString: String) -> UIControlContentVerticalAlignment? {
		return ConverterValues.UIControlContentVerticalAlignments[alignmentString.variableValue()]
	}
	
	static func toString(value: UIControlContentVerticalAlignment) -> String? {
		if let index = ConverterValues.UIControlContentVerticalAlignments.indexOf( { $0.1 == value } ) {
			return ConverterValues.UIControlContentVerticalAlignments[index].0
		}
		return nil
	}
	
}
