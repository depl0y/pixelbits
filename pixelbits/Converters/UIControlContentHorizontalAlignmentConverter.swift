//
//  UIControlContentHorizontalAlignmentConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 13/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIControlContentHorizontalAlignmentConverter : Converter {
	
	static func fromString(alignmentString: String) -> UIControlContentHorizontalAlignment? {
		return ConverterValues.UIControlContentHorizontalAlignments[alignmentString.variableValue()]
	}
	
	static func toString(value: UIControlContentHorizontalAlignment) -> String? {
		if let index = ConverterValues.UIControlContentHorizontalAlignments.indexOf( { $0.1 == value } ) {
			return ConverterValues.UIControlContentHorizontalAlignments[index].0
		}
		return nil
	}
	
	
}
