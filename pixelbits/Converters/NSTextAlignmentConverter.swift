//
//  NSTextAlignmentConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 11/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class NSTextAlignmentConverter {
	
	static func fromString(alignmentString: String) -> NSTextAlignment? {
		return ConverterValues.NSTextAlignments[alignmentString]
	}

}
