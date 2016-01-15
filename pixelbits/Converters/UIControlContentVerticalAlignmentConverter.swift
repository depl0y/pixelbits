//
//  UIControlContentVerticalAlignmentConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 14/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIControlContentVerticalAlignmentConverter {

	static func fromString(alignmentString: String) -> UIControlContentVerticalAlignment? {
		return Conversions.UIControlContentVerticalAlignments[alignmentString]
	}
	
}
