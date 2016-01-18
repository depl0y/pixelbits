//
//  BooleanConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 18/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class BooleanConverter: Converter {
	
	static func fromString(value: String) -> Bool? {
		return ConverterValues.BooleanValues[value]
	}

}
