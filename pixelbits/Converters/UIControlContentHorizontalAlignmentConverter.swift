//
//  UIControlContentHorizontalAlignmentConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 13/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIControlContentHorizontalAlignmentConverter {
	
	static func fromString(alignmentString: String) -> UIControlContentHorizontalAlignment? {
		return ConverterValues.UIControlContentHorizontalAlignments[alignmentString]
	}

}
